<?php

namespace App\Http\Controllers\site\user;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Tool; // 这里必须加上！因为下面要用 Tool::time 翻译时间

class wanxiangController extends Controller
{
    // 获取万相生图的历史列表
    public function index(Request $r)
    {
        // 1. 按照你们前台的规矩，直接从请求头获取用户 ID
        $uid = $r->header('uid');
        if (empty($uid)) {
            return $this->result(400, '未获取到用户信息', '');
        }

        // 2. 组装查询条件
        // 【关键改动】：必须加上 model = 'wan2.6-t2i'，否则万相的页面会把 Sora 的视频也查出来！
        $where = "user_id = " . $uid . " AND model = 'wan2.6-t2i'";

        // 3. 按照前端传来的 page 和 pagesize 进行查库分页
        $res['list'] = DB::table('users_create_log')
            ->whereRaw($where)
            ->orderBy('id', 'desc')
            ->offset(($r['page'] - 1) * $r['pagesize'])
            ->limit($r['pagesize'])
            ->get()->toArray();

        // 4. 查总数（前端分页组件需要用到）
        $res['total'] = DB::table('users_create_log')
            ->whereRaw($where)
            ->count();

        // 5. 数据加工：把干巴巴的时间戳，用你们的 Tool 工具翻译成人话
        if ($res['list']) {
            foreach ($res['list'] as &$v) {
                // 如果任务正在处理中，查询上游接口
                if ($v['task_status'] == 0) {
                    $url = 'https://api.your-service.com/task/' . $v['task_id']; // 替换为真实的上游接口地址
                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL, $url);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                    curl_setopt($ch, CURLOPT_TIMEOUT, 60);
                    $response = curl_exec($ch);
                    curl_close($ch);

                    if ($response !== false) {
                        $result = json_decode($response, true);
                        if ($result['status'] == 'completed') {
                            // 上游任务已完成，更新任务的完成时间
                            DB::table('users_create_log')
                                ->where('id', $v['id'])
                                ->update([
                                    'task_status'  => 1,  // 更新为已完成
                                    'completion_time' => now(),  // 记录当前时间为完成时间
                                    'res_url'      => $result['video_url'] ?? $result['url'],  // 获取视频链接
                                ]);
                        }
                    }
                }

                // 转换时间戳为可读格式
                $v['create_time'] = Tool::time($v['create_time']);
                $v['handle_time'] = $v['handle_time'] ? Tool::time($v['handle_time']) : '';
                $v['completion_time'] = $v['completion_time'] ? Tool::time($v['completion_time']) : '';  // 新增完成时间
            }
        }

        // 6. 按照你们系统的独特暗号，返回状态码 2
        return $this->result(2, '', $res);
    }
}