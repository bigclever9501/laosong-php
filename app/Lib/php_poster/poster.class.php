<?php

class poster {

    public static $errMsg = '';
    public static $config = array();
    private static $backGroundImage = '';
    private static $fontPath = '';
    private static $bgImageData = null;

    /*
     * 海报配置信息
     * @param $config array 指定的配置信息
     * @return array 合并后的完整配置信息
     */

    public static function setConfig($config = array()) {
        self::$backGroundImage = isset($config['bg_url']) ? $config['bg_url'] : '';
        self::$fontPath = dirname(__FILE__) . '/fonts/';
        $imageDefault = array(
            'url' => '', //图片路径
            'stream' => 0, //图片数据流，与url二选一
            'left' => 0,//左边距
            'top' => 0,//上边距
            'right' => 0,//有边距
            'bottom' => 0,//下边距
            'width' => 0,//宽
            'height' => 0,//高
            'radius' => 0, //圆角度数，最大值为显示宽度的一半
            'opacity' => 100//透明度
        );
        $textDefault = array(
            'text' => '',//显示文本
            'left' => 0,//左边距
            'top' => 0,//上边距
            'width' => 0, //文本框宽度，设置后可实现文字换行
            'fontSize' => 32, //字号
            'fontPath' => 'msyh.ttf', //字体文件
            'fontColor' => '255,255,255', //字体颜色
            'angle' => 0, //倾斜角度
        );

        if (isset($config['image']) && $config['image']) {
            foreach ($config['image'] as $k => $v) {
                self::$config['image'][$k] = array_merge($imageDefault, $v);
            }
        } else {
            self::$config['image'] = array();
        }
        if (isset($config['text']) && $config['text']) {
            foreach ($config['text'] as $k => $v) {
                self::$config['text'][$k] = array_merge($textDefault, $v);
            }
        } else {
            self::$config['text'] = array();
        }
        return self::$config;
    }

    /*
     * 合并生成海报
     * @param $fileName string 指定生成的图片路径，不传则直接返回图片数据流
     * @return string or bool 图片数据流或者处理结果状态
     */

    public static function make($fileName = '') {
        self::$errMsg = null;

        if (!self::$bgImageData) {
            // 使用 curl 下载背景图
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, self::$backGroundImage);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // 若证书有问题可关闭验证
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            $bgContent = curl_exec($ch);
            curl_close($ch);

            // 检查是否下载成功
            if (!$bgContent) {
                self::$errMsg = '背景图下载失败：' . self::$backGroundImage;
                return false;
            }

            // 检查图片格式
            $finfo = finfo_open(FILEINFO_MIME_TYPE); // 打开文件信息
            $mimeType = finfo_buffer($finfo, $bgContent); // 获取图片类型
            finfo_close($finfo);

            if ($mimeType !== 'image/jpeg' && $mimeType !== 'image/png') {
                self::$errMsg = '背景图格式错误，必须为 JPEG 或 PNG：' . self::$backGroundImage;
                return false;
            }

            // 使用 getimagesizefromstring() 获取图片信息
            $backgroundInfo = @getimagesizefromstring($bgContent);
            if (!$backgroundInfo) {
                self::$errMsg = '背景图格式错误：' . self::$backGroundImage;
                return false;
            }

            $bgData = imagecreatefromstring($bgContent);
            $backgroundWidth = imagesx($bgData);    //背景宽度
            $backgroundHeight = imagesy($bgData);   //背景高度
            self::$bgImageData = imageCreatetruecolor($backgroundWidth, $backgroundHeight);

            // 创建透明背景色
            $transparent = imagecolorallocatealpha(self::$bgImageData, 0, 0, 0, 127);
            imagecolortransparent(self::$bgImageData, $transparent); // 指定颜色为透明
            imagesavealpha(self::$bgImageData, true); // 保留透明颜色
            imagefill(self::$bgImageData, 0, 0, $transparent);
            imagecopyresampled(self::$bgImageData, $bgData, 0, 0, 0, 0, $backgroundWidth, $backgroundHeight, $backgroundWidth, $backgroundHeight);
        }

        $bgImgData = self::$bgImageData;
        // 处理图片
        if (self::$config['image']) {
            foreach (self::$config['image'] as $key => $val) {
                if ($val['stream']) { // 如果传的是字符串图像流
                    $info = getimagesizefromstring($val['stream']);
                    $res = imagecreatefromstring($val['stream']);
                } else {
                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL, $val['url']);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                    $response = curl_exec($ch);
                    curl_close($ch);
                    $info = getimagesizefromstring($response);

                    $function = 'imagecreatefrom' . image_type_to_extension($info[2], false);
                    if (!function_exists($function)) {
                        self::$errMsg = '图片“' . $val['url'] . '”格式不支持';
                        return false;
                    }
                    $res = imagecreatefromstring($response);
                }

                imagesavealpha($res, true); // 这里很重要
                $resWidth = $info[0];
                $resHeight = $info[1];

                if ($val['radius']) {
                    if ($val['radius'] > round($val['width'] / 2)) {
                        self::$errMsg = '图片“' . $val['url'] . '”的圆角度数最大不能超过：' . (round($val['width'] / 2));
                        return false;
                    }
                    $canvas = self::setRadiusImage($res, $resWidth, $resHeight, $val['width'], $val['height'], $val['radius']);
                } else {
                    $canvas = imagecreatetruecolor($val['width'], $val['height']);
                    // 创建透明背景色
                    $transparent = imagecolorallocatealpha($canvas, 0, 0, 0, 127);
                    imagecolortransparent($canvas, $transparent); // 指定颜色为透明
                    imagesavealpha($canvas, true); // 保留透明颜色
                    imagefill($canvas, 0, 0, $transparent);
                    imagecopyresampled($canvas, $res, 0, 0, 0, 0, $val['width'], $val['height'], $resWidth, $resHeight);
                }

                $val['left'] = $val['left'] < 0 ? $backgroundWidth - abs($val['left']) - $val['width'] : $val['left'];
                $val['top'] = $val['top'] < 0 ? $backgroundHeight - abs($val['top']) - $val['height'] : $val['top'];

                // 放置图像
                imagecopymerge($bgImgData, $canvas, $val['left'], $val['top'], $val['right'], $val['bottom'], $val['width'], $val['height'], $val['opacity']);
            }
        }

        // 处理文字
        if (self::$config['text']) {
            foreach (self::$config['text'] as $key => $val) {
                $fontPath = self::$fontPath . $val['fontPath'];
                if ($val['width']) {
                    $val['text'] = self::stringAutoWrap($val['text'], $val['fontSize'], $val['angle'], $fontPath, $val['width']);
                }

                list($R, $G, $B) = explode(',', $val['fontColor']);
                $fontColor = imagecolorallocate($bgImgData, $R, $G, $B);
                $val['left'] = $val['left'] < 0 ? $backgroundWidth - abs($val['left']) : $val['left'];
                $val['top'] = $val['top'] < 0 ? $backgroundHeight - abs($val['top']) : $val['top'];

                imagettftext($bgImgData, $val['fontSize'], $val['angle'], $val['left'], $val['top'] + $val['fontSize'], $fontColor, $fontPath, $val['text']);
            }
        }

        if ($fileName) {
            $res = ImagePng($bgImgData, $fileName, 8); // 保存到本地
            ImageDestroy($bgImgData);
            if (!$res) {
                self::$errMsg = '图片保存失败';
                return false;
            } else {
                return true;
            }
        } else {
            ob_start();
            ImagePng($bgImgData);
            $content = ob_get_contents();
            ob_end_clean();
            ImageDestroy($bgImgData);
            if (!$content) {
                self::$errMsg = '图片数据获取失败';
                return false;
            }
            return $content;
        }
    }

    /*
     * 清理海报背景缓存数据
     * @return bool 清理结果
     */
    public static function clear() {
        if (self::$bgImageData) {
            self::$bgImageData = null;
        }
        return true;
    }

    /*
     * 抛出异常信息
     * @return string 异常信息说明
     */
    public static function getErrMessage() {
        return self::$errMsg;
    }

    // 生成圆角图片
    private static function setRadiusImage(&$imgData, $resWidth, $resHeight, $w, $h, $radius = 10) {
        $img = imagecreatetruecolor($w, $h);
        $transparent = imagecolorallocatealpha($img, 0, 0, 0, 127);
        imagecolortransparent($img, $transparent);
        imagesavealpha($img, true);
        imagefill($img, 0, 0, $transparent);
        imagecopyresampled($imgData, $imgData, 0, 0, 0, 0, $w, $h, $resWidth, $resHeight);
        $r = $radius;
        for ($x = 0; $x < $w; $x++) {
            for ($y = 0; $y < $h; $y++) {
                @$rgbColor = imagecolorat($imgData, $x, $y);
                if (($x >= $radius && $x <= ($w - $radius)) || ($y >= $radius && $y <= ($h - $radius))) {
                    imagesetpixel($img, $x, $y, $rgbColor);
                } else {
                    $yx1 = $r;
                    $yy1 = $r;
                    if (((($x - $yx1) * ($x - $yx1) + ($y - $yy1) * ($y - $yy1)) <= ($r * $r))) {
                        imagesetpixel($img, $x, $y, $rgbColor);
                    }
                    $yx2 = $w - $r;
                    $yy2 = $r;
                    if (((($x - $yx2) * ($x - $yx2) + ($y - $yy2) * ($y - $yy2)) <= ($r * $r))) {
                        imagesetpixel($img, $x, $y, $rgbColor);
                    }
                    $yx3 = $r;
                    $yy3 = $h - $r;
                    if (((($x - $yx3) * ($x - $yx3) + ($y - $yy3) * ($y - $yy3)) <= ($r * $r))) {
                        imagesetpixel($img, $x, $y, $rgbColor);
                    }
                    $yx4 = $w - $r;
                    $yy4 = $h - $r;
                    if (((($x - $yx4) * ($x - $yx4) + ($y - $yy4) * ($y - $yy4)) <= ($r * $r))) {
                        imagesetpixel($img, $x, $y, $rgbColor);
                    }
                }
            }
        }
        return $img;
    }

    // 文字自动换行
    private static function stringAutoWrap($string, $fontsize, $angle, $fontface, $width) {
        $content = '';
        $arr = array();
        preg_match_all("/./u", $string, $arr);
        $letter = $arr[0];
        foreach ($letter as $l) {
            $newStr = $content . $l;
            $box = imagettfbbox($fontsize, $angle, $fontface, $newStr);
            if (($box[2] > $width) && ($content !== '')) {
                $content .= PHP_EOL;
            }
            $content .= $l;
        }
        return $content;
    }

}
