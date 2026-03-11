CREATE TABLE IF NOT EXISTS `ims_yzd_kp`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `op` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_address`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `province_id` int(11) NOT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city_id` int(11) NOT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `district_id` int(11) NOT NULL,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `is_default`(`is_default`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ai_app`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '  ',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `app_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用名称',
  `app_logo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '应用图标',
  `type` int(2) NOT NULL DEFAULT 1 COMMENT '1腾讯云 lke 2dify 3coze',
  `dify_api_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'https://api.dify.ai/v1' COMMENT 'dify api url',
  `app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bot_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'coze智能体ID',
  `add_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `use_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '应用使用描述',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '应用详情（订阅页面内容）',
  `is_alone_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '单独售卖 0不支持 1支持',
  `price_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '价格类型 1免费 2付费',
  `price_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '付费价格 ',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1上架 0下架',
  `is_try` tinyint(1) NOT NULL COMMENT '是否支持试用 0不支持 1支持 仅付费生效',
  `try_day` int(11) NOT NULL DEFAULT 0 COMMENT '试用天数 ',
  `vip_free_see` tinyint(1) NOT NULL DEFAULT 0 COMMENT '会员免费用 0关闭 1开启',
  `day_max_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '2不限制次数 1限制次数',
  `day_max_count` int(11) NOT NULL DEFAULT 0 COMMENT '每天最多使用次数',
  `is_top_quick_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '顶部快捷词条 0隐藏 1显示',
  `is_bottom_quick_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '底部快捷词条显示',
  `quick_list` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '快捷词条',
  `is_img` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可以发图片 0 否 1是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ai_app_chat_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `add_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0未删除1已删除',
  `delete_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时间',
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `dify_conversation_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'dify组id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ai_app_chat_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `group_id` int(11) NOT NULL DEFAULT 0,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用户输入文字',
  `out_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '输出文字',
  `reply_method` int(2) NOT NULL DEFAULT 0,
  `status_summary` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'initialization' COMMENT '初始化：initialization 处理中: processing, 成功: success, 失败: failed,手动停止:stop',
  `token_count` int(11) NOT NULL DEFAULT 0 COMMENT '本轮请求消耗 token 数(当包含多个过程时, 计算将汇总)',
  `elapsed` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本轮请求耗时',
  `create_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `generate_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成时间',
  `thought_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '思考过程',
  `thought_zhankai` tinyint(1) NOT NULL DEFAULT 0 COMMENT '思考过程默认状态 0收起 1展开',
  `app_id` int(11) NOT NULL,
  `img_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dify_message_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'dify消息id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ai_app_term`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `app_id` int(11) NULL DEFAULT NULL COMMENT '课程ID',
  `term_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效期时间戳 -1为永久有效',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '平台ID',
  `buy_type` int(11) NOT NULL DEFAULT 1 COMMENT '1购买 2兑换码 3助力 4购买商品赠送 5积分商城赠送 6后台 7幸运抽奖 8拼团 9密码兑换 10会员免费 11直接免费 12试用',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入课程学习时间',
  `staff_id` int(11) NOT NULL DEFAULT 0 COMMENT '店员id',
  `is_use_try` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未试用 1已试用',
  `is_try_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '当前是否是试用状态 0不是 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ai_chat_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `add_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lecturer_id` int(11) NOT NULL DEFAULT 0,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0未删除1已删除',
  `delete_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时间',
  `dify_conversation_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `lecturer_id`(`lecturer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ai_chat_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID',
  `group_id` int(11) NOT NULL DEFAULT 0,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用户输入文字',
  `out_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '输出文字',
  `reply_method` int(2) NOT NULL DEFAULT 0,
  `status_summary` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'initialization' COMMENT '初始化：initialization 处理中: processing, 成功: success, 失败: failed',
  `token_count` int(11) NOT NULL DEFAULT 0 COMMENT '本轮请求消耗 token 数(当包含多个过程时, 计算将汇总)',
  `elapsed` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本轮请求耗时',
  `create_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `generate_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成时间',
  `thought_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '思考过程',
  `thought_zhankai` tinyint(1) NOT NULL DEFAULT 0 COMMENT '思考过程默认状态 0收起 1展开',
  `dify_message_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `lecturer_id`(`lecturer_id`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ai_creation_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID',
  `template_id` int(11) NOT NULL DEFAULT 0 COMMENT '模板ID',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用户输入文字',
  `in_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发送给大模型的文字',
  `system_role` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '提示词',
  `out_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '输出文字',
  `thought_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '思考过程',
  `reply_method` int(2) NOT NULL DEFAULT 0,
  `status_summary` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'initialization' COMMENT '初始化：initialization 处理中: processing, 成功: success, 失败: failed',
  `token_count` int(11) NOT NULL DEFAULT 0 COMMENT '本轮请求消耗 token 数(当包含多个过程时, 计算将汇总)',
  `elapsed` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本轮请求耗时',
  `create_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `generate_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成时间',
  `is_collect` tinyint(1) NOT NULL DEFAULT 0 COMMENT '收藏 0未收藏 1已收藏',
  `collect_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收藏时间',
  `thought_zhankai` tinyint(1) NOT NULL DEFAULT 0 COMMENT '思考过程默认状态 0收起 1展开',
  `dify_message_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lecturer_id`(`lecturer_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ai_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `ai_app_id` int(11) NOT NULL COMMENT 'Ai应用ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户外部单号',
  `days` int(11) NOT NULL DEFAULT 0 COMMENT '多少天',
  `total_price` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL COMMENT '订单实际付款',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '后台订单备注',
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NOT NULL DEFAULT 0 COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 5会员免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付 9通过课程免费兑换 ',
  `pay_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `is_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否过售后时间 0没过 1过了',
  `cancel_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '取消订单状态 0未取消 1已取消',
  `sale_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否申请售后 0未申请 1申请了',
  `cancel_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间',
  `refund_result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款结果 0未退款 1退款成功 2退款失败',
  `refund_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态 0未售后 1售后中 2售后结束',
  `refund_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款内容',
  `refund_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款图片',
  `auto_cancel_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动取消时间',
  `auto_sales_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动过售后时间',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ai应用数据',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `ai_app_id`(`ai_app_id`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ai_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL,
  `nav_ai_tool_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '顶部栏ai对话图标显示0隐藏 1显示',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1腾讯云 2dify 3coze',
  `app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bot_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '智能体ID',
  `streaming_throttle` int(11) NOT NULL DEFAULT 0 COMMENT '流式回复频率',
  `dify_api_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'https://api.dify.ai/v1' COMMENT 'dify api url',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_album`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '分类ID',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '封面图',
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1显示 0隐藏',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `view` int(11) NOT NULL,
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_album_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `album_id` int(11) NOT NULL COMMENT '相册ID',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0隐藏 1显示',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_annex`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资料名称',
  `mode` tinyint(1) NOT NULL DEFAULT 1 COMMENT '资料模式 1单资料模式 2多资料模式',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1上传 2链接 3自定义跳转',
  `file_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文件名称',
  `file_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文件链接',
  `file_id` int(11) NOT NULL DEFAULT 0,
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '链接',
  `url_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1直接打开 2复制链接',
  `url_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type_id` int(11) NOT NULL COMMENT '分类ID',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面图',
  `try_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试看内容',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情',
  `is_alone_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '单独售卖 0不支持 1支持',
  `price_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '价格类型 1免费 2付费',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `line_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '划线价',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1上架 0下架',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联表单的ID',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `default_sales` int(11) NOT NULL DEFAULT 0 COMMENT '初始起售数',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vip_free_see` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `list_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '列表展示 1展示 0隐藏',
  `is_send_me` tinyint(1) NOT NULL DEFAULT 0 COMMENT '发送给自己 1支持 0不支持',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_annex_document`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资料标题',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'url',
  `annex_id` int(11) NOT NULL DEFAULT 0 COMMENT '资料ID',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 数字越小越靠前 默认为先添加的在前',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `annex_id`(`annex_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_annex_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `annex_id` int(11) NOT NULL COMMENT '资料ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户号',
  `total_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单实际付款',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 5会员免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付 9通过课程免费兑换 ',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `is_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否过售后时间 0没过 1过了',
  `cancel_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '取消订单状态 0未取消 1已取消',
  `sale_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否申请售后 0未申请 1申请了',
  `cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间',
  `refund_result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款结果 0未退款 1退款成功 2退款失败',
  `refund_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态 0未售后 1售后中 2售后结束',
  `refund_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款内容',
  `refund_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款图片',
  `auto_cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动取消时间',
  `auto_sales_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动过售后时间',
  `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '如果通过课程兑换的 需要有课程id',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试卷数据',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `use_user_coupon_id` int(11) NOT NULL DEFAULT 0 COMMENT '使用的用户优惠券id',
  `coupon_discount_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券优惠金额',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_article`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面图',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `type_id` int(11) NOT NULL COMMENT '分类ID',
  `default_view` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟阅读数',
  `view_num` int(11) NOT NULL DEFAULT 0 COMMENT '阅读数',
  `zan_num` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `state` int(1) NOT NULL DEFAULT 2 COMMENT '0隐藏 1显示',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为创建时间',
  `uniacid` int(11) NOT NULL COMMENT ' 平台ID',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `relation_position` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1顶部 2底部',
  `relation_course_show` tinyint(1) NOT NULL DEFAULT 0,
  `relation_course_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `relation_good_show` tinyint(1) NOT NULL DEFAULT 0,
  `relation_good_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `relation_paper_show` tinyint(1) NOT NULL DEFAULT 0,
  `relation_paper_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `relation_annex_show` tinyint(1) NOT NULL DEFAULT 0,
  `relation_annex_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `relation_enroll_show` tinyint(1) NOT NULL DEFAULT 0,
  `relation_enroll_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `poster_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1跟随系统 2自定义',
  `poster` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '海报数据',
  `article_jf_state_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1跟随系统 2自定义',
  `article_jf_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '文章积分 0关闭 1开启',
  `article_jf_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '文章积分类型1进度 2时间',
  `article_jf_count` int(11) NOT NULL DEFAULT 1 COMMENT '文章积分获得次数',
  `article_jf_number` int(11) NOT NULL DEFAULT 10 COMMENT '获得积分数量',
  `article_jf_data` int(11) NOT NULL DEFAULT 50 COMMENT '进度或时间',
  `file_list` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_article_attribute`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `article_id` int(11) NOT NULL COMMENT '自增ID',
  `is_zan` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1true赞过 0false未赞过或者取消赞',
  `is_collect` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1true收藏过 0false未收藏过或者取消收藏',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_article_comment`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT '一级评论为0  ',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '上级用户id',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0为隐藏 1为显示',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_article_jf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `article_jf_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '文章积分类型1进度 2时间',
  `article_jf_number` int(11) NOT NULL DEFAULT 0 COMMENT '获得积分数量',
  `article_jf_data` int(11) NOT NULL COMMENT '进度或时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_assess`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '测评名称',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1普通测评',
  `type_id` int(11) NOT NULL COMMENT '分类',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '封面图',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `again_test` tinyint(1) NOT NULL COMMENT '是否支持重测 1是 0否',
  `is_alone_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '单独售卖 0不支持 1支持',
  `price_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '价格类型 1免费 2付费',
  `free_submit` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0可直接测试 1需点击领取',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `line_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '划线价',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1上架 0下架',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联表单的id',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `default_sales` int(11) NOT NULL DEFAULT 0 COMMENT '初始测试人数',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `sort` int(11) NOT NULL COMMENT '排序',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject_topimg_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '上方图显示 0隐藏 1显示',
  `subject_topimg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上方图',
  `subject` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '题目内容',
  `result_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '结果设置 1统一结果 2以分数段设置',
  `fraction_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分数展示 0不显示 1显示',
  `result_text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '测试结果',
  `result_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '测试描述',
  `result_type2_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '以分数段设置结果内容',
  `relation_course` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关联课程',
  `relation_good` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关联商品',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_assess_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `assess_id` int(11) NOT NULL COMMENT '评测ID',
  `web_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '测评json',
  `app_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户json',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交时间',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '分数',
  `uniacid` int(11) NOT NULL DEFAULT 0 COMMENT '平台ID',
  `deviceType` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_assess_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `assess_id` int(11) NOT NULL COMMENT '测评ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户号',
  `total_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单实际付款',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `is_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否过售后时间 0没过 1过了',
  `cancel_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '取消订单状态 0未取消 1已取消',
  `sale_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否申请售后 0未申请 1申请了',
  `cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间',
  `refund_result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款结果 0未退款 1退款成功 2退款失败',
  `refund_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态 0未售后 1售后中 2售后结束',
  `refund_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款内容',
  `refund_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款图片',
  `auto_cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动取消时间',
  `auto_sales_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动过售后时间',
  `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '测评数据',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `use_user_coupon_id` int(11) NOT NULL DEFAULT 0 COMMENT '使用的用户优惠券id',
  `coupon_discount_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券优惠金额',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_assist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `bg_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '背景图',
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动开始时间',
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动结束时间',
  `num` int(11) NOT NULL COMMENT '助力人数',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型 1课程 2试卷 3资料 4会员卡',
  `cid` int(11) NULL DEFAULT NULL COMMENT '课程ID 或者试卷 ID 或资料ID',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '助力说明',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1正常 0失效',
  `sort` int(11) NOT NULL DEFAULT 0,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '颜色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_assist_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '第一次时间',
  `assist_id` int(11) NOT NULL COMMENT '助力活动ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `num` int(11) NOT NULL COMMENT '所需数量',
  `ok_num` int(11) NOT NULL COMMENT '已完成数量',
  `is_ok` int(1) NOT NULL DEFAULT 0 COMMENT '0未完成 1已完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_assist_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '平台ID',
  `assist_id` int(11) NOT NULL COMMENT '助力活动ID',
  `current_id` int(11) NOT NULL COMMENT '当前活动ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_assist_success_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `current_id` int(11) NOT NULL COMMENT '当前活动ID',
  `assist_id` int(11) NULL DEFAULT NULL COMMENT '活动ID',
  `assist_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据',
  `product_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品数据',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '产品类型',
  `cid` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '1未兑换 2兑换',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '助力完成时间',
  `time2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '领取时间',
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_bdapp_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `appkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'appkey',
  `appSecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'appSecret',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `app_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pay_dealid` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pay_app_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pay_private_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pay_public_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `app_public_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭',
  `token` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '登录密钥',
  `ios_pay_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS支付 1跟随全局 2自定义',
  `is_ios_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS端支付 0关闭支付 1开启支付',
  `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '由于相关规范，ios功能暂不可用' COMMENT 'IOS无法支付文案',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '圈子名称',
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '圈子简介',
  `img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '圈子封面',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '圈子详情',
  `is_alone_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '单独售卖 0不支持 1支持',
  `price_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1免费 2付费 3密码',
  `price_arr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '付费金额和周期',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `vip_free_see` tinyint(1) NOT NULL DEFAULT 0 COMMENT '会员免费看 0不支持 1支持',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '圈子状态 0隐藏 1显示',
  `add_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `manage_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '圈主用户ID',
  `join_user_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '加入人数显示 0隐藏 1显示',
  `dynamics_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '动态预览 1最新发布动态 2最新精选动态 3不显示',
  `dynamics_num` int(11) NOT NULL DEFAULT 5 COMMENT '动态预览条数',
  `join_time_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '入圈截至时间1不限制 2自定义',
  `join_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入圈截至时间',
  `sort` int(11) NOT NULL DEFAULT 9999 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_comment`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT '一级评论为0  ',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '上级用户id',
  `circle_id` int(11) NOT NULL COMMENT '圈子ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0为隐藏 1为显示',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `dynamics_id` int(11) NOT NULL COMMENT '动态ID',
  `img_list` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片列表',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `dynamics_id`(`dynamics_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_correlation_course`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `circle_id` int(11) NOT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  `add_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_dynamics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `circle_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '发布人',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0隐藏 1显示',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT ' 内容',
  `tags_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '含标签的内容',
  `file_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `img_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `video_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `audio_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `add_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qa_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '答主ID ',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0不置顶 1置顶',
  `is_refined` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0不精选 1精选',
  `view_count` int(11) NOT NULL DEFAULT 0 COMMENT '浏览数',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '0未删除 1已删除',
  `delete_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `task_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联任务的ID',
  `answer_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '答主回答状态 0未回答 1已回答',
  `answer_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作答时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_dynamics_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `circle_id` int(11) NOT NULL,
  `dynamics_id` int(11) NOT NULL COMMENT '动态ID',
  `tag_id` int(11) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `dynamics_id`(`dynamics_id`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_integrate_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `circle_id` int(11) NOT NULL COMMENT '圈子ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `integral` int(11) NOT NULL COMMENT '积分数',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '获得类型',
  `time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '获得时间',
  `extra_id` int(11) NOT NULL COMMENT '额外的ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_motivate_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `circle_id` int(11) NOT NULL COMMENT '圈子ID',
  `invite_member_join_integrate` int(11) NOT NULL DEFAULT 0 COMMENT '邀请新成员加入圈子',
  `invite_member_join_integrate_day_max` int(11) NOT NULL DEFAULT 0,
  `share_dynamics_integrate` int(11) NOT NULL DEFAULT 0 COMMENT '分享动态 ',
  `share_dynamics_integrate_day_max` int(11) NOT NULL DEFAULT 0,
  `submit_dynamics_integrate` int(11) NOT NULL DEFAULT 0 COMMENT '发布动态',
  `submit_dynamics_integrate_text_count` int(11) NOT NULL DEFAULT 0 COMMENT '动态 ≥ 多少字',
  `submit_dynamics_integrate_day_max` int(11) NOT NULL DEFAULT 0,
  `dynamics_get_refined_integrate` int(11) NOT NULL DEFAULT 0 COMMENT '动态获精选',
  `dynamics_get_refined_integrate_day_max` int(11) NOT NULL DEFAULT 0,
  `dynamics_get_zan_integrate` int(11) NOT NULL DEFAULT 0 COMMENT '动态获他人点赞',
  `dynamics_get_zan_integrate_day_max` int(11) NOT NULL DEFAULT 0,
  `dynamics_get_comment_integrate` int(11) NOT NULL DEFAULT 0 COMMENT '动态获他人评论',
  `dynamics_get_comment_integrate_day_max` int(11) NOT NULL DEFAULT 0,
  `submit_dynamics_comment_integrate` int(11) NOT NULL DEFAULT 0 COMMENT '发布评论',
  `submit_dynamics_comment_integrate_day_max` int(11) NOT NULL DEFAULT 0,
  `zan_dynamics_integrate` int(11) NOT NULL DEFAULT 0 COMMENT '点赞动态',
  `zan_dynamics_integrate_day_max` int(11) NOT NULL DEFAULT 0,
  `submit_question_integrate` int(11) NOT NULL DEFAULT 0 COMMENT '向答主提问问题',
  `submit_question_integrate_day_max` int(11) NOT NULL DEFAULT 0,
  `answer_question_integrate` int(11) NOT NULL DEFAULT 0 COMMENT '答主回答问题',
  `answer_question_integrate_day_max` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_nav`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `circle_id` int(11) NOT NULL COMMENT '圈子ID',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `circle_id` int(11) NOT NULL COMMENT '圈子ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户外部单号',
  `days` int(11) NOT NULL DEFAULT 0 COMMENT '多少天 -1永久有效',
  `total_price` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL COMMENT '订单实际付款',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '后台订单备注',
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NOT NULL DEFAULT 0 COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 5会员免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付 ',
  `pay_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `is_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否过售后时间 0没过 1过了',
  `cancel_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '取消订单状态 0未取消 1已取消',
  `sale_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否申请售后 0未申请 1申请了',
  `cancel_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间',
  `refund_result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款结果 0未退款 1退款成功 2退款失败',
  `refund_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态 0未售后 1售后中 2售后结束',
  `refund_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款内容',
  `refund_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款图片',
  `auto_cancel_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动取消时间',
  `auto_sales_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动过售后时间',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '圈子应用数据',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  `order_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '订单类型 1付费 2续费',
  `invitation_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '邀请人的用户ID',
  `is_form` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有表单 0没有 1有',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `ordercode`(`ordercode`) USING BTREE,
  INDEX `is_pay`(`is_pay`) USING BTREE,
  INDEX `cancel_state`(`cancel_state`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_poster`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `circle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `dynamics` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `circle_id` int(11) NOT NULL COMMENT '圈子ID',
  `qa_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '问答开关 0关闭 1开启',
  `qa_in_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '展示区域 1仅在问答板块展示 2所有板块展示',
  `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '下单表单ID',
  `user_submit_content` tinyint(1) NOT NULL DEFAULT 1 COMMENT '用户发布动态 0关闭 1开启',
  `user_submit_comment` tinyint(1) NOT NULL DEFAULT 1 COMMENT '用户发布评论 0关闭 1开启',
  `share_circle_content` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享圈子内容 1允许 0禁止',
  `copy_circle_content` tinyint(1) NOT NULL DEFAULT 1 COMMENT '复制圈子内容1允许 0禁止',
  `user_content_watermark` tinyint(1) NOT NULL DEFAULT 0 COMMENT '内容水印 1开启 0关闭',
  `member_list_show_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '成员列表 1全部显示 2隐藏人数 3隐藏列表 4全部隐藏',
  `buy_before_ewm_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '私域引流 0关闭 1开启',
  `buy_before_ewm_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '扫码获取更多优质服务' COMMENT '入口引导语',
  `buy_before_ewm_dia_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '弹窗标题',
  `buy_before_ewm_dia_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '弹窗描述',
  `buy_before_ewm_dia_img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '二维码',
  `buy_after_ewm_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '私域引流 0关闭 1开启',
  `buy_after_ewm_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '扫码获取更多优质服务' COMMENT '入口引导语',
  `buy_after_ewm_dia_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '弹窗标题',
  `buy_after_ewm_dia_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '弹窗描述',
  `buy_after_ewm_dia_img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '二维码',
  `jifen_ph_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '积分排行榜 0隐藏 1显示',
  `member_create_tag` tinyint(4) NULL DEFAULT 1 COMMENT '成员创建标签 0关闭 1开启',
  `copy_text` tinyint(4) NULL DEFAULT 1 COMMENT '复制文字 1开启 0关闭 默认开启',
  `speed_play` tinyint(4) NULL DEFAULT 1 COMMENT '未学完倍速播放 1开启 0关闭 默认关闭',
  `skip_play` int(11) NULL DEFAULT 1 COMMENT '未学完拖动进度条   1开启 0关闭 默认关闭',
  `dynamics_search` tinyint(4) NULL DEFAULT 1 COMMENT '圈子动态搜索 0关闭 1开启  默认开启',
  `dynamics_edit` tinyint(4) NULL DEFAULT 1 COMMENT '圈子动态编辑 0关闭 1开启 默认开启',
  `dynamics_comment_img` tinyint(1) NOT NULL DEFAULT 1 COMMENT '动态评价图片 0关闭 1开启',
  `virtual_num` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟人数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `circle_id` int(11) NOT NULL COMMENT '所属圈子id',
  `add_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '添加时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除0否1是',
  `delete_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态0隐藏1显示',
  `uniacid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '0后台创建 ',
  `permission` tinyint(1) NOT NULL DEFAULT 0 COMMENT '权限 0全员可用1仅圈主,答主可用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `is_delete`(`is_delete`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `type` int(2) NOT NULL DEFAULT 1 COMMENT '1课程 2打卡',
  `extra_type` int(2) NOT NULL DEFAULT 1 COMMENT '课程1视频 2音频 打卡1默认1',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简介',
  `img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '封面',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情',
  `sort` int(11) NOT NULL DEFAULT 9999,
  `daka_time_type` int(2) NOT NULL DEFAULT 1 COMMENT '打卡时间类型1长期打卡 2自定义打卡时间',
  `daka_strat_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '打卡开始时间',
  `daka_end_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '打卡截至时间',
  `dynamics_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '在动态内展示 0不展示 1展示',
  `task_menu_id` int(11) NOT NULL,
  `circle_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `sid_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `add_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `res_duration` int(11) NULL DEFAULT 0 COMMENT '素材时长',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `task_menu_id`(`task_menu_id`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_task_duration`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `task_id` int(11) NOT NULL COMMENT '任务id',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学习时间',
  `duration` int(11) NOT NULL COMMENT '学习时长',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `circle_id` int(11) NOT NULL COMMENT '圈子ID',
  `add_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `sid`(`task_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `add_time`) USING BTREE,
  INDEX `task_id`(`task_id`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_task_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `circle_id` int(11) NOT NULL COMMENT '圈子ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `mode` tinyint(1) NOT NULL COMMENT '任务模式 1自由模式 2顺序模式',
  `add_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT 9999,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_task_progress`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `task_id` int(11) NULL DEFAULT NULL COMMENT '任务ID',
  `is_complete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未完成 1完成',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始学习时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后学习时间',
  `complete_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完成时间',
  `end_second` int(11) NULL DEFAULT NULL COMMENT '上次最后看的秒数',
  `max_second` int(11) NULL DEFAULT NULL COMMENT '最大看的秒数（用于计算学习进度）',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `circle_id` int(11) NOT NULL COMMENT '圈子ID',
  `type` tinyint(4) NULL DEFAULT 0 COMMENT '1 课程 2打卡',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `task_id`(`task_id`) USING BTREE,
  INDEX `is_complete`(`is_complete`) USING BTREE,
  INDEX `end_second`(`end_second`) USING BTREE,
  INDEX `max_second`(`max_second`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `circle_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `term_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效期时间戳 -1为永久有效',
  `buy_type` int(11) NOT NULL COMMENT '1购买 2兑换码 3助力 4购买商品赠送 5积分商城赠送 6后台 7幸运抽奖 8拼团 9密码兑换 10广告获取 -1课程赠送',
  `add_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `last_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后访问时间',
  `staff_id` int(11) NOT NULL DEFAULT 0 COMMENT '添加店员ID',
  `is_manage` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是圈主 0是 1不是',
  `is_qa_manage` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是答主 0是 1不是',
  `manage_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '圈主介绍',
  `qa_manage_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答主头衔',
  `qa_manage_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '答主介绍',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_circle_zan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `circle_id` int(11) NOT NULL COMMENT '圈子ID',
  `dynamics_id` int(11) NOT NULL COMMENT '动态ID',
  `user_id` int(11) NOT NULL COMMENT '赞 用户ID',
  `add_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '赞的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `circle_id`(`circle_id`) USING BTREE,
  INDEX `dynamics_id`(`dynamics_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_contact`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `is_mp` tinyint(1) NOT NULL DEFAULT 1,
  `mp_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mp_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_url` tinyint(1) NOT NULL DEFAULT 0,
  `url_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_tel` tinyint(1) NOT NULL DEFAULT 0,
  `tel_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `uniacid` int(11) NOT NULL,
  `is_wx` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `wx_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信客服标题',
  `wx_corpId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信企业ID',
  `wx_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信客服链接',
  `dy_data_im_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音客服ID',
  `mp_ks_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手客服ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_core_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0显示1隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_core_option_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人IP',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型',
  `before_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作前内容',
  `after_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作后内容',
  `extra_id` int(11) NULL DEFAULT NULL COMMENT '额外的ID',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `delete_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '要删除的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `delete_time`(`delete_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_core_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `permissions` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限',
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1店员 2讲师',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_core_power`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `base_power` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限数据',
  `channel_power` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `plug_power` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `video_size` int(11) NOT NULL COMMENT '视频最大尺寸MB 0为不限制',
  `audio_size` int(11) NOT NULL COMMENT '音频最大尺寸MB',
  `img_size` int(11) NOT NULL COMMENT '图片最大尺寸MB',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `expire_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '到期时间 0代表永久有效',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` int(1) NOT NULL DEFAULT 1,
  `file_size` int(11) NOT NULL DEFAULT 0 COMMENT '文件最大尺寸MB 0为不限制',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1正常 2禁用',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_log` tinyint(1) NOT NULL DEFAULT 1 COMMENT '操作日志 0关闭 1开启',
  `log_delete_time_day` int(11) NOT NULL DEFAULT 7 COMMENT '日志保留时间',
  `last_show_ad_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次该店铺显示广告弹窗时间',
  `is_support_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '技术支持显示类型 1跟随全局 2自定义',
  `support_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '技术支持',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_core_sys`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `copyright` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_bg_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `login_left_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `top_logo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `domain` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '域名',
  `is_help_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示帮助中心按钮 1是 0否',
  `help_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '帮助中心链接',
  `is_rrsc_diy` tinyint(1) NOT NULL DEFAULT 0,
  `rrsc_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rrsc_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `douyin_class_version` int(11) NOT NULL DEFAULT 1,
  `ks_class_version` int(11) NOT NULL DEFAULT 1,
  `ad_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '广告弹窗内容',
  `ad_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '广告弹窗状态 0关闭 1开启',
  `ad_time_type` int(2) NOT NULL DEFAULT 1 COMMENT '1仅显示一次 2每隔多少天弹一次 3每次都显示',
  `ad_time_day` int(4) NOT NULL DEFAULT 1 COMMENT '每隔几天弹一次',
  `support_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '技术支持',
  `customer_service_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客服名称',
  `customer_service_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '客服二维码',
  `customer_service_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '客服头像',
  `customer_service_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客服手机号',
  `customer_service_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '客服0不显示1显示',
  `wxstore_class_version` int(11) NOT NULL DEFAULT 1,
  `order_sync_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '同步订单状态 0未完成 1已完成',
  `refund_new_version_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款新版本节点时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_core_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` int(6) NOT NULL COMMENT '盐值',
  `is_admin` tinyint(1) NULL DEFAULT 0 COMMENT '是否总管理员0不是 1是',
  `is_core_admin` tinyint(1) NULL DEFAULT NULL COMMENT '是否是某平台管理员 0不是 1是',
  `uniacid` int(11) NOT NULL COMMENT '平台id',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permission_id` int(11) NOT NULL DEFAULT 0 COMMENT '权限ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券标题',
  `type` tinyint(1) NOT NULL COMMENT '1满减券 2折扣券',
  `use_type` tinyint(1) NOT NULL COMMENT '1课程 2试卷 3资料 4商品 5当面付',
  `discount` decimal(2, 1) NULL DEFAULT NULL COMMENT '折扣率',
  `min_price` decimal(10, 2) NOT NULL COMMENT '最低消费金额',
  `jian_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `stock` int(11) NOT NULL COMMENT '库存',
  `sort` int(11) NOT NULL COMMENT '排序',
  `expire_type` tinyint(1) NOT NULL COMMENT '到期类型：1=领取后N天过期，2=指定有效期',
  `expire_day` int(11) NULL DEFAULT NULL COMMENT '有效天数，expire_type=1时',
  `begin_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效期开始时间',
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效期结束时间',
  `appoint_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定类型 1不限制 2部分产品可用 3部分产品不可用',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '使用说明',
  `can_receive_count` int(11) NOT NULL COMMENT '每人领取次数 0不限制',
  `bg_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景颜色',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `state` int(1) NOT NULL DEFAULT 1 COMMENT '1显示 0隐藏',
  `is_coupon_center` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否在领券中心显示 0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_coupon_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `unaicid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_coupon_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券ID',
  `coupon_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券数据',
  `type` int(11) NOT NULL COMMENT '1领券中心领取 2后台发券',
  `coupon_type` int(11) NOT NULL COMMENT '1满减券 2折扣券',
  `use_type` int(11) NOT NULL COMMENT '1课程 2试卷 3资料 4商品 5当面付',
  `appoint_type` int(11) NOT NULL COMMENT '指定类型 1不限制 2部分产品可用 3部分产品不可用',
  `product_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品ID',
  `receive_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '领取时间',
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始时间',
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '过期时间',
  `use_state` int(11) NOT NULL DEFAULT 1 COMMENT '1未使用 2已使用 3已过期',
  `use_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `lecturer_id` int(11) NULL DEFAULT 0 COMMENT '讲师ID',
  `type` int(11) NOT NULL COMMENT '1视频 2音频 3图文 4直播 5专栏 6电子书',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面',
  `type_id` int(11) NOT NULL COMMENT '课程分类',
  `try_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图文课程 试看图文',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程详情',
  `sort` int(11) NOT NULL COMMENT '排序 | 越小越靠前',
  `default_view` int(11) NOT NULL COMMENT '默认观看次数',
  `view` int(11) NOT NULL COMMENT '实际观看次数',
  `is_like` tinyint(1) NOT NULL DEFAULT 1 COMMENT '喜欢功能 0关闭 1开启',
  `default_like` int(11) NOT NULL COMMENT '默认喜欢次数',
  `like_num` int(11) NOT NULL COMMENT '实际喜欢次数',
  `is_alone_sale` int(11) NOT NULL COMMENT '单独售卖',
  `price_type` tinyint(1) NOT NULL COMMENT '价格类型 1免费 2付费 3密码兑换',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `line_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '划线价',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密密码 0-8位数字或字母',
  `is_relation_sale` int(11) NULL DEFAULT NULL COMMENT '关联售卖',
  `relation_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关联售卖数据',
  `state` tinyint(1) NOT NULL COMMENT '状态 1上架 0下架',
  `term_type` tinyint(1) NOT NULL COMMENT '有效期限1长期有效 2购买后多少天内有效',
  `term_day` int(11) NULL DEFAULT NULL COMMENT '多少天内有效',
  `is_try` tinyint(1) NOT NULL COMMENT '试看设置 0否 1是 2部分试看',
  `try_time` int(11) NULL DEFAULT NULL COMMENT '试看秒数',
  `is_ewm` tinyint(1) NOT NULL COMMENT '引导入群 0关闭 1开启',
  `ewm_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码标题',
  `ewm_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1自动弹出 0不自动弹出',
  `ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '二维码图片',
  `send_integral` int(11) NOT NULL DEFAULT 0 COMMENT '赠送积分数',
  `is_distribute` tinyint(1) NOT NULL COMMENT '分销开关0关闭 1开启',
  `alone_distribute` tinyint(1) NOT NULL COMMENT '单独开启分销 0关闭 1开启 ',
  `commission_type` tinyint(1) NOT NULL COMMENT '分销佣金类型 1按比例 2固定',
  `commission_1` decimal(10, 2) NULL DEFAULT NULL,
  `commission_2` decimal(10, 2) NULL DEFAULT NULL,
  `commission_3` decimal(10, 2) NULL DEFAULT NULL,
  `screen_style` tinyint(1) NOT NULL DEFAULT 1 COMMENT '全屏样式 1伪全屏 2真全屏',
  `is_screen` tinyint(1) NOT NULL COMMENT '防录屏跑马灯 0关闭 1开启',
  `is_speed_play` tinyint(1) NOT NULL COMMENT '倍速播放/快进 1允许 0禁止',
  `is_copy` tinyint(1) NOT NULL COMMENT '文字防复制 1允许 0禁止',
  `menu_style` tinyint(1) NOT NULL COMMENT '目录样式 1竖版 2横版',
  `column_menu_style` tinyint(1) NOT NULL DEFAULT 1 COMMENT '专栏目录样式 1课程列表 2简约',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `poster_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1跟随系统 2自定义',
  `poster` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '海报数据',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sales` int(11) NULL DEFAULT 0 COMMENT '销量',
  `live_type` tinyint(1) NULL DEFAULT NULL COMMENT '直播类型 1平台 2第三方',
  `live_play_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '直播播放地址',
  `live_play_type` tinyint(1) NULL DEFAULT NULL COMMENT '1横版 2竖版',
  `live_start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '直播开始时间',
  `live_end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '直播结束时间',
  `live_look_back` tinyint(1) NULL DEFAULT NULL COMMENT '是否支持回放 1支持 0不支持',
  `live_look_back_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回放地址',
  `live_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '直播暖场图',
  `live_state` tinyint(1) NULL DEFAULT NULL COMMENT '直播状态1未直播 2直播中 3结束直播',
  `is_tab_relation` tinyint(1) NOT NULL DEFAULT 0 COMMENT '相关推荐 0不显示 1显示',
  `is_relation_course` tinyint(1) NOT NULL DEFAULT 0 COMMENT '关联课程 0否 1是',
  `relation_course_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_relation_good` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0否 1是',
  `relation_good_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推荐商品',
  `vip_free_see` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `form_id` int(11) NOT NULL DEFAULT 0,
  `tab_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0跟随系统 1自定义',
  `tab_list` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'tab栏目样式',
  `keyword` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关键词',
  `sort_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '排序 0正序 1倒序',
  `live_zan_num` int(11) NOT NULL DEFAULT 0 COMMENT '直播赞数',
  `live_gift` tinyint(1) NOT NULL DEFAULT 0 COMMENT '礼物打赏 1开启 0关闭',
  `live_shop` tinyint(1) NOT NULL DEFAULT 0 COMMENT '直播带货  1开启 0关闭',
  `live_zan` tinyint(1) NOT NULL DEFAULT 0 COMMENT '直播点赞  1开启 0关闭',
  `live_muted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁言 0不禁言 1禁言',
  `live_people` int(11) NOT NULL DEFAULT 0 COMMENT '直播虚拟人数',
  `live_relation_course_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '直播带货关联课程',
  `live_socket_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'PC直播端 0不在线 1在线',
  `live_socket_fd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PC直播端 fn id',
  `list_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '列表展示 1展示 0隐藏',
  `first_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音小程序 一级分类',
  `second_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音小程序二级分类',
  `tt_res_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '抖音添加课程接口返回信息',
  `tt_product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音课程唯一ID',
  `tt_audit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音课程审核ID',
  `tt_callback_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '抖音审核回调',
  `tt_produce_status` int(11) NOT NULL DEFAULT -1 COMMENT '状态 -1未生效 1已生效',
  `tt_state` int(11) NOT NULL DEFAULT 1 COMMENT '1未提交审核 2审核中 3审核通过 4审核失败',
  `tt_is_sh` int(11) NOT NULL DEFAULT 0 COMMENT '是否已过审过 0没有 1有',
  `update_state` int(11) NOT NULL DEFAULT 2 COMMENT '更新状态 1更新中 2已完结',
  `live_people_dia` tinyint(1) NOT NULL DEFAULT 1 COMMENT '直播 在线人数列表展示 0关闭 1展示',
  `tt_anchor_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音视频挂载锚点文案',
  `two_menu_expand` tinyint(1) NOT NULL DEFAULT 0 COMMENT '二级目录全部展开 0关闭 1开启',
  `live_full_screen_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '直播全屏类型 1全屏铺满 2平铺',
  `platform_review_status` int(2) NOT NULL DEFAULT 2 COMMENT '平台审核状态 1审核中 2审核通过 3审核拒绝',
  `reject_reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '拒绝原因',
  `is_order_study` tinyint(1) NOT NULL DEFAULT 0 COMMENT '按顺序学习 0关闭 1开启',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `live_socket_fd`(`live_socket_fd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_annex`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `annex_id` int(11) NOT NULL COMMENT '资料ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序 越小越靠前',
  `sort2` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_attribute`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `is_collect` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1true收藏过 0false未收藏过或者取消收藏',
  `is_like` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1true喜欢过 0false未喜欢过或者取消喜欢',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_column`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `column_id` int(11) NULL DEFAULT NULL COMMENT '专栏课程id',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '平台ID',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序 越小越靠前',
  `sort2` int(11) NOT NULL DEFAULT 0,
  `course_type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `column_id`(`column_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `sort2`(`sort2`) USING BTREE,
  INDEX `course_type`(`course_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_comment`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT '一级评论为0  ',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '上级用户id',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0为隐藏 1为显示',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_document`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资料的标题',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '素材文件',
  `course_id` int(11) NOT NULL COMMENT '课程文件',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 1000 COMMENT '排序 数字越小越靠前 默认为先添加的在前',
  `is_self` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否转发给自己0否 1是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `uni`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_duration`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `sid` int(11) NOT NULL COMMENT '素材id',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学习时间',
  `duration` int(11) NOT NULL COMMENT '学习时长',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `add_time` date NOT NULL,
  `con_day` int(11) NOT NULL DEFAULT 0 COMMENT '连续天数',
  `deviceType` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `add_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_ebook`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `sid` int(11) NOT NULL COMMENT '电子书素材ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_ebook_progress`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `sid` int(11) NOT NULL COMMENT '素材ID',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '进度',
  `user_id` int(11) NOT NULL COMMENT '平台ID',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '格式 1pdf 2epub',
  `img_total` int(11) NOT NULL DEFAULT 0 COMMENT '图片张数 仅pdf有此字段',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_ebook_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `sid` int(11) NOT NULL COMMENT '素材ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '进度',
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '章节名',
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '章节描述',
  `time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时间',
  `img_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_ebook_user_habit`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `pdf_style` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'PDF主题',
  `epub_style` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'epub主题',
  `fontSize` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_footprint`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后浏览时间',
  `uniacid` int(11) NOT NULL COMMENT '平台id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sid` int(11) NOT NULL COMMENT '素材id',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '素材链接',
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `sort` int(11) NOT NULL COMMENT '排序 越小越靠前',
  `duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时长',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台id',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1视频 2音频',
  `second` int(11) NOT NULL COMMENT '秒数',
  `is_try` tinyint(1) NOT NULL DEFAULT 0 COMMENT '试看 0否 1是',
  `try_time` int(11) NOT NULL DEFAULT 0 COMMENT '试看秒数 0完整试看',
  `menu_id` int(11) NOT NULL DEFAULT 0 COMMENT '目录ID',
  `is_content` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示单节详情 0隐藏 1显示',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_info_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目录名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '越小越靠前',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_live_chat`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `course_id` int(11) NOT NULL COMMENT '课程id 也是房间id',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用户json',
  `type` int(11) NOT NULL COMMENT '1文字 2图片 3语音 4礼物 5带货',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `size` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `role` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色1用户 2讲师 3中控台 4机器人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_live_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `live_id` int(11) NOT NULL COMMENT '直播间ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间戳 最小粒度 1分钟',
  `total_num` int(11) NOT NULL DEFAULT 0 COMMENT '累计观看人数',
  `online_num` int(11) NOT NULL DEFAULT 0 COMMENT '在线人数',
  `offline_num` int(11) NOT NULL DEFAULT 0 COMMENT '离线人数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `live_id`(`live_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_live_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `ewm_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '私域引流状态 0关闭 1开启',
  `ewm_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '二维码图片',
  `ewm_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '进入课程交流群' COMMENT '二维码标题',
  `ewm_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码描述',
  `ewm_bottom_status` tinyint(1) NOT NULL DEFAULT 1,
  `ewm_icon_status` tinyint(1) NOT NULL DEFAULT 1,
  `history_msg_show` tinyint(1) NOT NULL DEFAULT 1,
  `live_center_console_fd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中控台 fd',
  `live_center_console_status` tinyint(1) NOT NULL DEFAULT 0,
  `notice_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0隐藏1显示',
  `notice_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `is_fake_live` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0真直播 1假直播',
  `fake_live_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '假直播url',
  `fake_live_duration` int(11) NULL DEFAULT NULL COMMENT '假直播秒数',
  `fake_live_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `live_share` tinyint(1) NULL DEFAULT 0 COMMENT '直播间分享 1开启 0关闭',
  `live_send_img` tinyint(1) NOT NULL DEFAULT 1 COMMENT '直播间是否可以发送图片0不可以 1可以',
  `show_subscribe_status` tinyint(4) NULL DEFAULT 0 COMMENT '订阅开关 0关闭 1开启 默认关闭 开启后，用户在小程序/公众号h5直播页主动订阅后，将会在推送时间接收到一次微信消息推送',
  `subscribe_auto_send_time` int(11) NULL DEFAULT 0 COMMENT '自动推送时间 0关闭自动推送 5直播前5分钟  10直播前10分钟  15、20、30、45、60 默认为0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_live_music`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标题',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'url',
  `duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时长',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_live_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户号',
  `price` decimal(10, 2) NOT NULL COMMENT '单价',
  `num` int(11) NOT NULL DEFAULT 1 COMMENT '几个',
  `total_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单实际付款',
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `user_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户数据',
  `gift_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '礼物数据',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_live_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `type` int(2) NOT NULL DEFAULT 1 COMMENT '1课程 2资料 3商品 4试卷 5超级试卷 6活动报名',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品标题',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品封面',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `explain_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '讲解状态 0未讲解 1正在讲解',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 1 2 3 4 5 6',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_live_product_user_click`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '店铺ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type` int(2) NOT NULL COMMENT '1课程 2资料 3商品 4试卷 5超级试卷 6活动报名',
  `click_num` int(11) NOT NULL DEFAULT 1 COMMENT '点击次数',
  `add_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '首次点击时间',
  `update_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后点击时间',
  `live_id` int(11) NOT NULL COMMENT '直播间ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `live_id`(`live_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_live_product_user_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '店铺ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type` int(2) NOT NULL COMMENT '1课程 2资料 3商品 4试卷 5超级试卷 6活动报名',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未支付 1已支付',
  `pay_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `price` decimal(10, 2) NOT NULL COMMENT '金额',
  `is_refund` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否退款 0未退款 1已退款',
  `refund_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款时间',
  `live_id` int(11) NOT NULL COMMENT '直播间ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `live_id`(`live_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_live_sign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sign_time` int(11) NOT NULL COMMENT '秒',
  `sign_end_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签到结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_live_sign_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `sign_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_live_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID ',
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁言状态0正常 1禁言',
  `lahei_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '拉黑状态 0正常 1拉黑',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '第一次时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后一次时间',
  `current_in_live_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '当场直播进入时间',
  `current_out_live_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '当场直播结束时间',
  `study_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '学习时长 秒',
  `zan_num` int(11) NOT NULL DEFAULT 0 COMMENT '该用户在本直播间的点赞次数',
  `uniacid` int(11) NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0 COMMENT '进过几次直播间',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT ' 0默认 -1无邀请人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_live_user_subscribe`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '店铺ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `status` int(2) NOT NULL DEFAULT 1 COMMENT '订阅状态1已订阅未发送 2发送成功 3发送失败',
  `subscribe_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订阅时间',
  `send_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发送时间',
  `error` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  `device_type` int(2) NOT NULL DEFAULT 1 COMMENT '1微信小程序 2微信公众号',
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'openid',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `device_type`(`device_type`) USING BTREE,
  INDEX `uniacid_course_user_status_device_idx`(`uniacid`, `course_id`, `user_id`, `status`, `device_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_note`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `course_id` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `second` int(11) NOT NULL DEFAULT 0,
  `add_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型 1公开 2私密',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户号',
  `total_price` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL COMMENT '订单实际付款',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '后台备注',
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NOT NULL DEFAULT 0 COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 5会员免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付 9通过课程免费兑换 ',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `is_sale` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否过售后时间 0没过 1过了',
  `cancel_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '取消订单状态 0未取消 1已取消',
  `cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间',
  `sale_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否申请售后 0未申请 1申请了',
  `refund_result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款结果 0未退款 1退款成功 2退款失败',
  `refund_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态 0未售后 1售后中 2售后结束',
  `refund_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款内容',
  `refund_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款图片',
  `auto_cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '自动取消时间',
  `auto_sales_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动过售后时间',
  `distribute_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '分销佣金',
  `surplus_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台的钱',
  `integral` int(11) NULL DEFAULT NULL COMMENT '该订单积分',
  `is_form` tinyint(1) NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有',
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `course_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程快照',
  `course_type` int(11) NOT NULL COMMENT '1视频 2音频 3图文 4直播 5专栏',
  `type` int(11) NULL DEFAULT 1 COMMENT '1普通订单',
  `term_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效期时间戳 -1为永久有效',
  `before_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '之前有效期时间戳 -1为永久有效 0为没有',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `dy_settle` tinyint(1) NOT NULL DEFAULT 0 COMMENT '抖音是否分账 0未分账 1已分账',
  `dy_settle_out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音外部分账单',
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `dy_settle_time1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音可以分账的时间',
  `dy_settle_time2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音实际分账的时间',
  `use_user_coupon_id` int(11) NOT NULL DEFAULT 0 COMMENT '使用的用户优惠券id',
  `coupon_discount_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券优惠金额',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `dy_trade` int(11) NOT NULL DEFAULT 0 COMMENT '2 抖音交易系统2.0',
  `dy_create_order_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '抖音交易系统 预下单回调',
  `dy_item_order_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dy_refund_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dy_delivery_state` int(11) NOT NULL DEFAULT 0 COMMENT '核销状态 快手：0未核销 1已核销 抖音：0待履约 1履约中 2履约完成（仅is_use_tag为1生效）',
  `phone_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `dy_order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音订单ID',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音核销时间',
  `is_use_tag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否使用抖音新版履约退款 0不使用 1使用',
  `delivery_ok_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可以核销的时间',
  `is_lecturer_mode` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否关联讲师钱包 0否 1是',
  `lecturer_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '讲师钱包金额',
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `pay_type`(`pay_type`) USING BTREE,
  INDEX `is_sale`(`is_sale`) USING BTREE,
  INDEX `cancel_state`(`cancel_state`) USING BTREE,
  INDEX `sale_state`(`sale_state`) USING BTREE,
  INDEX `refund_result`(`refund_result`) USING BTREE,
  INDEX `refund_state`(`refund_state`) USING BTREE,
  INDEX `is_form`(`is_form`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `course_type`(`course_type`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `deviceType`(`deviceType`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `idx_auto_cancel_query`(`is_pay`, `cancel_state`, `auto_cancel_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_order_dy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单ID',
  `refund_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '抖音开平侧退款单号',
  `out_refund_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开发者自定义的退款单号',
  `refund_total_amount` bigint(20) NOT NULL DEFAULT 0 COMMENT '退款金额，单位分',
  `is_all_settled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为分账后退款 0否 1是',
  `refund_type` int(2) NOT NULL DEFAULT 0 COMMENT '1：交易模板发起\r\n2：开发者发起\r\n3：商品过期自动发起退款\r\n4：抖音客服退款\r\n5：预约失败自动退款',
  `refund_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '退款原因 json数组',
  `refund_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '退款补充说明',
  `create_refund_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款发起时间',
  `handle_refund_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款处理时间',
  `refund_status` int(2) NOT NULL DEFAULT 0 COMMENT '退款状态 0退款中 1已退款 2退款失败',
  `uniacid` int(11) NOT NULL DEFAULT 0 COMMENT '店铺ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `refund_id`(`refund_id`(191)) USING BTREE,
  INDEX `out_refund_no`(`out_refund_no`(191)) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_paper`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `paper_id` int(11) NOT NULL COMMENT '试卷ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序 越小越靠前',
  `sort2` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_paper_super`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `paper_id` int(11) NOT NULL COMMENT '试卷ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序 越小越靠前',
  `sort2` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `paper_id`(`paper_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_progress`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `sid` int(11) NULL DEFAULT NULL COMMENT '素材ID',
  `is_complete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未完成 1完成',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始学习时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后学习时间',
  `complete_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完成时间',
  `end_second` int(11) NULL DEFAULT NULL COMMENT '上次最后看的秒数',
  `max_second` int(11) NULL DEFAULT NULL COMMENT '最大看的秒数（用于计算学习进度）',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `is_complete`(`is_complete`) USING BTREE,
  INDEX `end_second`(`end_second`) USING BTREE,
  INDEX `max_second`(`max_second`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_remind`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1课程',
  `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '产品ID',
  `data_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发送数据',
  `jump_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '跳转类型 1小程序 2公众号链接',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '跳转链接',
  `user_type` int(11) NOT NULL DEFAULT 1 COMMENT '1课程直接有效学员 2用户标签 3指定用户',
  `lid` int(11) NOT NULL DEFAULT 0 COMMENT '标签ID',
  `user_id_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户ID数组',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1未开始 2暂停 3完成',
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_remind_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `state` tinyint(1) NOT NULL COMMENT '0失败 1成功',
  `error` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '错误原因',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `remind_id` int(11) NOT NULL COMMENT '推送ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_share_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `share_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享设置 1读取系统设置 2自定义设置',
  `share_title_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享标题 1读取课程名称 2自定义标题',
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享标题',
  `share_desc_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享描述 1课程价格 2自定义描述',
  `share_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享描述',
  `share_img_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享图标 1课程封面 2自定义',
  `share_img_wxh5` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信公众号分享图标',
  `share_img_xcx` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '小程序分享图标',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_course_term`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程ID',
  `term_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效期时间戳 -1为永久有效',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '平台ID',
  `course_type` int(11) NULL DEFAULT NULL,
  `buy_type` int(11) NOT NULL DEFAULT 1 COMMENT '1购买 2兑换码 3助力 4购买商品赠送 5积分商城赠送 6后台 7幸运抽奖 8拼团 9密码兑换 10广告获取',
  `last_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后播放时间',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入课程学习时间',
  `staff_id` int(11) NOT NULL COMMENT '添加店员ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `course_type`(`course_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_customized_people_online_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `data_id` int(11) NOT NULL COMMENT '出图ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户外部单号',
  `model` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '模块',
  `total_price` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL COMMENT '订单实际付款',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '后台订单备注',
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NOT NULL DEFAULT 0 COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 5会员免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付 9通过课程免费兑换 ',
  `pay_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `is_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否过售后时间 0没过 1过了',
  `cancel_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '取消订单状态 0未取消 1已取消',
  `sale_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否申请售后 0未申请 1申请了',
  `cancel_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间',
  `refund_result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款结果 0未退款 1退款成功 2退款失败',
  `refund_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态 0未售后 1售后中 2售后结束',
  `refund_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款内容',
  `refund_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款图片',
  `auto_cancel_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动取消时间',
  `auto_sales_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动过售后时间',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ai应用数据',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  `distribute_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '分销佣金',
  `surplus_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '除了分销剩余的钱',
  `type` tinyint(4) NULL DEFAULT 1 COMMENT '1单人图 2双人 3多人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `data_id`(`data_id`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `is_pay`(`is_pay`) USING BTREE,
  INDEX `submit_time`(`submit_time`) USING BTREE,
  INDEX `pay_time`(`pay_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_daily`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '金句标题',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '海报封面图',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '金句内容',
  `audio_id` int(11) NULL DEFAULT NULL COMMENT '音频id',
  `audio_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '音频地址',
  `audio_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '音频标题',
  `audio_duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lecturer_id` int(11) NULL DEFAULT NULL COMMENT '讲师ID',
  `term` int(11) NULL DEFAULT NULL COMMENT '打卡期限 0位不限制 其他为几天',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  `style` int(11) NULL DEFAULT NULL COMMENT '1白色 2黑色 ',
  `is_examine` tinyint(1) NULL DEFAULT NULL COMMENT '是否审核感悟0不审核 1审核',
  `state` tinyint(1) NOT NULL COMMENT '0隐藏 1显示',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览人数',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `relation_course_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关联课程',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_daily_like`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `d_id` int(11) NOT NULL COMMENT '金句ID',
  `p_id` int(11) NOT NULL COMMENT '感悟ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '点赞时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_daily_perception`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `d_id` int(11) NOT NULL COMMENT '金句ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '感悟时间',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '感悟内容',
  `share_num` int(11) NOT NULL DEFAULT 0 COMMENT '分享数',
  `state` tinyint(1) NOT NULL COMMENT '0隐藏 1显示',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_daily_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `page_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每日金句标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_daily_sign`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `d_id` int(11) NOT NULL COMMENT '金句ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_distribute`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级ID 0为平台',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `time1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请的时间',
  `time2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理的时间',
  `jujue_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '拒绝内容',
  `state` int(11) NULL DEFAULT NULL COMMENT '1普通用户 2审核中分销商 3审核通过分销商 4审核拒绝分销商',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '0申请 1后台添加 2没申请 3课程 4商品',
  `grade` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `form_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `zfb_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '支付宝二维码',
  `wx_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信二维码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `grade`(`grade`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_distribute_grade`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `grade` int(11) NOT NULL COMMENT '1-10 等级',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '等级名称 ',
  `is_auto` tinyint(1) NOT NULL COMMENT '0不自动升级 1自动升级',
  `auto_type` tinyint(1) NOT NULL COMMENT '1下级用户数 2累计佣金',
  `auto_number` int(11) NOT NULL COMMENT '数量',
  `course_dis` tinyint(1) NOT NULL COMMENT '0关闭 1开启',
  `course_commission_type` tinyint(1) NOT NULL COMMENT '分销佣金类型1按比例 2固定',
  `course_commission_1` decimal(10, 2) NOT NULL COMMENT '一级',
  `course_commission_2` decimal(10, 2) NOT NULL COMMENT '二级',
  `course_commission_3` decimal(10, 2) NOT NULL COMMENT '三级',
  `vip_dis` tinyint(1) NOT NULL,
  `vip_commission_type` tinyint(1) NOT NULL,
  `vip_commission_1` decimal(10, 2) NOT NULL,
  `vip_commission_2` decimal(10, 2) NOT NULL,
  `vip_commission_3` decimal(10, 2) NOT NULL,
  `good_dis` tinyint(1) NOT NULL DEFAULT 1,
  `good_commission_type` tinyint(1) NOT NULL DEFAULT 1,
  `good_commission_1` decimal(10, 2) NOT NULL DEFAULT 20.00,
  `good_commission_2` decimal(10, 2) NOT NULL DEFAULT 10.00,
  `good_commission_3` decimal(10, 2) NOT NULL DEFAULT 5.00,
  `enroll_dis` tinyint(1) NOT NULL DEFAULT 1,
  `enroll_commission_type` tinyint(1) NOT NULL DEFAULT 1,
  `enroll_commission_1` decimal(10, 2) NOT NULL DEFAULT 20.00,
  `enroll_commission_2` decimal(10, 2) NOT NULL DEFAULT 10.00,
  `enroll_commission_3` decimal(10, 2) NOT NULL DEFAULT 5.00,
  `state` tinyint(1) NOT NULL COMMENT '0关闭 1开启',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `grade`(`grade`) USING BTREE,
  INDEX `is_auto`(`is_auto`) USING BTREE,
  INDEX `auto_type`(`auto_type`) USING BTREE,
  INDEX `course_dis`(`course_dis`) USING BTREE,
  INDEX `course_commission_type`(`course_commission_type`) USING BTREE,
  INDEX `vip_dis`(`vip_dis`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `vip_commission_type`(`vip_commission_type`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_distribute_grade_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dis_id` int(11) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT NULL,
  `data` int(11) NULL DEFAULT NULL,
  `old_grade` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `new_grade` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uniacid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dis_id`(`dis_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_distribute_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type` int(11) NOT NULL COMMENT '订单类型 1课程 2会员卡 3商城 4活动报名 5超级会员 6当面付 7人（客户定制）',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'json数据',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `z_money` decimal(10, 2) NOT NULL,
  `one_user_id` int(11) NOT NULL DEFAULT 0,
  `two_user_id` int(11) NOT NULL DEFAULT 0,
  `three_user_id` int(11) NOT NULL DEFAULT 0,
  `one_money` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `two_money` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `three_money` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '0未付款 1待结算 2佣金已发放 3退款',
  `uniacid` int(11) NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `one_user_id`(`one_user_id`) USING BTREE,
  INDEX `two_user_id`(`two_user_id`) USING BTREE,
  INDEX `three_user_id`(`three_user_id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_distribute_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `rank` tinyint(1) NULL DEFAULT NULL COMMENT '分销层级 0关闭 1一级 2二级 3三级',
  `in_buy` tinyint(1) NULL DEFAULT NULL COMMENT '分销内购 0关闭 1开启',
  `is_grade` tinyint(1) NULL DEFAULT NULL COMMENT '分销等级 0关闭 1开启',
  `condition` tinyint(1) NULL DEFAULT NULL COMMENT '成为分销商条件 1申请 2无条件 3购买课程',
  `is_sh` tinyint(1) NULL DEFAULT NULL COMMENT '是否需要审核 0不需要 1需要',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请顶部图片',
  `in_agreement_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '协议名称',
  `in_agreement` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请协议',
  `course_dis` tinyint(1) NULL DEFAULT NULL COMMENT '开关 0关闭 1开启',
  `course_commission_type` tinyint(1) NULL DEFAULT NULL COMMENT '佣金类型 1按比例 2按金额',
  `course_commission_1` decimal(10, 2) NULL DEFAULT NULL,
  `course_commission_2` decimal(10, 2) NULL DEFAULT NULL,
  `course_commission_3` decimal(10, 2) NULL DEFAULT NULL,
  `vip_dis` tinyint(1) NULL DEFAULT 0,
  `vip_commission_type` tinyint(1) NULL DEFAULT 1,
  `vip_commission_1` decimal(10, 2) NULL DEFAULT 20.00,
  `vip_commission_2` decimal(10, 2) NULL DEFAULT 10.00,
  `vip_commission_3` decimal(10, 2) NULL DEFAULT 2.00,
  `good_dis` tinyint(1) NOT NULL DEFAULT 0,
  `good_commission_type` tinyint(1) NOT NULL DEFAULT 1,
  `good_commission_1` decimal(10, 2) NOT NULL DEFAULT 20.00,
  `good_commission_2` decimal(10, 2) NOT NULL DEFAULT 10.00,
  `good_commission_3` decimal(10, 2) NOT NULL DEFAULT 5.00,
  `enroll_dis` tinyint(1) NOT NULL DEFAULT 0,
  `enroll_commission_type` tinyint(1) NOT NULL DEFAULT 1,
  `enroll_commission_1` decimal(10, 2) NOT NULL DEFAULT 20.00,
  `enroll_commission_2` decimal(10, 2) NOT NULL DEFAULT 10.00,
  `enroll_commission_3` decimal(10, 2) NOT NULL DEFAULT 5.00,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '平台ID',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cwfxs_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pt_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sqcwfxs_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fxdd_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `txmx_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fxyj_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wdtd_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wdfxm_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lxkf_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zyj_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ktxyj_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ytxyj_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wjsyj_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yj_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ej_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sj_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_type` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `min_price` decimal(10, 2) NULL DEFAULT NULL,
  `max_price` decimal(10, 2) NULL DEFAULT NULL,
  `commission` decimal(10, 2) NULL DEFAULT NULL,
  `notice` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fx_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分销说明',
  `fxzx_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fxyj_title2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '表单ID',
  `fx_mode` int(11) NOT NULL DEFAULT 1 COMMENT '分销模式 1静态模式 永久绑定 2动态模式 3竞争模式 4维护模式',
  `protect_day` int(11) NOT NULL DEFAULT 30 COMMENT '保护期 单位0',
  `one_order` int(11) NOT NULL DEFAULT 10 COMMENT '满足1级订单几个不解除关系',
  `rank_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分销排行状态 0关闭 1开启',
  `rank_type` int(11) NOT NULL COMMENT '0累积佣金1已发放佣金',
  `rank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '佣金排行榜' COMMENT '佣金排行名称 ',
  `rank_num` int(11) NOT NULL DEFAULT 10 COMMENT '排行显示数量',
  `rank_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '排行背景图',
  `dis_commission_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分销价格显示 0隐藏 1显示',
  `dis_commission_show_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '分销最高可得' COMMENT '分销最高可得',
  `good` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `course` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `svip` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `vip` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fxs_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '分銷商',
  `is_vip_with` tinyint(1) NOT NULL DEFAULT 0 COMMENT '仅会员可提现 0关闭 1开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_distribute_tx`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `dis_id` int(11) NOT NULL COMMENT '分销商id',
  `money` decimal(10, 2) NOT NULL COMMENT '金额',
  `txsj_money` decimal(10, 2) NOT NULL COMMENT '实际到账金额',
  `tx_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `tx_zhanghao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `time1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发生时间',
  `time2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1提现中 2已打款 3驳回',
  `tx_type` int(11) NOT NULL COMMENT '1自动 2微信 3支付宝',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `deviceType` int(11) NOT NULL,
  `reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '驳回原因',
  `zfb_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `wx_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_use_user_confirm` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否需要用户确认 用于 新版商家转账',
  `user_is_confirm` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户是否已确认收款 仅用于新版商家转账',
  `new_sjzz_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'https://pay.weixin.qq.com/doc/v3/merchant/4012712115',
  `new_sjzz_fail_reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `package_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_confirm_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_close` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否关单 0未关单 1已关单',
  `transfer_submit_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交商家转账时间',
  `transfer_handle_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理商家转账时间 比如到账时间、关单时间',
  `out_bill_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内部商家转账单号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dis_id`(`dis_id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `tx_type`(`tx_type`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `deviceType`(`deviceType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_distribute_wallet`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `dis_id` int(11) NOT NULL COMMENT '分销商id',
  `ktx_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '可提现金额',
  `ytx_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '已提现金额',
  `bktx_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '不可提现金额',
  `txz_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '提现中金额',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dis_id`(`dis_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_district`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `citycode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `adcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经度',
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '纬度',
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '高德行政区域数据' ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_diy`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `page_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页面参数',
  `items` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页面数据',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1自定义页面 2个人中心',
  `uniacid` int(11) NOT NULL,
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ad` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 0否 1是',
  `delete_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_enroll`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `form_id` int(11) NOT NULL COMMENT '关联表单ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报名标题',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `type` int(1) NOT NULL COMMENT '1线下 2线上',
  `type_id` int(11) NOT NULL COMMENT '分类ID',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 ',
  `price_type` tinyint(1) NOT NULL COMMENT '价格类型 1免费 2付费',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `line_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '划线价',
  `is_sku` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是多规格 0单规格 1多规格',
  `sku_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'sku信息',
  `state` tinyint(1) NOT NULL COMMENT '状态 1上架 0下架',
  `stock` int(11) NOT NULL COMMENT '人数限制 0无限制',
  `zong_num` int(11) NOT NULL DEFAULT 0 COMMENT '总人数限制',
  `view_num` int(11) NOT NULL DEFAULT 0 COMMENT '浏览数',
  `default_view` int(11) NOT NULL COMMENT '默认浏览数',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '实际销量',
  `virtual_sales` int(11) NOT NULL COMMENT '虚拟销量',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '积分',
  `enroll_strat_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报名开始时间',
  `enroll_end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报名结束时间',
  `active_strat_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动开始时间',
  `active_end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动结束时间',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主办方名称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主办方手机号',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `show_log` tinyint(1) NOT NULL DEFAULT 1 COMMENT '展示报名记录 0不展示 1展示',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_param` tinyint(1) NOT NULL DEFAULT 0 COMMENT '多参数 0关闭 1开启',
  `param_list` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `time_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '活动时间类型 1自定义时间 2长期活动',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_enroll_hxy`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `enroll_id` int(11) NOT NULL COMMENT '活动ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_enroll_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `enroll_id` int(11) NOT NULL COMMENT '活动ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_enroll_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `enroll_id` int(11) NOT NULL COMMENT '活动ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户号',
  `total_price` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL COMMENT '订单实际付款',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_pay` tinyint(1) NOT NULL COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 5会员免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付 9通过课程免费兑换 ',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `cancel_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '取消订单状态 0未取消 1已取消',
  `cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间',
  `auto_cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动取消时间',
  `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动数据',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `distribute_price` decimal(10, 2) NULL DEFAULT NULL,
  `surplus_price` decimal(10, 2) NULL DEFAULT NULL,
  `is_hx` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否核销 0未核销 1已核销',
  `hx_user_id` int(11) NULL DEFAULT NULL COMMENT '核销用户ID',
  `hx_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  `enroll_type` tinyint(1) NOT NULL COMMENT '活动类型',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '积分',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  `sku_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sku_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `is_pay`(`is_pay`) USING BTREE,
  INDEX `enroll_id`(`enroll_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_enroll_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `free_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '免费 字段 自定义文字',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_exchange_data`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `eid` int(11) NOT NULL COMMENT '兑换码列表ID',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兑换码',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人人商城售卖时间',
  `state` int(2) NOT NULL DEFAULT 0 COMMENT '0未兑换 1已兑换 2已作废 3已出售待兑换',
  `type` int(2) NOT NULL COMMENT '类型 1课程 2会员卡 3试卷 4资料 5超级会员卡',
  `cid` int(11) NULL DEFAULT NULL COMMENT '课程ID 或者试卷 ID',
  `term_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期限 1多少天内有效2永久有效',
  `term_day` int(11) NULL DEFAULT NULL COMMENT '多少天内有效',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `order_code` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '人人商城订单编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code`(`code`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `eid`(`eid`) USING BTREE,
  INDEX `idx_uniacid_code`(`uniacid`, `code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_exchange_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `type` int(2) NOT NULL COMMENT '类型 1课程 2会员卡 3试卷 4资料 5超级会员卡 6超级试卷',
  `cid` int(11) NULL DEFAULT NULL COMMENT '课程ID 或者试卷 ID',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_exchange_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `did` int(11) NOT NULL COMMENT '兑换码ID',
  `type` int(2) NOT NULL COMMENT '类型 1课程 2会员卡 3试卷',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兑换码',
  `cid` int(11) NULL DEFAULT NULL COMMENT '课程ID 或者试卷 ID',
  `term_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期限 1多少天内有效2永久有效',
  `term_day` int(11) NULL DEFAULT NULL COMMENT '多少天内有效',
  `data_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_exchange_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `dhm_bottom_content_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '下方内容 展示 0隐藏 1显示',
  `dhm_bottom_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '下方内容',
  `dhm_btn_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '立即兑换' COMMENT '按钮文字',
  `wxapp_link` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信小程序兑换码 link',
  `wxapp_link_expire_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '微信小程序兑换码 link 过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_express`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '100',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_delete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code`(`code`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_express_rule`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情',
  `type` tinyint(1) NOT NULL COMMENT '1按量计费 2按件计费',
  `is_default` tinyint(1) NOT NULL COMMENT '0隐藏 1显示',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_extra`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `is_grey_mode` tinyint(2) NOT NULL DEFAULT 0 COMMENT '默哀模式： 1开启 0关闭 默认关闭',
  `is_click_label` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可以点击课程详情标签 0否1是',
  `is_course_menu_search` tinyint(1) NOT NULL DEFAULT 0 COMMENT '音视频课程目录搜索 0关闭 1开启',
  `course_note_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程笔记开关 0关闭 1开启',
  `course_note_gongkai_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '笔记公开 0关闭 1开启',
  `is_share_login` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享是否要登录0否1是',
  `is_try_login` tinyint(1) NOT NULL DEFAULT 1 COMMENT '试看是否需要登录0否1是',
  `before_buy_show_menu` tinyint(4) NULL DEFAULT 1 COMMENT '购买前目录展示 1展示 0隐藏',
  `buy_course_notice_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '购课须知' COMMENT '购课须知',
  `course_free_customize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '免费' COMMENT '免费课程文字自定义',
  `course_study_people_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '课程学习人数 1显示 0隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_facepay_dis`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分销佣金类型1按比例 2固定',
  `commission_1` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `commission_2` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `commission_3` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `grade` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_facepay_market`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `is_full_minus` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启满减 0不开启 1开启',
  `full_minus_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '满减类型 1按阶梯满减 2每满xx元减xx元',
  `full_minus_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '阶梯减',
  `man_money` decimal(10, 2) NOT NULL DEFAULT 10.00 COMMENT '满多少钱',
  `jian_money` decimal(10, 2) NOT NULL DEFAULT 1.00 COMMENT '减多少钱',
  `is_integrate_deduction` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启积分抵扣 0关闭 1开启',
  `max_deduction_money` decimal(10, 2) NOT NULL DEFAULT 0.50 COMMENT '最多抵扣多少钱',
  `integrate_deduction_rate` int(11) NOT NULL DEFAULT 1 COMMENT '积分抵扣比例',
  `money_deduction_rate` decimal(10, 2) NOT NULL DEFAULT 0.01 COMMENT '钱抵扣比例',
  `is_expend_get_integrate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启消费得积分0不开启 1开启',
  `expend_get_integrate_rate` int(11) NOT NULL DEFAULT 10 COMMENT '消费得积分比例',
  `expend_get_money_rate` decimal(10, 2) NOT NULL DEFAULT 1.00 COMMENT '消费得积分比例 ',
  `qrcode_id` int(11) NOT NULL DEFAULT 0 COMMENT '码ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_facepay_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `qrcode_id` int(11) NOT NULL COMMENT '码ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户外部单号',
  `total_price` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL COMMENT '订单实际付款',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '后台订单备注',
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NOT NULL DEFAULT 0 COMMENT '-1 无需支付1微信支付 2支付宝支付 3百度小程序支付 10快手微信支付 11快手支付宝支付',
  `pay_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `is_sale` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否过售后时间 0没过 1过了',
  `cancel_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '取消订单状态 0未取消 1已取消',
  `sale_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否申请售后 0未申请 1申请了',
  `cancel_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间',
  `refund_result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款结果 0未退款 1退款成功 2退款失败',
  `refund_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态 0未售后 1售后中 2售后结束',
  `refund_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退款金额',
  `refund_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款内容',
  `refund_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款图片',
  `auto_cancel_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动取消时间',
  `auto_sales_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动过售后时间',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '当面付数据json',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  `manjian_discount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '满减的钱',
  `integrate_count` int(11) NOT NULL DEFAULT 0 COMMENT '用了多少个积分',
  `integrate_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '抵扣了多少钱',
  `integral` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消费得了多少积分',
  `distribute_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '分销佣金',
  `lecturer_id` int(11) NOT NULL DEFAULT 0,
  `surplus_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '除了分销剩余的钱',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `qrcode_id`(`qrcode_id`) USING BTREE,
  INDEX `ordercode`(`ordercode`) USING BTREE,
  INDEX `lecturer_id`(`lecturer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_facepay_poster`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `bg_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '背景图',
  `title_text` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '扫码支付' COMMENT '标题文字',
  `title_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#FFFFFF' COMMENT '标题颜色',
  `is_show_logo` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示logo 0不显示 1显示',
  `is_show_shop_name` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示店铺名称 0不显示 1显示',
  `shop_name_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#666666',
  `note` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '此处显示说明' COMMENT '文案说明',
  `note_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#666666' COMMENT '文案颜色',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_facepay_qrcode`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款码名称',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款码描述',
  `pay_money_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1自定义金额 2固定金额',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '固定金额',
  `dis_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '分销商用户ID',
  `speaker_id` int(11) NOT NULL DEFAULT 0 COMMENT '语音设备ID',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码备注',
  `market_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '权益设置类型1跟随系统 2自定义',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认 0为不默认 1为默认',
  `rand_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '随机码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `lecturer_id`(`lecturer_id`) USING BTREE,
  INDEX `is_default`(`is_default`) USING BTREE,
  INDEX `rand_code`(`rand_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_facepay_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uniacid` int(11) NOT NULL,
  `page_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '当面付' COMMENT '页面标题',
  `pay_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '立即支付' COMMENT '支付按钮',
  `use_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '使用说明',
  `is_dis` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启分销 0不开启 1开启',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_facepay_speaker`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'appid',
  `app_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'app密钥',
  `sn_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sn码',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注信息',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_feedback`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '反馈内容',
  `img_list` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '相关截图',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deviceType` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `deviceType`(`deviceType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_form`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单名称',
  `type` int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单 9商品表单 10会员下单表单 11拼团下单表单 12超级会员下单表单 13超级试卷 14圈子下单表单',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单数据',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '富文本',
  `count` int(11) NOT NULL DEFAULT 1 COMMENT '每人最多提交次数 仅DIY表单生效',
  `count_type` int(11) NOT NULL DEFAULT 1 COMMENT '是否限制 1无限制 2次数 仅DIY表单生效',
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_form_data`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单 9商品表单 10会员下单表单 11拼团下单表单 14圈子下单表单',
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单id',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户提交数据',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `uniacid` int(11) NOT NULL COMMENT '平台id',
  `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '表单ID',
  `deviceType` int(11) NOT NULL DEFAULT 0 COMMENT '端',
  `form_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '原始表单',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'vip || svip',
  `is_view` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否查看 0未查看 1已查看 仅针对DIY表单生效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `form_id`(`form_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_forum_banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '跳转路径',
  `url_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1显示 0隐藏',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_forum_comment`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT '一级评论为0  ',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '上级用户id',
  `info_id` int(11) NOT NULL COMMENT '信息ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0为隐藏 1为显示',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `article_id`(`info_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_forum_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type_id` int(11) NOT NULL COMMENT '分类ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文字',
  `imglist` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `audio` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '语音',
  `audio_durition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '音频长度',
  `video` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '视频',
  `video_height` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '视频高度',
  `video_weight` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '视频宽度',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0隐藏 1显示',
  `view_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '浏览数',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 0不置顶 1置顶',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_forum_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '论坛标题',
  `submit_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '发帖审核 0 关闭审核 1开启审核',
  `comment_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '评论审核 0关闭审核 1开启审核',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `view_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '浏览数',
  `view_fictitious` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '虚拟浏览量',
  `is_audio` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户发布音频 0关闭 1开启',
  `is_video` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户发布视频 0关闭 1开启',
  `submit_condition` int(11) NOT NULL DEFAULT 1 COMMENT '1所有人 2会员 3超级会员',
  `view_condition` int(11) NOT NULL DEFAULT 1 COMMENT '用户浏览权限1所有人 2会员 3超级会员',
  `img_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1大图 2缩略图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_forum_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1显示 0隐藏',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_forum_zan`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `info_id` int(11) NOT NULL COMMENT '信息ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_good`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '商品类型 1实体商品 2虚拟商品 3虚拟卡密',
  `type_id` int(11) NOT NULL COMMENT '商品分类',
  `imglist` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `video` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '视频地址',
  `spec` tinyint(1) NOT NULL COMMENT '规格类型 1单规格 2多规格',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `line_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '划线价',
  `kmk_id` int(11) NULL DEFAULT 0 COMMENT '卡密库ID',
  `stock` int(11) NOT NULL COMMENT '库存',
  `weight` int(11) NOT NULL COMMENT '重量',
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `skuInfoList` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'sku json',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `virtual_sales` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟销量',
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '送的积分数',
  `auto_send` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动发货 0 1',
  `send_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '自动发货内容',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情',
  `state` tinyint(1) NOT NULL COMMENT '0下架 1上架',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `serve_type` tinyint(1) NOT NULL COMMENT '服务标签1默认 2关闭 3自定义',
  `services_arr` longtext CHARACTER SET utf32 COLLATE utf32_bin NULL COMMENT '服务',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `view_num` int(11) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `freight_type` int(11) NOT NULL DEFAULT 1 COMMENT '运费类型 1默认 2选择模板 3统一运费',
  `freight_id` int(11) NULL DEFAULT NULL COMMENT '运费模板',
  `freight` decimal(10, 2) NULL DEFAULT NULL,
  `is_distribute` tinyint(1) NOT NULL COMMENT '是否开启分销 0关闭 1开启',
  `alone_distribute` tinyint(1) NULL DEFAULT NULL COMMENT '是否单独开启分销 0关闭 1开启',
  `commission_type` tinyint(1) NULL DEFAULT NULL COMMENT '1按比例 2固定',
  `commission_1` decimal(10, 2) NULL DEFAULT NULL,
  `commission_2` decimal(10, 2) NULL DEFAULT NULL,
  `commission_3` decimal(10, 2) NULL DEFAULT NULL,
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_param` tinyint(1) NOT NULL DEFAULT 0 COMMENT '参数 1开启 0关闭',
  `params` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数',
  `form_id` int(11) NOT NULL DEFAULT 0,
  `is_give` tinyint(4) NOT NULL DEFAULT 0 COMMENT '赠送开关 0关闭 1开启',
  `course_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '赠送课程',
  `poster_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1跟随系统 2自定义',
  `poster` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '海报数据',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_good_arr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `sign_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规格ID标识',
  `stock` int(11) NOT NULL COMMENT '库存',
  `kmk_id` int(11) NULL DEFAULT 0 COMMENT '卡密库ID',
  `price` decimal(10, 2) NOT NULL,
  `line_price` decimal(10, 2) NOT NULL,
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `weight` int(11) NULL DEFAULT NULL COMMENT '重量',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `good_id`(`good_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_good_attribute`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `is_collect` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1true收藏过 0false未收藏过或者取消收藏',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `good_id`(`good_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_good_comment`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `imglist` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` int(1) NOT NULL COMMENT '1好评 2中评 3差评',
  `anonymous` tinyint(1) NOT NULL COMMENT '0不匿名 1匿名',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `web_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0隐藏 1显示 ',
  `web_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `good_id`(`good_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_good_give_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1课程',
  `cid` int(11) NOT NULL COMMENT '产品ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品数据',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_good_km`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡密名称',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `use_explain` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '使用说明',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据结构',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_good_km_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '卡密内容',
  `state` int(11) NOT NULL DEFAULT 1 COMMENT '状态 1未出售 2已出售',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_id` int(11) NULL DEFAULT NULL,
  `order_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `km_id` int(11) NOT NULL COMMENT '卡密库ID',
  `uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_good_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户订单号',
  `total_price` decimal(10, 2) NOT NULL COMMENT '订单总金额(含运费)',
  `total_pay_price` decimal(10, 2) NOT NULL COMMENT '实际支付总费用(含运费）',
  `express_original_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '运费(后台修改前)',
  `express_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '运费(后台修改后)',
  `total_goods_original_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单商品总金额(优惠前)',
  `total_goods_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单商品总金额(优惠后)',
  `use_user_coupon_id` int(11) NOT NULL DEFAULT 0 COMMENT '使用的用户优惠券id',
  `coupon_discount_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券优惠金额',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '后台备注',
  `web_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发货订单备注（虚拟为发货内容）',
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付：0.未支付|1.已支付',
  `pay_type` int(11) NOT NULL DEFAULT 0 COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 5会员免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付 9通过课程免费兑换 ',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '支付时间',
  `is_sale` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '是否过售后时间 0没过 1过了',
  `cancel_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单取消状态：0未取消 1已取消',
  `cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单取消时间',
  `sale_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否申请售后 0未申请 1申请了',
  `refund_result` tinyint(1) NOT NULL COMMENT '退款结果 0未退款 1退款成功 2退款失败',
  `refund_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态 0--未售后 1--售后中 2--快递 3--售后结束',
  `refund_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款内容',
  `refund_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款图片',
  `express_id` int(11) NULL DEFAULT 0,
  `express_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `is_confirm` tinyint(1) NOT NULL DEFAULT 0 COMMENT '收货状态：0.未收货|1.已收货',
  `confirm_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '确认收货时间',
  `send_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '配送方式：0--快递配送 1--到店自提',
  `is_comment` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否评价0.否|1.是',
  `comment_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价时间',
  `shouhou_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 默认状态 1同意售后 2不同意售后',
  `refund_kdgs_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司编码',
  `refund_kdgs_bh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递编号',
  `refund_kdgs_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auto_cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '自动取消时间',
  `auto_sales_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动售后时间',
  `auto_confirm_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动确认收货时间',
  `distribute_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '分销佣金',
  `surplus_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台剩的钱',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '该订单积分',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1普通订单',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人手机号',
  `address` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '收件人地址',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户订单备注',
  `is_send` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否发货：0.未发货|1.已发货',
  `send_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货时间',
  `express` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `back_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '后台优惠(正数表示优惠，负数表示加价)',
  `province_id` int(11) NOT NULL DEFAULT 0 COMMENT '省ID',
  `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '市ID',
  `district_id` int(11) NOT NULL DEFAULT 0 COMMENT '区ID',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `good_type` int(11) NOT NULL DEFAULT 1 COMMENT '1实物 2虚拟 3卡密',
  `is_minishop` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为微信小程序交易组件支付 0不是 1是',
  `minishop_ticket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `minishop_order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_minishop_order` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0普通订单 1自定义交易组件订单',
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `scene` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单场景值',
  `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varbinary(255) NULL DEFAULT NULL COMMENT '核销时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `ordercode`(`ordercode`) USING BTREE,
  INDEX `is_pay`(`is_pay`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_good_order_batch_send`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发货时间',
  `random_code` int(11) NOT NULL DEFAULT 0 COMMENT '随机数',
  `total` int(11) NOT NULL DEFAULT 0,
  `yes` int(11) NOT NULL DEFAULT 0,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `random_code`(`random_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_good_order_detail`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品单价',
  `total_original_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品原总价(优惠前)',
  `total_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品总价(优惠后)',
  `coupon_discount_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `sign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kmk_id` int(11) NULL DEFAULT 0 COMMENT '卡密库ID',
  `good_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买商品信息',
  `is_refund` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否退款',
  `refund_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '售后状态 0--未售后 1--售后中 2--售后结束',
  `back_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '后台优惠(正数表示优惠，负数表示加价)',
  `sign` int(11) NOT NULL DEFAULT 1 COMMENT '订单标识，用于区分插件',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `one_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '一级分销佣金',
  `two_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '二级分销佣金',
  `three_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三级分销佣金',
  `sku_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `good_id`(`good_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_good_services`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_default` tinyint(1) NOT NULL COMMENT '0不默认 1默认',
  `uniacid` int(11) NOT NULL,
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `is_default`(`is_default`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_groupbuy_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动封面',
  `start_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动开始时间',
  `end_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动结束时间',
  `type` int(2) NOT NULL DEFAULT 1 COMMENT '产品类型 1课程 2试卷 3资料',
  `cid` int(11) NOT NULL COMMENT '产品ID',
  `people_num` int(11) NOT NULL COMMENT '参团人数 2-40',
  `hour` int(11) NOT NULL COMMENT '拼团时限 在此期限内如果拼团不成功自动退款（如果活动剩余时间少于拼团时限，以活动剩余时间为准）',
  `online_gather_show` tinyint(1) NOT NULL COMMENT '在线凑团 0关闭 1开启',
  `product_buy` tinyint(1) NOT NULL COMMENT '产品单买 1开启 0关闭',
  `original_price` decimal(10, 2) NOT NULL COMMENT '原价',
  `buy_price` decimal(10, 2) NOT NULL COMMENT '拼团价格',
  `team_price` decimal(10, 2) NOT NULL COMMENT '团长价格',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0下架 1上架 ',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动介绍',
  `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联表单的ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_groupbuy_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户订单号',
  `total_price` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL COMMENT '实际支付总费用',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '后台备注',
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付：0.未支付|1.已支付',
  `pay_type` int(11) NOT NULL DEFAULT 0 COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 5会员免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付 9通过课程免费兑换 ',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '支付时间',
  `refund_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款时间',
  `refund_result` tinyint(1) NOT NULL COMMENT '退款结果 0未退款 1退款成功 2退款失败',
  `refund_result_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款结果',
  `groupbuy_id` int(11) NOT NULL COMMENT '拼团活动ID',
  `group_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '团类型1发起 2参与',
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '团ID',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '产品类型 1课程 2试卷 3资料',
  `cid` int(11) NOT NULL COMMENT '产品ID',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varbinary(255) NULL DEFAULT NULL COMMENT '核销时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1拼团中 2拼团成功 3拼团失败',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据',
  `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `ordercode`(`ordercode`) USING BTREE,
  INDEX `is_pay`(`is_pay`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_groupbuy_team`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `g_id` int(11) NOT NULL COMMENT '拼团活动ID',
  `user_id` int(11) NOT NULL COMMENT '团长用户ID',
  `start_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开团时间',
  `end_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团结束时间',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拼团编号',
  `success_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完成时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1拼团中 2拼团成功 3拼团失败',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `people_num` int(11) NOT NULL DEFAULT 0 COMMENT '总人数',
  `success_num` int(11) NOT NULL DEFAULT 0 COMMENT '已成功人数',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_h5_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `is_wxpay` tinyint(1) NOT NULL COMMENT '0关闭 1开启',
  `wxpay_id` int(11) NULL DEFAULT NULL COMMENT '微信支付模板ID',
  `is_alipay` tinyint(1) NOT NULL COMMENT '0关闭 1开启',
  `alipay_id` int(11) NULL DEFAULT NULL COMMENT '支付宝支付模板ID',
  `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭',
  `ios_pay_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS支付 1跟随全局 2自定义',
  `is_ios_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS端支付 0关闭支付 1开启支付',
  `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '由于相关规范，ios功能暂不可用' COMMENT 'IOS无法支付文案',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_help`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sort` int(11) NULL DEFAULT NULL COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `state` tinyint(1) NULL DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `help_num` int(11) NOT NULL DEFAULT 0 COMMENT '有帮助数量',
  `nohelp_num` int(11) NOT NULL DEFAULT 0 COMMENT '没帮助数量',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_integral_incentive_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL DEFAULT 1 COMMENT '平台ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '领取类型 1自动领取 2手动领取',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '积分数',
  `minute` int(11) NOT NULL DEFAULT 0 COMMENT '分钟数',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '领取积分时时间戳',
  `true_timestamp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当天时间戳',
  `true_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当天时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_integral_incentive_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL DEFAULT 0 COMMENT '平台ID',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0关闭 1开启',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '学习积分激励',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '完成所有任务可获得',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_integral_mall_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告名称',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '跳转路径',
  `url_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径name',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 数字越大越靠前,默认排序为先添加的在前',
  `state` int(11) NOT NULL DEFAULT 1 COMMENT '0隐藏 1显示',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_integral_mall_good`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '1实物 2虚拟 3课程 4试卷 5资料 6超级试卷',
  `cid` int(11) NULL DEFAULT 0 COMMENT '产品ID',
  `type_id` int(11) NOT NULL COMMENT '分类ID',
  `imglist` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '销售价格',
  `line_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '划线价格',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '所需积分',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `virtual_sales` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟销量',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情',
  `state` int(11) NOT NULL DEFAULT 1 COMMENT '0下架 1上架',
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位',
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '排序',
  `view_num` int(11) NOT NULL DEFAULT 11 COMMENT '浏览量',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_integral_mall_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `good_id` int(11) NOT NULL COMMENT '商品ID ',
  `type` int(11) NOT NULL COMMENT '1实物 2虚拟 3课程 4试卷 5资料',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户订单号',
  `total_pay_price` decimal(10, 2) NOT NULL COMMENT '实际付款',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '所需积分',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人手机号',
  `address` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '收件人地址',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户订单备注',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '后台备注',
  `web_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发货订单备注（虚拟为发货内容）',
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交时间',
  `is_pay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否支付：0.未支付|1.已支付',
  `pay_type` int(11) NOT NULL DEFAULT 0 COMMENT '支付方式',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `is_send` int(11) NOT NULL DEFAULT 0 COMMENT '是否发货：0.未发货|1.已发货',
  `send_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货时间',
  `cancel_state` int(11) NOT NULL DEFAULT 0 COMMENT '订单取消状态：0未取消 1已取消',
  `cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间',
  `express_id` int(11) NULL DEFAULT NULL,
  `express_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `express` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `is_confirm` int(11) NOT NULL DEFAULT 0 COMMENT '收货状态：0.未收货|1.已收货',
  `confirm_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货时间',
  `auto_cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动取消时间',
  `auto_confirm_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动确认收货时间',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省ID',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '市ID',
  `district_id` int(11) NULL DEFAULT NULL COMMENT '区ID',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_integral_mall_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 数字越大越靠前,默认排序为先添加的在前',
  `state` int(11) NOT NULL DEFAULT 1 COMMENT '0隐藏 1显示',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ksapp_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ksapp_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'appid',
  `appsecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密钥',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭',
  `pay_type` int(11) NOT NULL DEFAULT 1297 COMMENT '支付 服务类目',
  `upload_private_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上传密钥',
  `ios_pay_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS支付 1跟随全局 2自定义',
  `is_ios_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS端支付 0关闭支付 1开启支付',
  `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '由于相关规范，ios功能暂不可用' COMMENT 'IOS无法支付文案',
  `kuaishou_course` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否接入课程库0未接入 1已接入',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ksapp_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `second_category` int(11) NOT NULL COMMENT '二级类目ID',
  `ks_course_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程ID',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '课程版本',
  `sh_status` int(11) NOT NULL DEFAULT 0 COMMENT '审核状态 0待提审 2审核通过 3审核拒绝 4审核中',
  `sj_status` int(1) NOT NULL DEFAULT 2 COMMENT '上架状态 1上架 2下架',
  `reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交审核时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ksapp_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type` int(11) NOT NULL COMMENT '1上传图片 2订单信息同步 3分账 4上传图片、视频、音频 5课程审核',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `extra` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他数据 字符串',
  `extra2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他数据 json',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ksapp_resource`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '素材路径',
  `uri` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '快手返回资源uri',
  `resource_type` int(11) NOT NULL DEFAULT 1 COMMENT '1图片 2视频 3音频',
  `message_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志id，用于查询错误',
  `json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '快手响应信息',
  `state` int(11) NOT NULL DEFAULT -1 COMMENT '资源上传状态 -1未上传 1处理中 2处理成功 3处理失败 4视频上传失败',
  `state_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '资源上传回调信息',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核失败原因',
  `audit_status` int(1) NOT NULL DEFAULT 0 COMMENT '审核状态 0待提审 2审核通过 3审核拒绝 4审核中',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_lecturer`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '讲师名称',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '讲师手机号',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 越小越靠前',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0隐藏 1显示',
  `uniacid` int(11) NOT NULL COMMENT '平台ID ',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细介绍',
  `sex` tinyint(1) NOT NULL COMMENT '1男 2女',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `object_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '资质类型选择：1-老师，2-机构',
  `true_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师真实姓名',
  `first_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仅老师 一级讲师分类',
  `second_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仅老师 二级讲师分类',
  `third_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仅老师 三级讲师分类 暂为0',
  `ID_number` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '老师要求输入合法的中国大陆身份证号码',
  `ID_img_uris` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '老师身份证图片uri列表，需要调用上传资源接口后获得uri，要求必须上传正反面身份证图片，数量为2',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '老师介绍 字符长度限制\r\n\r\n1 <= len <=2000（汉字占2字符） 	\r\n机构介绍，\r\n\r\n字符长度限制12<=len<= 200(汉字占 2 字符)',
  `qualification_info_lst` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '资质信息列表',
  `institution_scene_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '线上机构' COMMENT '机构场景类型（仅可填写\"线上机构\"或\"线下机构\"）',
  `institution_subject_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '企业工商户' COMMENT '机构主体类型（仅可填写\"企业工商户\"或\"个体工商户\"）',
  `tt_res_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '添加资质接口返回信息',
  `tt_object_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tt_audit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tt_produce_status` int(11) NULL DEFAULT NULL COMMENT '状态 -1未生效 1已生效',
  `tt_callback_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `company_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '企业名称',
  `institution_introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '机构介绍',
  `legal_person_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构法人姓名',
  `legal_person_ID_number` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '机构法人身份证号码，要求输入合法的中国大陆身份证号码',
  `legal_person_ID_img_uris` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '机构法人身份证图片uri列表，需要调用上传后获得，要求必须上传正反面身份证图片，数量为2',
  `tt_state` int(11) NOT NULL DEFAULT 1 COMMENT '1未提交审核 2审核中 3审核通过 4审核失败',
  `tt_is_sh` int(11) NOT NULL DEFAULT 0 COMMENT '是否已过审过资质 0没有 1有',
  `take_proportion_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '抽成比例 1跟随全局 2自定义',
  `take_proportion` decimal(10, 2) NOT NULL DEFAULT 10.00 COMMENT '自定义的抽成比例',
  `audit_status` int(2) NOT NULL DEFAULT 1 COMMENT '审核状态0审核中 1审核通过 2审核驳回',
  `refuse_reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '驳回原因',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联用户ID',
  `alipay_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝姓名',
  `alipay_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝账号',
  `alipay_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '支付宝收款码图片',
  `wechat_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信姓名',
  `wechat_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信账号',
  `wechat_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信收款二维码',
  `bank_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡账号',
  `bank_people_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '持卡人名称',
  `bank_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '开户行名称',
  `login_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `login_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_lecturer_mch_income_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `lecturer_id` int(11) NOT NULL COMMENT '讲师ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `type` int(3) NOT NULL DEFAULT 1 COMMENT '1课程',
  `total_money` decimal(10, 2) NOT NULL COMMENT '总金额',
  `reality_money` decimal(10, 2) NOT NULL COMMENT '实际金额',
  `status` int(3) NOT NULL COMMENT '状态1已支付 2已过售后 3已退款成功',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `ordercode` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `pay_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `settle_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算时间 过售后时间',
  `refund_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款成功时间',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_lecturer_mch_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `is_mch` tinyint(1) NOT NULL DEFAULT 0 COMMENT '开关 1开启 0关闭',
  `audit_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '课程创建审核 1需要审核 2免审核',
  `audit_update_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '课程更新审核 1需要审核 2免审核',
  `settled_top_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上方图片',
  `settled_agreement` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '协议',
  `default_role_id` int(11) NOT NULL DEFAULT 0 COMMENT '默认关联角色',
  `withdrawal_mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现方式[\"wxpay\",\"alipay\",\"bank\"]',
  `withdrawal_min_money` decimal(10, 2) NOT NULL DEFAULT 10.00 COMMENT '最低提现金额',
  `withdrawal_max_money` decimal(10, 2) NOT NULL DEFAULT 10000.00 COMMENT '最高提现金额',
  `withdrawal_rate` decimal(10, 2) NOT NULL DEFAULT 5.00,
  `withdrawal_note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '提现须知',
  `take_proportion` decimal(10, 2) NOT NULL DEFAULT 20.00 COMMENT '抽成比例',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_lecturer_mch_withdrawal_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现类型 1微信 2支付宝 3银行',
  `status` int(2) NOT NULL DEFAULT 1 COMMENT '提现状态 1提现中 2提现成功 3提现驳回',
  `lecturer_id` int(11) NOT NULL COMMENT '讲师ID',
  `apply_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请时间',
  `handle_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理时间',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '提现金额',
  `withdrawal_rate` decimal(10, 2) NOT NULL COMMENT '提现比例',
  `sj_money` decimal(10, 2) NOT NULL COMMENT '实际到账',
  `reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '原因',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '二维码',
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行名称',
  `img_note_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '打款图片备注',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_live_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type` tinyint(1) NOT NULL COMMENT '1腾讯云 2阿里云',
  `tx_tl_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tx_tl_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tx_ll_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tx_ll_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `al_tl_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `al_tl_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `al_ll_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `al_ll_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uniacid` int(11) NOT NULL,
  `live_auth` tinyint(1) NOT NULL DEFAULT 1 COMMENT '实时音视频播放权限 0关闭video 1开启live_player',
  `forbidden_words` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '违禁词',
  `gift` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '礼物',
  `auto_playback` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动回放 0关闭 1开启',
  `domain_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回放存储域名',
  `live_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1标准直播 2快直播',
  `callback_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调密钥',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_luck`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type` tinyint(1) NOT NULL COMMENT '1九宫格 2大转盘',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动开始时间',
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动结束时间',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '消耗积分数',
  `total_count_type` int(11) NOT NULL COMMENT '用户总抽奖次数设置 0不限制 1限制',
  `total_count` int(11) NOT NULL DEFAULT 10 COMMENT '用户总抽奖次数',
  `day_count` int(11) NOT NULL DEFAULT 0 COMMENT '每人每天抽奖次数',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '抽奖规则',
  `top_bg_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '顶部背景图',
  `bg_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1纯色 2渐变色',
  `bg_top_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下方背景色',
  `bg_bottom_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下方渐变颜色    ',
  `prize` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '奖品设置',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_luck_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `luck_id` int(11) NOT NULL COMMENT '活动ID',
  `integral` int(11) NOT NULL COMMENT '消耗积分数',
  `type` int(11) NOT NULL COMMENT '中奖类型 1谢谢参与 2积分 3课程 4资料 5试卷 6会员卡 7超级会员卡',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `term_type` int(11) NULL DEFAULT NULL COMMENT '有效期限 1多少天内有效2永久有效',
  `term_day` int(11) NULL DEFAULT NULL COMMENT '多少天内有效',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '礼物数据',
  `time1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1未领取 2已领取',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_message`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `state` tinyint(1) NOT NULL COMMENT '0禁用 1使用',
  `type` int(11) NOT NULL COMMENT '1阿里云 2腾讯云 3短信客 4联麓信息',
  `sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名',
  `access_key_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云access_key_id',
  `access_key_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云access_key_secret',
  `tx_appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '腾讯云appid',
  `tx_appkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '腾讯云appkey',
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '管理员手机号json',
  `is_code` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭',
  `code_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码模板ID',
  `is_yhxdtz` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭',
  `is_yhxdtz_free_send` tinyint(1) NOT NULL DEFAULT 1 COMMENT '免费订单是否提醒 0不提醒 1提醒',
  `yhxdtz_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户下单通知',
  `is_xyhzctz` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1开启 0关闭',
  `xyhzctz_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新用户注册通知',
  `uniacid` int(11) NOT NULL,
  `is_groupbuy` tinyint(1) NOT NULL DEFAULT 0,
  `groupbuy_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dxk_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信客密码',
  `dxk_spid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信客spid',
  `lianlu_mch_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联麓 企业Id',
  `lianlu_tz_appid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联麓 通知短信appid',
  `lianlu_tz_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联麓 通知短信key',
  `lianlu_yx_appid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联麓 营销短信appid',
  `lianlu_yx_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联麓 营销短信key',
  `is_wxstore_buy_tz` tinyint(1) NOT NULL DEFAULT 0 COMMENT '微信小店短信通知 1开启 0关闭',
  `wxstore_buy_tz_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信小店短信通知 模板ID',
  `wxstore_buy_tz_msg_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1通知短信 2营销短信',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_message_center`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '通知内容',
  `time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时间',
  `is_read` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读 0未读 1已读',
  `type` tinyint(1) NOT NULL COMMENT '1DIY表单提交 2课程申请退款 3商品申请退款 4分销商入驻审核 5分销商提现 6讲师入驻审核 7讲师提现审核 8文章评论审核 9用户反馈 10论坛发帖审核 11论坛评论审核 12投票报名审核',
  `lecturer_id` int(11) NOT NULL COMMENT '讲师ID',
  `data_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `extra_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `is_read`(`is_read`) USING BTREE,
  INDEX `lecturer_id`(`lecturer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_minishop_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `service_agent_path` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `service_agent_phone` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `service_agent_type` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `receiver_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `detailed_address` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tel_number` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `country` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `province` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `city` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `town` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `sceneCheck` tinyint(1) NOT NULL DEFAULT 1 COMMENT '场景校验 1需要校验 0无需校验',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_nav`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台名称',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据',
  `wxapp` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支持微信小程序',
  `wxh5` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支持微信公众号',
  `h5` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支持h5',
  `app` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支持app',
  `ttapp` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支持头条小程序',
  `bdapp` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支持百度小程序',
  `ksapp` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支持快手小程序',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_notice`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0隐藏 1显示',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为创建时间',
  `uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_order_center`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `total_pay_price` decimal(10, 2) NOT NULL,
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `deviceType` int(11) NULL DEFAULT NULL,
  `type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `is_pay` int(2) NOT NULL DEFAULT 0,
  `lecturer_id` int(11) NOT NULL DEFAULT 0,
  `pay_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商户侧单号',
  `is_huifu` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `ordercode`(`ordercode`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `lecturer_id`(`lecturer_id`) USING BTREE,
  INDEX `submit_time`(`submit_time`) USING BTREE,
  INDEX `pay_time`(`pay_time`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `deviceType`(`deviceType`) USING BTREE,
  INDEX `is_pay`(`is_pay`) USING BTREE,
  INDEX `pay_trade_no`(`pay_trade_no`) USING BTREE,
  INDEX `is_huifu`(`is_huifu`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_order_center_refund_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID ',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单类型',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `money` decimal(10, 2) NOT NULL COMMENT '金额',
  `status` int(2) NOT NULL DEFAULT 1 COMMENT '状态 1用户提交退款 2同意退款 3拒绝退款 4后台强制退款 5同意售后 6拒绝售后',
  `time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '时间',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `img_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图片',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文字',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_paper`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试名称',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1练习模式 2考试模式',
  `type_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面图',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `question_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联的题库ID',
  `time_limit_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '做题时间是否限制 1不限制 2总时间',
  `time_limit` int(11) NOT NULL DEFAULT 0 COMMENT '限制时长 单位分钟',
  `again_test` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否支持重测 1是 0否',
  `is_suspend` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否支持暂停 0不支持 1支持',
  `is_jump_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '练习模式答对跳转 1答对自动跳转下一题 2答对停留在此题目并显示答案及解析',
  `is_ranking` tinyint(1) NOT NULL DEFAULT 1 COMMENT '排行榜 0关闭 1开启',
  `is_alone_sale` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 1 COMMENT '单独售卖 0不支持 1支持',
  `price_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '价格类型 1免费 2付费',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `line_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '划线价',
  `is_relation_sale` tinyint(1) NULL DEFAULT NULL COMMENT '关联课程售卖 1关联 0不关联',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1上架 0下架',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联表单的id',
  `is_cert` tinyint(1) NULL DEFAULT NULL COMMENT '发放证书 0否 1是',
  `cert_score` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '达到多少分发放证书',
  `url_type` int(11) NULL DEFAULT 1 COMMENT '1首页 2试卷详情页',
  `cert_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书名称',
  `cert_img_type` tinyint(1) NULL DEFAULT NULL COMMENT '证书背景类型 1默认 2自定义',
  `cert_img_style` int(11) NULL DEFAULT NULL COMMENT '图片样式',
  `cert_img_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片路径',
  `cert_text_type` tinyint(1) NULL DEFAULT NULL COMMENT '1默认文案 2自定义文案',
  `cert_text_style` int(11) NULL DEFAULT NULL COMMENT '文字样式',
  `cert_text_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cert_text_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cert_text_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `default_sales` int(11) NOT NULL DEFAULT 0 COMMENT '初始起售数',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_lable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '标签 0关闭 1开启 ',
  `lable_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签文字',
  `lable_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签颜色',
  `people` int(11) NOT NULL DEFAULT 0 COMMENT '测试人数',
  `vip_free_see` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `list_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '列表展示 1展示 0隐藏',
  `is_view_log` tinyint(1) NOT NULL DEFAULT 1 COMMENT '试卷详情页是否可以看到 查看道题记录按钮 0隐藏 1显示',
  `is_auto_join_wrong` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否自动加入错题本 0关闭 1开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_paper_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `paper_id` int(11) NOT NULL COMMENT '试卷ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户号',
  `total_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单实际付款',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 5会员免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付 9通过课程免费兑换 ',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `is_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否过售后时间 0没过 1过了',
  `cancel_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '取消订单状态 0未取消 1已取消',
  `sale_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否申请售后 0未申请 1申请了',
  `cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间',
  `refund_result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款结果 0未退款 1退款成功 2退款失败',
  `refund_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态 0未售后 1售后中 2售后结束',
  `refund_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款内容',
  `refund_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款图片',
  `auto_cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动取消时间',
  `auto_sales_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动过售后时间',
  `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '如果通过课程兑换的 需要有课程id',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试卷数据',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `use_user_coupon_id` int(11) NOT NULL DEFAULT 0 COMMENT '使用的用户优惠券id',
  `coupon_discount_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券优惠金额',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_pay`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付模板名称',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '1微信 2支付宝',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '1微信普通商户 2微信服务商 3支付宝',
  `wx_appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号/小程序 (AppID)',
  `wx_mch_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付商户号',
  `wx_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付密钥',
  `wx_apiclient_cert` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信支付apiclient_cert',
  `wx_apiclient_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信支付apiclient_key',
  `wx_fws_appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信服务商公众号appid',
  `wx_fws_mch_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信服务商支付商户号',
  `alipay_app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用AppID',
  `alipay_public_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '支付宝公钥alipay_public_key',
  `alipay_app_private_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '支付宝应用私钥alipay_private_key',
  `alipay_app_public_cert` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '支付宝应用公钥appCertPublicKey',
  `alipay_rootcert` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '支付宝根证书alipay_rootcert',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `zhuanzhang_type` int(11) NOT NULL DEFAULT 1 COMMENT '1企业付款到零钱 2商家转账到零钱 3商家转账（新版）',
  `wx_key_v3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付V3密钥',
  `wx_platform_cert_serial_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付 平台证书序列号',
  `wx_platform_cert` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信支付 平台证书',
  `wx_signature_verification_mode` tinyint(1) NOT NULL DEFAULT 1 COMMENT '回调验签模式 1平台证书 2微信支付公钥',
  `wx_public_key_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付 公钥ID',
  `wx_public_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信支付 公钥内容',
  `huifu_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇付商户号',
  `huifu_sys_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇付系统ID',
  `huifu_product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇付产品号',
  `huifu_merchant_private_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '汇付商户私钥',
  `huifu_public_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '汇付公钥',
  `transfer_scene_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '佣金报酬' COMMENT '转账场景',
  `transfer_user_perception` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '劳务报酬' COMMENT '用户收款感知',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `pay_type`(`pay_type`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_pay_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '店铺ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1课程 2商品 3资料 4试卷 5 超级试卷 6活动报名 7会员 8超级会员 9积分商城 10拼团 11打卡 12测评 13直播打赏 14ai应用 15当面付 16human（客户定制）17圈子',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户单号',
  `pay_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户侧单号',
  `pay_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `mch_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户号',
  `pay_type` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `is_wx_use_send_manage` tinyint(1) NOT NULL DEFAULT 0 COMMENT '该订单是否接入微信小程序 订单发货管理 0未接入 1已接入',
  `is_wx_send_type` int(2) NOT NULL DEFAULT 0 COMMENT '订单发货类型 1虚拟订单 2实物发货订单',
  `is_wx_send` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否微信api发货 0未发货 1发货',
  `is_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0未支付 1已支付',
  `deviceType` int(2) NOT NULL DEFAULT 0 COMMENT '端',
  `body_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品名称',
  `is_huifu` tinyint(1) NOT NULL DEFAULT 0,
  `hf_seq_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '汇付全局流水号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `mch_id`(`mch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_pay_remit_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `wxapp_pay_template_id` int(11) NOT NULL DEFAULT 0 COMMENT '支付模板ID',
  `wxh5_pay_template_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_payshop_cat`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `level1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级ID',
  `level2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二级ID',
  `level3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '三级ID',
  `level1_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类名称',
  `level2_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二级分类名称',
  `level3_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '三级分类名称',
  `license` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '营业执照',
  `certificate` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '资质',
  `scene_group_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `audit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核单ID',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0审核中 1已通过 9拒绝',
  `reject_reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '拒绝原因',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_payshop_good`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `goods_id` int(11) NOT NULL,
  `apply_status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '审核状态1--未审核 2--审核中 4--审核通过 3--审核驳回',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '上下架状态 0--初始值 5上架 11自主下架 13违规下架/风控系统下架',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '小商店上商品id',
  `third_cat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小商店上分类',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小商店上品牌',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小商店上商品标题',
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小商店上商品价格',
  `stock` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小商店上商品库存',
  `goods_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上传时商品信息',
  `product_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '小商店上商品信息',
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '草稿',
  `audit_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核结果',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brand_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2100000000' COMMENT '小商店上商品品牌id',
  `qualification_pics` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_pc_config`  (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站标题',
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `icon` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '浏览器图标',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `footer_link` tinyint(1) NOT NULL DEFAULT 0 COMMENT '友情链接开关 0关闭 1开启',
  `footer_bg_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '底部背景颜色',
  `footer_text_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '底部文字颜色',
  `footer_copyright` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '版权信息',
  `footer_icp` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备案号',
  `is_wxpay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `wxpay_id` int(11) NULL DEFAULT NULL COMMENT '微信支付模板ID',
  `is_alipay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `alipay_id` int(11) NULL DEFAULT NULL COMMENT '支付宝支付模板ID',
  `textColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文字颜色',
  `textSelectedColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文字选中颜色',
  `logo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'logo 180*40',
  `kf_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客服二维码',
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `domain` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '独立域名',
  `h5_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '手机端跳转地址',
  `code` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '全局代码块',
  `header_search_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '顶部搜索框 1显示 0隐藏',
  `header_study_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '顶部我的学习 1显示 0隐藏',
  `header_login_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '顶部登录按钮 1显示 0隐藏',
  `hover_menu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像悬浮菜单',
  `user_menu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个人中心菜单',
  `header_search_type` int(11) NOT NULL DEFAULT 1 COMMENT '顶部搜索框搜索类型 1课程 2文章 3试卷 4活动 5资料',
  `is_ewm_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '二维码登录 0关闭 1开启',
  `ewm_login_type` int(2) NOT NULL DEFAULT 1 COMMENT '二维码类型 1微信小程序 2微信H5 4百度小程序 5抖音小程序 8快手小程序',
  `top_default_color` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#ffffff' COMMENT '顶部默认背景色',
  `ewm_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'h5二维码域名',
  `login_bg_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_pc_diy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `page_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页面参数',
  `items` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页面数据',
  `type` int(11) NOT NULL COMMENT '1自定义页面',
  `uniacid` int(11) NOT NULL,
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_pc_header`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sort` int(11) NOT NULL COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `state` tinyint(1) NOT NULL COMMENT '状态 0隐藏 1显示',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `pid` int(11) NULL DEFAULT 0 COMMENT '父id 默认0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_pc_links`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站名称',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '网站url',
  `url_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1显示 0隐藏',
  `type` tinyint(1) NOT NULL COMMENT '1底部栏目 2友情链接',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_poster`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `course` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程',
  `dis` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分销',
  `good` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品',
  `enroll` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动报名',
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '平台ID',
  `article` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章',
  `annex` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '资料',
  `daily` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '感悟',
  `assist` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `assess` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_product_label`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  `add_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1展示0隐藏',
  `type` tinyint(2) NOT NULL COMMENT '1课程',
  `sort` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_product_label_bind`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `add_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` tinyint(2) NOT NULL COMMENT '1课程',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `label_id`(`label_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_public_sms_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0关闭 1开启',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_punchcard`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打卡标题',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面图',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1日历打卡',
  `type_id` int(11) NOT NULL COMMENT '分类',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打卡介绍',
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始时间',
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结束时间',
  `time1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打开时段起',
  `time2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打开时段止',
  `rest_day` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '休息日',
  `make_second` int(11) NOT NULL DEFAULT 0 COMMENT '补打卡次数',
  `price_type` tinyint(1) NOT NULL COMMENT '参与条件 1免费参与 2付费参与 3购买课程',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `buy_course_id` int(11) NOT NULL COMMENT '购买课程的ID',
  `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '表单ID',
  `card_notice` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '打卡提示',
  `card_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '打卡描述',
  `text_limit` int(11) NOT NULL DEFAULT 10 COMMENT '文字不低于多少字',
  `img_limit` int(11) NOT NULL DEFAULT 0 COMMENT '图片不少于多少张',
  `audio_limit` int(11) NOT NULL COMMENT '语音不少于多少秒',
  `video_limit` int(11) NOT NULL COMMENT '视频不少于多少秒',
  `poster_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '海报图片',
  `poster_text_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '海报文字颜色',
  `poster_sentence_id` int(11) NOT NULL DEFAULT 0 COMMENT '日签金句ID',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 数字越大越靠前,默认排序为创建时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0下架 1上架',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `default_sales` int(11) NOT NULL DEFAULT 0 COMMENT '默认销量',
  `jf_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '积分 0关闭 1开启',
  `jf_count` int(11) NOT NULL DEFAULT 1 COMMENT '积分获得次数',
  `jf_number` int(11) NOT NULL DEFAULT 10 COMMENT '获得积分数量',
  `day_max_count` int(11) NOT NULL DEFAULT -1 COMMENT '每日最大打卡次数 -1为不限制',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_punchcard_content`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT '一级评论为0  ',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '上级用户id',
  `punchcard_id` int(11) NOT NULL COMMENT '打卡活动ID',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '评论者的用户ID',
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '评论者讲师ID',
  `diary_id` int(11) NOT NULL COMMENT '日记ID',
  `diary_user_id` int(11) NOT NULL COMMENT '日记的用户ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_punchcard_diary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `punchcard_id` int(11) NOT NULL COMMENT '打卡ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type` tinyint(1) NOT NULL COMMENT '1打卡 2补卡',
  `punchcard_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打卡时间',
  `true_timestamp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算哪天打卡的时间戳',
  `true_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算哪天打卡的时间 格式 2021-12-28',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文字',
  `imglist` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `audio` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '语音',
  `audio_durition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '音频长度',
  `video` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '视频',
  `video_height` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '视频高度',
  `video_weight` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '视频宽度',
  `is_selected` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1精选',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1置顶',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_punchcard_jf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `diary_id` int(11) NOT NULL COMMENT '日记ID',
  `punchcard_id` int(11) NOT NULL COMMENT '打卡ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `jf_number` int(11) NOT NULL DEFAULT 0 COMMENT '获得积分数量',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_punchcard_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `punchcard_id` int(11) NOT NULL COMMENT '打卡ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户号',
  `total_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单实际付款',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `is_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否过售后时间 0没过 1过了',
  `cancel_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '取消订单状态 0未取消 1已取消',
  `sale_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否申请售后 0未申请 1申请了',
  `cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间',
  `refund_result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款结果 0未退款 1退款成功 2退款失败',
  `refund_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态 0未售后 1售后中 2售后结束',
  `refund_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款内容',
  `refund_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款图片',
  `auto_cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动取消时间',
  `auto_sales_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动过售后时间',
  `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '打卡数据',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `use_user_coupon_id` int(11) NOT NULL DEFAULT 0 COMMENT '使用的用户优惠券id',
  `coupon_discount_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券优惠金额',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_punchcard_sentence`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '金句库名称',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_punchcard_sentence_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sentence_id` int(11) NOT NULL COMMENT '金句库ID',
  `one` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `two` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `three` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_punchcard_view`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `punchcard_id` int(11) NOT NULL COMMENT '打卡ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` int(11) NOT NULL COMMENT '时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_punchcard_zan`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `punchcard_id` int(11) NOT NULL COMMENT '打卡活动ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '点赞者的用户ID',
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '点赞者讲师ID',
  `diary_id` int(11) NOT NULL COMMENT '日记ID',
  `diary_user_id` int(11) NOT NULL COMMENT '日记的用户ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_question_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `paper_id` int(11) NULL DEFAULT NULL COMMENT '试卷ID',
  `question_id` int(11) NULL DEFAULT NULL COMMENT '题库ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `score` int(11) NULL DEFAULT NULL COMMENT '答题分数',
  `z_score` int(11) NULL DEFAULT NULL COMMENT '总分数',
  `yes_num` int(11) NULL DEFAULT NULL COMMENT '对了多少道题',
  `wrong_num` int(11) NULL DEFAULT NULL COMMENT '错了多少道题',
  `z_num` int(11) NULL DEFAULT NULL COMMENT '总共多少道题',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '答题数据',
  `paper_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试卷数据',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `use_time` int(11) NULL DEFAULT NULL COMMENT '用时 秒',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `up`(`user_id`, `paper_id`) USING BTREE,
  INDEX `paper_id`(`paper_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_question_item`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) NOT NULL COMMENT '题库ID',
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `type` int(11) NOT NULL COMMENT '1单选 2多选 3判断 4填空',
  `question_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题数据',
  `answer_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '答案数据',
  `analysis` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '答案解析',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `score` int(11) NOT NULL COMMENT '分数',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 先添加的在前 数字越小越靠前',
  `chaos_mate` tinyint(4) NULL DEFAULT NULL COMMENT '乱序匹配答案 1是 0否',
  `yes_num` int(11) NOT NULL DEFAULT 0 COMMENT '答对的次数',
  `wrong_num` int(11) NOT NULL DEFAULT 0 COMMENT '答错的次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_question_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题库名称',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_question_wrong`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `paper_id` int(11) NOT NULL COMMENT '试卷ID',
  `question_id` int(11) NOT NULL COMMENT '题库id',
  `q_id` int(11) NOT NULL COMMENT '题目ID',
  `q_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目数据 json',
  `p_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷数据 json',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `paper_id`(`paper_id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE,
  INDEX `q_id`(`q_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `unaicid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_quick_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `channel` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '哪端',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_refund_address`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 1,
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `is_default`(`is_default`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_scrm_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `userid` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '成员ID',
  `userid_arr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '成员id arr',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_scrm_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `department_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parentid` int(11) NULL DEFAULT 0,
  `order` int(11) NULL DEFAULT 0,
  `department_leader` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  INDEX `parentid`(`parentid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_scrm_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '开启状态 0关闭 1开启',
  `corp_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `corp_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用的凭证密钥',
  `agent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'AgentId',
  `contact_sync_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通讯录同步密钥',
  `msgToken` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Token',
  `msgEncodingAESKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'EncodingAESKey',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_scrm_staff`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL,
  `userid` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成员UserID',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职务信息',
  `gender` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别。0表示未定义，1表示男性，2表示女性',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `biz_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业邮箱',
  `avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '头像url',
  `thumb_avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '头像缩略图url',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '别名',
  `extattr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '扩展属性',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '激活状态: 1=已激活，2=已禁用，4=未激活，5=退出企业。',
  `qr_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '员工个人二维码',
  `external_profile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '成员对外属性',
  `external_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对外职务，如果设置了该值，则以此作为对外展示的职务，否则以position来展示',
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '地址',
  `main_department` int(11) NOT NULL DEFAULT 0 COMMENT '主部门，仅当应用对主部门有查看权限时返回。',
  `direct_leader` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '直属上级UserID，返回在应用可见范围内的直属上级列表，最多有1个直属上级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_scrm_staff_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `department_id` int(11) NOT NULL DEFAULT 0 COMMENT '成员所属部门id',
  `department_order` int(11) NOT NULL DEFAULT 0 COMMENT '部门内的排序值，默认为0。数量必须和department一致，数值越大排序越前面。值范围是[0, 2^32)',
  `is_leader_in_dept` tinyint(1) NOT NULL DEFAULT 0 COMMENT '表示在所在的部门内是否为部门负责人',
  `staff_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_scrm_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `oper_userid` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部联系人的名称',
  `avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '外部联系人头像',
  `type` int(11) NOT NULL COMMENT '外部联系人的类型，1表示该外部联系人是微信用户，2表示该外部联系人是企业微信用户',
  `gender` tinyint(1) NOT NULL DEFAULT 0 COMMENT '外部联系人性别 0-未知 1-男性 2-女性。第三方不可获取，上游企业不可获取下游企业客户该字段，返回值为0，表示未定义',
  `corp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部联系人所在企业的简称，仅当联系人类型是企业微信用户时有此字段',
  `corp_full_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '外部联系人所在企业的主体名称，仅当联系人类型是企业微信用户时有此字段。',
  `shop_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺用户ID',
  `unionid` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `oper_userid`(`oper_userid`) USING BTREE,
  INDEX `unionid`(`unionid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_scrm_user_error_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `oper_userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_scrm_user_qiwei_op_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0未知 1客户加成员 2客户删成员 3成员删客户',
  `userid` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成员ID',
  `oper_userid` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `createtime` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  `add_way` int(11) NULL DEFAULT NULL COMMENT 'https://developer.work.weixin.qq.com/document/path/92114#%E6%9D%A5%E6%BA%90%E5%AE%9A%E4%B9%89',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `oper_userid`(`oper_userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_scrm_user_staff`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `userid` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '成员ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '该成员对此外部联系人的备注',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '该成员对此外部联系人的描述\r\n',
  `createtime` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '该成员添加此外部联系人的时间\r\n',
  `tag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '该成员对此外部联系人的标签',
  `remark_mobiles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '该成员对此客户备注的手机号码',
  `add_way` int(11) NOT NULL DEFAULT 1 COMMENT '来源 https://developer.work.weixin.qq.com/document/path/92114#%E6%9D%A5%E6%BA%90%E5%AE%9A%E4%B9%89',
  `follow_status` int(2) NOT NULL DEFAULT 0 COMMENT '跟进状态0未跟进 1跟进中 2已拒绝 3已成交',
  `oper_userid` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `createtime`(`createtime`) USING BTREE,
  INDEX `add_way`(`add_way`) USING BTREE,
  INDEX `oper_userid`(`oper_userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_scrm_user_staff_tag`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '平台ID',
  `userid` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `tag_id` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签ID',
  `oper_userid` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE,
  INDEX `oper_userid`(`oper_userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_scrm_user_tag`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `tag_id` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签ID',
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `group_id` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组ID',
  `create_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `order` int(11) NOT NULL DEFAULT 0 COMMENT '标签次序值。order值大的排序靠前。有效的值范围是[0, 2^32)',
  `type` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_scrm_user_tag_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `group_id` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组ID',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组名称',
  `create_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `order` int(11) NOT NULL DEFAULT 0 COMMENT '标签组排序的次序值，order值大的排序靠前。有效的值范围是[0, 2^32)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_search_hot`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1显示 0隐藏',
  `type` int(11) NOT NULL COMMENT '课程:type=1,文章:2,商城:3,资料:4,积分商城:5,打卡搜索:6 -1论坛',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 数字越大越靠前,默认排序为创建时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_search_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `user_id` int(11) NOT NULL,
  `add_time` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '课程:type=1,文章:2,商城:3,资料:4,积分商城:5,打卡搜索:6 -1论坛',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_short_url`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `long_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  `path_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expire_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信小程序链接失效时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `long_url`(`long_url`) USING BTREE,
  INDEX `short_url`(`short_url`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `path_url`(`path_url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_sign_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sign_desc_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签到描述文字颜色',
  `receive_font_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '已领取文字颜色\r\n',
  `receive_btn_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '已领取按钮颜色',
  `not_receive_font_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '未领取文字颜色',
  `not_receive_btn_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '未领取按钮颜色',
  `bg_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '下方背景配色 1纯色 2渐变色',
  `bg_top_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下方背景色',
  `bg_bottom_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下方渐变下颜色',
  `top_bg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上方背景图',
  `no_sign_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签到图片',
  `sign_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '已签到图片',
  `jf_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分图标',
  `sign_logo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '已签到图标',
  `jfshop_state` tinyint(255) NOT NULL DEFAULT 0 COMMENT '积分商城 1显示 0隐藏',
  `jfrank_state` tinyint(255) NOT NULL DEFAULT 0 COMMENT '积分排行 1显示 0隐藏',
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '积分签到开关 0关闭 1开启',
  `day_integral` int(11) NOT NULL COMMENT '每日签到积分',
  `continue` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '连续签到积分',
  `total` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '累计签到得积分',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签到规则',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_about_dev`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在后',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0隐藏 1显示',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_about_join`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0隐藏 1显示',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `salary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '薪资 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_about_partner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `imgurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0隐藏 1显示',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_about_qualification`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `imgurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0隐藏 1显示',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `h5_imgurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'h5 图片URL',
  `pc_imgurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'pc 图片URL',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '跳转路径',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '跳转方式 1本页面 2新窗口',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 数字越大越靠前,默认排序为先添加的在前',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0隐藏 1显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_foot_column`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1显示 0隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_foot_friend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '跳转路径',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 数字越大越靠前,默认排序为先添加的在前',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1显示 0隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_foot_url`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `c_id` int(11) NOT NULL COMMENT '栏目ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `item_type` tinyint(1) NOT NULL COMMENT '1文字显示 2链接跳转',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '跳转路径',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '跳转方式 1本页面 2新窗口',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 数字越大越靠前,默认排序为先添加的在前',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1显示 0隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_nav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '跳转路径',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '跳转方式 1本页面 2新窗口',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 数字越大越靠前,默认排序为先添加的在前',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_type` int(11) NOT NULL DEFAULT 1 COMMENT '-1首页 1解决方案 2更新日志 3新闻动态 4关于我们 5帮助中心 6单页面 0其他',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1显示 0隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_new`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻标题',
  `type_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类ID',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面图',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻内容',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在后',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `state` tinyint(1) NOT NULL COMMENT '状态 0隐藏 1显示',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览数',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `keywords` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关键词',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_news_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类标题',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0隐藏 1显示',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_page`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `top_bg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '顶部背景',
  `top_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '顶部标题',
  `top_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '顶部描述',
  `page_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'seo页面标题',
  `page_keywords` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'seo页面关键词',
  `page_description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'seo页面描述',
  `page_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '页面类型 1富文本模式 2代码模式',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '富文本内容',
  `file_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文件目录名称',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1显示 0隐藏',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 数字越大越靠前,默认排序为先添加的在后',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仅此域名可以打开 官网',
  `site_type` int(11) NOT NULL DEFAULT 1 COMMENT '1登录界面 2官网模式',
  `site_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站标题',
  `site_keywords` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站关键词',
  `site_description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站描述',
  `site_style_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站主题色',
  `site_logo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站LOGO',
  `site_logo_white` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站白色LOGO',
  `statistics_code` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '统计代码',
  `baidu_push_token` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度推送TOKEN',
  `about_site_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我们网站标题',
  `about_site_keywords` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我们网站关键词',
  `about_site_description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我们网站描述',
  `about_pc_top_bg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我们PC顶部图片',
  `about_h5_top_bg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我们H5顶部图片',
  `about_top_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我们顶部文字',
  `about_top_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我们顶部描述',
  `about_company_text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我们公司文字介绍',
  `about_company_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我们公司图片',
  `index_data_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '首页 数据统计 0隐藏 1显示',
  `index_data_1_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页 数据统计 1名称',
  `index_data_1_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页 数据统计 1数字',
  `index_data_2_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_data_2_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_data_3_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_data_3_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_data_4_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_data_4_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '首页 系统介绍 0隐藏 1显示',
  `index_sys_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页 系统介绍 标题',
  `index_sys_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页 系统介绍 描述',
  `index_sys_bgimg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `index_sys_1_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_1_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_1_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_1_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_1_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_1_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_2_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_2_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_2_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_2_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_2_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_2_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_3_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_3_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_3_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_3_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_3_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_3_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_4_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_4_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_4_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_4_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_4_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_sys_4_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `about_development_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '关于我们 发展历程 0隐藏 1显示',
  `about_development_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关于我们 发展历程 标题',
  `about_development_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关于我们 发展历程 描述',
  `about_qualification_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '关于我们 公司资质 0隐藏 1显示',
  `about_qualification_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `about_qualification_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `about_join_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '关于我们 加入我们 0隐藏 1显示',
  `about_join_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `about_join_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_partner_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '首页 合作伙伴 0隐藏 1显示',
  `index_partner_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页 合作伙伴 标题',
  `index_partner_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页 合作伙伴 描述',
  `index_new_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '首页新闻动态 0隐藏 1显示',
  `index_new_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页新闻动态 标题',
  `index_new_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页新闻动态 描述',
  `index_new_typeid1` int(11) NOT NULL DEFAULT 0,
  `index_new_typeid2` int(11) NOT NULL DEFAULT 0,
  `index_solution_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '首页 解决方案 0隐藏 1显示',
  `index_solution_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页 解决方案 标题',
  `index_solution_title1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_solution_desc1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `index_solution_img1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `index_solution_title2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_solution_desc2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `index_solution_img2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `index_solution_title3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `index_solution_desc3` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `index_solution_img3` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hover_right_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '右下悬浮开关 1显示 0隐藏',
  `hover_right_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'PC右下悬浮图片',
  `global_contact_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全局联系我们名称',
  `global_contact_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '全局联系我们描述',
  `global_contact_dia_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '全局联系我们弹框二维码',
  `global_contact_dia_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全局联系我们弹框标题',
  `global_contact_dia_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '全局联系我们弹框下方文字',
  `global_contact_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全局联系我们手机号',
  `new_top_bg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻动态 顶部背景图',
  `new_top_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻动态 顶部文字',
  `new_top_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻动态 顶部描述',
  `update_top_bg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '更新日志 顶部背景图',
  `update_top_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '更新日志 顶部文字',
  `update_top_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '更新日志 顶部描述',
  `new_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻栏目标题',
  `new_keywords` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻栏目关键词',
  `new_site_description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻栏目描述',
  `update_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新日志栏目标题',
  `update_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新日志栏目关键词',
  `update_site_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新日志栏目描述',
  `update_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '更新日志内容设置 1自己添加 2云获取',
  `header_login_btn_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '顶部登录按钮 1显示 0隐藏',
  `footer_ewm_1_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '底部 二维码1名称',
  `footer_ewm_1_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '底部 二维码1图片',
  `footer_ewm_2_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '底部 二维码2名称',
  `footer_ewm_2_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '底部 二维码2图片',
  `footer_text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '底部 版权文字',
  `site_icon` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '站点图标',
  `wiki_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '帮助中心标题',
  `wiki_keywords` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '帮助中心关键词',
  `wiki_description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '帮助中心描述',
  `wiki_top_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '帮助中心顶部文章',
  `wiki_top_bg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '帮助中心顶部背景',
  `nav_style` tinyint(1) NOT NULL DEFAULT 1 COMMENT '顶部导航文字颜色 1浅色 2深色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_solution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '解决方案名称',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '解决方案描述',
  `top_bg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '解决方案背景',
  `top_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '顶部描述',
  `page_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'seo页面标题',
  `page_keywords` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'seo页面关键词',
  `page_description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'seo页面描述',
  `page_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '页面类型 1富文本模式 2代码模式',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '富文本内容',
  `file_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文件目录名称',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1显示 0隐藏',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 数字越大越靠前,默认排序为先添加的在前',
  `icon_img_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '解决方案图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_update`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_wiki`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '菜单',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1显示 0隐藏',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文档图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_site_wiki_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1目录 2文档',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠后',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级ID',
  `wiki_id` int(11) NOT NULL DEFAULT 1 COMMENT '文档ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_storage`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '1本地存储 2阿里云OSS 3七牛云存储 4腾讯云COS 5阿里云点播 6腾讯云点播 0跟随音视频存储设置  7又拍云 8华为云存储',
  `aliyun` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qiniu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tengxun` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aliyun_db` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tengxun_db` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  `youpaiyun` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `storage_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '存储类型 1音视频 2图片、资料',
  `hwobs` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hwvod` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_storage_ebook`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `sid` int(11) NOT NULL COMMENT '素材ID',
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时间',
  `oss_type` int(2) NOT NULL DEFAULT 0 COMMENT 'oss类型1本地 2阿里云 3七牛云 4腾讯云 6腾讯云点播 7又拍云',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_storage_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称',
  `type` int(11) NOT NULL COMMENT '1图片 2视频 3音频 4文件',
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '管理员id',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级id',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_storage_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '组ID',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '完整路径',
  `path` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '相对路径',
  `type` int(11) NOT NULL COMMENT '1图片 2视频 3音频 4文件 5电子书',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `size` int(11) NOT NULL COMMENT '大小 单位B 字节',
  `size2` int(11) NULL DEFAULT NULL,
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID',
  `uid` int(11) NOT NULL COMMENT '上传者ID 0管理员上传',
  `oss_type` int(11) NOT NULL COMMENT 'oss类型1本地 2阿里云 3七牛云 4腾讯云 6腾讯云点播 7又拍云 -1链接导入 -2直播回放',
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `duration` int(11) NULL DEFAULT NULL COMMENT '视频音频长度 秒',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '0可用/转码完成 1未转码',
  `c_id` int(11) NULL DEFAULT NULL COMMENT '其他ID',
  `cover` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '封面图',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷名称',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1练习模式（做完立即显示答案） 2考试模式 3超级模式',
  `type_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类ID',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面图',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '介绍',
  `time_limit_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '做题时间是否限制 1不限制 2总时间',
  `time_limit` int(11) NOT NULL DEFAULT 0 COMMENT '限制时长 单位分钟',
  `again_test` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否支持重测 1是 0否',
  `again_test_time_interval` int(11) NOT NULL DEFAULT 0 COMMENT '重测时间间隔 分钟',
  `again_test_count` int(11) NOT NULL DEFAULT 0 COMMENT '重测次数',
  `is_suspend` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否支持暂停 0不支持 1支持',
  `is_jump_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '练习模式答对跳转 1答对自动跳转下一题 2答对停留在此题目并显示答案及解析',
  `is_ranking` tinyint(1) NOT NULL COMMENT '排行榜 0关闭 1开启',
  `is_alone_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '单独售卖 0不支持 1支持',
  `price_type` tinyint(1) NOT NULL COMMENT '价格类型 1免费 2付费',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `line_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '划线价',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1上架 0下架',
  `uniacid` int(11) NOT NULL DEFAULT 0 COMMENT '平台ID',
  `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联表单ID',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `list_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '列表展示 0不展示 1展示',
  `paper_formation_method_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '组卷方式 1自由选题组卷 2按题型组卷 3随机组卷',
  `is_change_paper_formation_method` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否能改变组件方式 0不能 1可以',
  `default_sales` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟参与人数',
  `is_change_paper_question` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否能改变题目 0不能改变 1可以改变',
  `vip_free_see` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `is_auto_join_wrong` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否自动加入错题本 0关闭 1开启',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_chapter`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级ID',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '越小越靠前',
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '题库组ID',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exam_id` int(11) NOT NULL DEFAULT 0 COMMENT '试卷ID',
  `uniacid` int(11) NOT NULL DEFAULT 0 COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `exam_id`(`exam_id`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `idx_group_sort`(`group_id`, `sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `exam_id` int(11) NOT NULL COMMENT '试卷ID',
  `topic_id` int(11) NOT NULL COMMENT '题目ID',
  `chapter_id` int(11) NOT NULL COMMENT '章节ID',
  `is_sub_topic` int(11) NOT NULL DEFAULT 0 COMMENT '是否是子题目 0 or 1',
  `yd_answer` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '答案，单选C，多选：[\"A\",\"B\"], 判断0 1，填空 [\"1\",\"2\"] 简答 \"aaaa\"',
  `tx_answer` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否答对 答对1 答错 0',
  `uniacid` int(11) NOT NULL DEFAULT 0 COMMENT '平台ID',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '如果为子题目 这道题的上级ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `exam_id`(`exam_id`) USING BTREE,
  INDEX `topic_id`(`topic_id`) USING BTREE,
  INDEX `chapter_id`(`chapter_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `is_sub_topic`(`is_sub_topic`) USING BTREE,
  INDEX `idx_user_topic_chapter`(`user_id`, `topic_id`, `chapter_id`, `is_sub_topic`, `tx_answer`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_error`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `exam_id` int(11) NOT NULL COMMENT '试卷ID',
  `topic_id` int(11) NOT NULL COMMENT '题目ID',
  `error_type` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '错误类型',
  `error_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '错误内容',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `submit_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交时间',
  `handle_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0未处理 1已处理',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `exam_id`(`exam_id`) USING BTREE,
  INDEX `topic_id`(`topic_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 0未删除 1已删除',
  `delete_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `exam_id` int(11) NOT NULL COMMENT '试卷ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户号',
  `total_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
  `total_pay_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单实际付款',
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 5会员免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付 9通过课程免费兑换 ',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `is_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否过售后时间 0没过 1过了',
  `cancel_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '取消订单状态 0未取消 1已取消',
  `sale_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否申请售后 0未申请 1申请了',
  `cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间',
  `refund_result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款结果 0未退款 1退款成功 2退款失败',
  `refund_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态 0未售后 1售后中 2售后结束',
  `refund_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款内容',
  `refund_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退款图片',
  `auto_cancel_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动取消时间',
  `auto_sales_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '自动过售后时间',
  `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '如果通过课程兑换的 需要有课程id',
  `json_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试卷数据',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `use_user_coupon_id` int(11) NOT NULL DEFAULT 0 COMMENT '使用的用户优惠券id',
  `coupon_discount_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券优惠金额',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_progress`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `exam_id` int(11) NOT NULL DEFAULT 0 COMMENT '试卷ID',
  `chapter_id` int(11) NOT NULL COMMENT '章节ID',
  `topic_id` int(11) NOT NULL COMMENT '题目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_question_formation_random`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `exam_id` int(11) NOT NULL DEFAULT 0 COMMENT '超级考试ID',
  `question_group_id` int(11) NOT NULL COMMENT '题库组ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 越小越靠前',
  `random_count` int(11) NOT NULL DEFAULT 0 COMMENT '随机抽取多少道题',
  `item_score` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '每题目多少分',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `exam_id`(`exam_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_question_formation_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `danxuan_total` int(11) NOT NULL DEFAULT 0 COMMENT '单选题数量',
  `danxuan_item_score` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '单选每题得分',
  `duoxuan_total` int(11) NOT NULL DEFAULT 0,
  `duoxuan_item_score` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `panduan_total` int(11) NOT NULL DEFAULT 0,
  `panduan_item_score` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `tiankong_total` int(11) NOT NULL DEFAULT 0,
  `tiankong_item_score` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `wenda_total` int(11) NOT NULL DEFAULT 0,
  `wenda_item_score` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `yuedulijie_total` int(11) NOT NULL DEFAULT 0,
  `yuedulijie_item_score` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `exam_id` int(11) NOT NULL DEFAULT 0 COMMENT '超级试卷ID',
  `question_id_arr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题库ID',
  `uniacid` int(11) NOT NULL DEFAULT 0 COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `exam_id`(`exam_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_question_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1单选题 2多选题 3判断题 4填空题 5阅读理解题 6问答题',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称',
  `total_score` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '总分',
  `total_item_count` int(11) NOT NULL DEFAULT 0 COMMENT '总共题目数量',
  `item_score` decimal(10, 2) NULL DEFAULT NULL COMMENT '每题目分数',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 越小越靠前',
  `exam_id` int(11) NOT NULL DEFAULT 0 COMMENT '超级考试ID',
  `uniacid` int(11) NOT NULL DEFAULT 0 COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_question_item`  (
  `item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `exam_id` int(11) NOT NULL DEFAULT 0 COMMENT '超级考试ID',
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '左侧组ID',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '1单选题 2多选题 3判断题 4填空题 5阅读理解题 6问答题',
  `is_sub_topic` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是子题目 0不是 1是 阅读理解题使用',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '子题目上级ID',
  `score` decimal(10, 2) NOT NULL COMMENT '题目分数',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 越小越靠前',
  `uniacid` int(11) NOT NULL DEFAULT 0 COMMENT '平台ID',
  `question_id` int(11) NOT NULL DEFAULT 0 COMMENT '题目ID',
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `exam_id`(`exam_id`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type_style` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1样式一 2样式二',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_topic`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '分组ID 0为默认',
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目',
  `difficulty` int(2) NULL DEFAULT 0 COMMENT '题目难度 0未选择 1简单 2一般 3困难',
  `type` int(2) NOT NULL DEFAULT 1 COMMENT '1单选 2多选 3判断 4填空 5阅读理解 6问答题',
  `is_sub_topic` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是子题目 0不是 1是 阅读理解题使用',
  `question_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题数据\r\n单选、多选[{\"content\":\"\"}]\r\n判断 无\r\n填空 无\r\n阅读理解[\"123\",\"456\"]子题目ID\r\n问答题 无\r\n',
  `answer_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '答案 \r\n单选A、B、C\r\n多选[\"A\",\"B\"]\r\n判断 0错 1对\r\n填空[\"第一空\"、\"第二空\"]\r\n阅读理解（包含小题）\r\n问答题xxx',
  `analysis` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '解析',
  `chaos_mate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '填空题 乱序匹配 0否 1是',
  `wrong_num` int(11) NOT NULL DEFAULT 0 COMMENT '答错次数',
  `yes_num` int(11) NOT NULL DEFAULT 0 COMMENT '答对次数',
  `sort` int(11) NOT NULL DEFAULT 1000 COMMENT '排序 越小 越靠前 默认 后添加的在前',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `delete_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uniacid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE,
  INDEX `is_sub_topic`(`is_sub_topic`, `is_delete`, `group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `exam_id` int(11) NOT NULL COMMENT '超级试卷ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `exam_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '超级试卷信息',
  `user_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户做题信息',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答题时间',
  `readover_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批阅时间',
  `is_use_readover` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否需要批阅 0不需要 1需要',
  `is_readover` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否批阅 0未批阅 1已批阅',
  `ok_score` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '已确定分数',
  `zong_score` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '试卷总分',
  `other_score` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '批阅的分数（问答）',
  `use_other_score` decimal(10, 2) NOT NULL COMMENT '需要批阅的分数（ 问答）',
  `ok_other_score` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '已经批阅的分数（ 问答）实际得分',
  `use_time` int(11) NOT NULL DEFAULT 0 COMMENT '答题用时',
  `use_other_num` int(11) NOT NULL DEFAULT 0 COMMENT '需要批阅的题数',
  `yes_num` int(11) NOT NULL DEFAULT 0 COMMENT '答对题数（包含小题）',
  `wrong_num` int(11) NOT NULL DEFAULT 0 COMMENT '答错题数（包含小题）',
  `zong_num` int(11) NOT NULL DEFAULT 0 COMMENT '答题总数（包含小题）',
  `paper_formation_method_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '组卷方式 1自由选题组卷 2按题型组卷 3随机组卷',
  `user_data_menu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_exam_id`(`user_id`, `exam_id`, `id`) USING BTREE,
  INDEX `idx_exam_user_score_time`(`exam_id`, `uniacid`, `is_readover`, `user_id`, `ok_score`, `ok_other_score`, `time`) USING BTREE,
  INDEX `idx_exam_id_is_readover`(`exam_id`, `is_readover`) USING BTREE,
  INDEX `exam_id`(`exam_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_super_exam_wrong`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `exam_id` int(11) NOT NULL COMMENT '试卷ID',
  `topic_id` int(11) NOT NULL COMMENT '题目ID',
  `topic_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目数据 json',
  `exam_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷数据 json',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `unaicid`(`uniacid`) USING BTREE,
  INDEX `topic_id`(`topic_id`) USING BTREE,
  INDEX `exam_id`(`exam_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_svip`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `card_id` int(11) NOT NULL COMMENT '会员卡ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `over_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0非会员 -1永久 其他时间戳',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `buy_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1购买 2兑换码 3后台',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_svip_card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sort_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员卡简称',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员卡名称',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员卡描述',
  `specs` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规格',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容介绍',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1显示 0隐藏',
  `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '会员表单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_svip_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `card_id` int(11) NOT NULL COMMENT '会员卡ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_svip_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_price` decimal(10, 2) NOT NULL,
  `total_pay_price` decimal(10, 2) NOT NULL,
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '1微信普通支付 2支付宝支付 3百度收银台',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distribute_price` decimal(10, 2) NULL DEFAULT NULL,
  `surplus_price` decimal(10, 2) NULL DEFAULT NULL,
  `svip_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '快照',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `card_id` int(11) NOT NULL DEFAULT 0 COMMENT '会员卡ID',
  `specs_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规格数据',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '1开通会员 2续费会员 3到期续费会员',
  `day` int(11) NULL DEFAULT NULL COMMENT '天数',
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有',
  `form_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表单数据',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `card_id`(`card_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_svip_super_exam`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `exam_id` int(11) NOT NULL COMMENT '超级试卷ID',
  `card_id` int(11) NOT NULL COMMENT '会员卡ID',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_sys`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台名称',
  `logo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标',
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '平台ID',
  `is_force_getphone` tinyint(1) NOT NULL COMMENT '强制获取手机号 1开启',
  `is_phone_platform` tinyint(1) NOT NULL COMMENT '多端绑定手机号开关 0关闭 1开启',
  `is_default_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '静默登录 0关闭 1开启',
  `mainColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主色',
  `priceColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '价格颜色',
  `btn1BgColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `btn2BgColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `style` int(11) NOT NULL COMMENT '主题色样式',
  `is_ios_pay` tinyint(1) NOT NULL COMMENT 'IOS端支付 0关闭支付 1开启支付',
  `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IOS无法支付文案',
  `loading_style` tinyint(1) NOT NULL DEFAULT 1,
  `about` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我们',
  `course_type_style` tinyint(1) NULL DEFAULT 1,
  `course_list_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '课程列表样式 2一行一个（列表） 1一行两个 3一行一个（大图）',
  `marqueeColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仿录屏字体颜色',
  `marqueeSize` int(11) NULL DEFAULT NULL COMMENT '仿录屏字体大小',
  `marqueeOpacity` int(11) NULL DEFAULT NULL COMMENT '仿录屏透明度',
  `marqueeIsCopyright` tinyint(1) NULL DEFAULT NULL COMMENT '版权声明',
  `marqueeCopyright` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '版权声明',
  `marqueeSpeedTop` int(11) NOT NULL DEFAULT 5 COMMENT '速度',
  `marqueeSpeedBottom` int(11) NOT NULL DEFAULT 7,
  `after_sale_time` int(11) NOT NULL DEFAULT 0 COMMENT '售后时间 天数',
  `no_pay_cancel_time` int(11) NOT NULL DEFAULT 0 COMMENT '未支付订单取消时间  如设置为0分，则未支付订单将不会被取消，不能超过1440(24小时)',
  `auto_confirm_time` int(11) NOT NULL DEFAULT 7 COMMENT '自动确认收货时间 单位天',
  `kd_type` int(11) NOT NULL DEFAULT 0 COMMENT '快递接口类型 0关闭 1快递鸟 2阿里云',
  `kdn_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'kdn_id',
  `kdn_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'kdn_key',
  `aly_appcode` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'aly_appcode',
  `shop_type_style` int(11) NOT NULL DEFAULT 1 COMMENT '商城分类样式',
  `dyj_type` int(11) NOT NULL DEFAULT 0 COMMENT '打印机类型 0关闭 1易联云',
  `yly_zdh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yly_my` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yly_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yly_apikey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_style` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '登录弹窗数据',
  `coupon_set` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '优惠券设置',
  `course_comment` tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程评论 0不需要审核 1需要审核',
  `pc_coupon_topimg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'PC领券中心上方图',
  `tab_list` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'TAB栏样式',
  `shop_form_id` int(11) NOT NULL DEFAULT 0 COMMENT '商城表单',
  `bottom_copyright_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0隐藏 1显示',
  `bottom_top_link` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '底部版权上方链接',
  `bottom_top_link_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '底部版权上方颜色',
  `bottom_b_link` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '底部版权下方链接',
  `bottom_b_link_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '底部版权下方颜色',
  `bottom_bg_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '底部版权背景颜色',
  `course_free_receive` tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程免费领取逻辑 1直接可以观看 0需点击免费领取',
  `article_comment_examine` tinyint(1) NOT NULL DEFAULT 0 COMMENT '文章评论审核 0不需要审核 1需要审核',
  `article_comment` tinyint(1) NOT NULL DEFAULT 1 COMMENT '文章评论0关闭 1开启',
  `article_jf_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '文章积分 0关闭 1开启',
  `article_jf_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '文章积分类型1进度 2时间',
  `article_jf_data` int(11) NOT NULL DEFAULT 50 COMMENT '进度或时间',
  `article_jf_count` int(11) NOT NULL DEFAULT 1 COMMENT '文章积分获得次数',
  `article_jf_number` int(11) NOT NULL DEFAULT 10 COMMENT '获得积分数量',
  `course_menu_style` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已播放目录标题颜色 0默认 1自定义',
  `course_menu_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#121212',
  `rrsc_api_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '人人商城api_key',
  `dhm_log_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '兑换记录 1显示 0隐藏',
  `site_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '站点',
  `buy_course_notice` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '购课须知',
  `daily_llz_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '每日金句流量主状态 0关闭 1开启',
  `daily_llz_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '流量主类型 1banner广告 2视频广告',
  `daily_llz_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流量主广告位ID',
  `course_true_prevent_recording` tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程防录屏 0关闭 1开启',
  `mall_comment_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '商城评价 0隐藏 1显示',
  `course_attribute_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '课程属性 0隐藏 1显示',
  `layout_style` tinyint(1) NOT NULL DEFAULT 2 COMMENT '后台样式 1老版本 2新版本',
  `layout_color` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1深色 2浅色',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_sys_course_share`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `share_title_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享标题 1读取课程名称 2自定义标题',
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享标题',
  `share_desc_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享描述 1课程价格 2自定义描述',
  `share_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享描述',
  `share_img_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享图标 1课程封面 2自定义',
  `share_img_wxh5` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信公众号分享图标',
  `share_img_xcx` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '小程序分享图标',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_sys_language_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '店铺ID',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'zh-Hans' COMMENT '中文简体 zh-Hans，中文繁体 zh-Hant，英语 en，维吾尔语 uyghur，自定义 customize',
  `customize_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自定义语言 文件名称',
  `text_direction` tinyint(1) NOT NULL DEFAULT 1 COMMENT '文字方向 1正常 2左右反转',
  `font_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '字体路径',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_sys_live`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT 0,
  `buy_user_show_page_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '已经购买的用户跳转页面类型 1停留在课程页 2直播页',
  `live_user_nickname_encryption` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户昵称加密 0关闭 1开启',
  `menu_chat_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '讨论',
  `menu_chat_sort` int(11) NOT NULL DEFAULT 1,
  `menu_chat_show` tinyint(1) NOT NULL DEFAULT 1,
  `menu_content_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '介绍',
  `menu_content_sort` int(11) NOT NULL DEFAULT 2,
  `menu_content_show` tinyint(1) NOT NULL DEFAULT 1,
  `menu_lecturer_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '讲师',
  `menu_lecturer_sort` int(11) NOT NULL DEFAULT 3,
  `menu_lecturer_show` tinyint(1) NOT NULL DEFAULT 1,
  `menu_default_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'chat',
  `menu_courseware_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '课件',
  `menu_courseware_sort` int(11) NOT NULL DEFAULT 4,
  `menu_courseware_show` tinyint(1) NOT NULL DEFAULT 1,
  `live_back_index` tinyint(1) NULL DEFAULT 0 COMMENT '直播间返回首页 0关闭 1开启',
  `room_tips` tinyint(1) NULL DEFAULT 1 COMMENT '0关闭1开启',
  `menu_rank_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '榜单',
  `menu_rank_sort` int(11) NOT NULL DEFAULT 5,
  `menu_rank_show` tinyint(1) NOT NULL DEFAULT 1,
  `is_rank` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启榜单 0不开启 1开启',
  `is_gift_rank_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启打赏榜 0不开启 1开启',
  `is_online_num_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启在线人数显示 0不开启 1开启',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_sys_live_robot`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `nickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatarUrl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_sys_login`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `login_style_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '登录弹窗样式 1固定样式 2自定义热区',
  `privacy_agreement_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '隐私协议开关 0关闭 1开启',
  `yhfwxy_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户服务协议',
  `yhyszc_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户隐私政策',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `is_show_desc` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_tmplmsg_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '模板通知类型1历史模板 2类目模板',
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'appid',
  `appsecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'app_secret',
  `openid` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'openid',
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '平台ID',
  `is_yhxdcgtx` tinyint(1) NOT NULL DEFAULT 0,
  `yhxdcgtx_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_yhxdcgtx_free_send` tinyint(1) NOT NULL DEFAULT 1 COMMENT '免费订单是否提醒 0不提醒 1提醒',
  `is_zccgtz` tinyint(1) NOT NULL DEFAULT 0,
  `zccgtz_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_kctz` tinyint(1) NOT NULL DEFAULT 0,
  `kctz_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_sjtjtx` tinyint(1) NOT NULL DEFAULT 0,
  `sjtjtx_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_shzttx` tinyint(1) NOT NULL DEFAULT 0,
  `shzttx_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_groupbuy` tinyint(1) NOT NULL DEFAULT 0,
  `groupbuy_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_yhsqtktz` tinyint(1) NOT NULL DEFAULT 0,
  `yhsqtktz_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ttapp_class`  (
  `id` int(11) UNSIGNED NOT NULL COMMENT '抖音类目ID',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '层级 1、2、3',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '抖音上级类目 ID',
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类目名称',
  `class_definition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类定义',
  `document_link` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '具体文档链接',
  `professional_certification` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '专业认证',
  `professional_education` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '专业性学历',
  `qualification_tip` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '行业资质提醒',
  `special_tip` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '特殊提醒',
  `teacher_qualification_certificate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '教师资格证',
  `special_qualification` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '特殊资质',
  `is_upload_special_qualification` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否上传特殊资质 0不上传 1上传',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ttapp_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'appid',
  `app_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密钥',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `mch_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pay_app_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pay_app_secret` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_wxpay` tinyint(1) NULL DEFAULT NULL,
  `wxpay_id` int(11) NULL DEFAULT NULL,
  `is_alipay` tinyint(1) NULL DEFAULT NULL,
  `alipay_id` int(11) NULL DEFAULT NULL,
  `token` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'token',
  `salt` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'salt',
  `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭',
  `ios_pay_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS支付 1跟随全局 2自定义',
  `is_ios_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS端支付 0关闭支付 1开启支付',
  `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '由于相关规范，ios功能暂不可用' COMMENT 'IOS无法支付文案',
  `is_video` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启视频挂载权限 0关闭 1开启',
  `video_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '视频挂载图标',
  `app_private_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `app_public_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `douyin_private_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `douyin_public_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `douyin_course` int(11) NOT NULL DEFAULT 0 COMMENT '是否接入课程库0未接入 1已接入',
  `course_callback` tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程库回调 0未设置 1已设置',
  `create_order_callback` tinyint(1) NOT NULL DEFAULT 0 COMMENT '预下单回调  0未设置 1已设置',
  `refund_callback` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款回调  0未设置 1已设置',
  `jiesuan_day` int(11) NOT NULL DEFAULT 7 COMMENT '结算天数',
  `key_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '公钥版本',
  `operation_mode` tinyint(1) NOT NULL DEFAULT 0 COMMENT '运营模式 0未设置 1自营模式 2服务商模式',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ttapp_enable`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lecturer_id` int(11) NOT NULL COMMENT '讲师ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `mount_scope` int(2) NOT NULL DEFAULT 1 COMMENT '1:短视频挂载 2:直播挂载 3：抖音IM能力',
  `status` int(2) NOT NULL DEFAULT 1 COMMENT '1绑定中 2绑定成功 3绑定失败 4解除能力授权',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ttapp_entity_basic_auth`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `entity_type` tinyint(1) NOT NULL COMMENT '实体类型 1个人 2企业',
  `entity_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实体名称 个人姓名 或者 企业名称',
  `certificate_type` tinyint(1) NOT NULL COMMENT '证件照类型 1身份证 2营业执照',
  `enterprise_certificate_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营业执照编号',
  `enterprise_certificate_material_expiretime_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1自定义时间 2长期有效',
  `enterprise_certificate_material_expiretime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '材料过期时间',
  `enterprise_certificate_material_paths` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '材料链接，字符串数组',
  `person_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人或个人姓名',
  `person_id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人或个人身份证号',
  `person_expire_time_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1自定义时间 2长期有效',
  `person_expire_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业法人或个人身份证有效期',
  `person_front_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '企业法人或个人身份证正面',
  `person_back_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '企业法人或个人身份证反面',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为默认 0不是 1是',
  `is_fws` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是服务商 0不是 1是',
  `entity_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实体ID',
  `uniacid` int(11) NOT NULL COMMENT '店铺ID',
  `basic_auth_taskid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '基础认证任务ID',
  `audit_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0初始 1认证中 2认证成功 3认证失败',
  `audit_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核失败的原因',
  `add_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `submit_audit_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `handle_audit_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `institution_scene_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构场景类型（仅可填写\"线上机构\"或\"线下机构\"）',
  `institution_subject_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构主体类型（仅可填写\"企业工商户\"或\"个体工商户\"）',
  `institution_logo_uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '机构Logo图片uri，需要调用上传资源接口后获得',
  `institution_trademark_uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商标注册证图片uri，若机构名称与机构logo一致性差，则需提供，需要调用上传后获得',
  `institution_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '机构介绍，\r\n字符长度限制12<=len<= 2000(汉字占 2 字符)',
  `is_bind_xcx` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否绑定过小程序 0未1 已',
  `partner_company_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务商 企业工商户/个体工商户',
  `partner_company_addr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '服务商 营业执照上公司地址',
  `partner_cooperation_cases` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '服务商 合作案例资料图片',
  `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联讲师ID',
  `auth_letters_material` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '授权函相关',
  `bind_taskid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权小程序任务ID',
  `auth_audit_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0初始 1认证中 2认证成功 3认证失败',
  `auth_audit_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '授权失败的原因',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ttapp_entity_class_auth`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `e_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '内部e_id',
  `industry_code` int(11) NOT NULL DEFAULT 10000 COMMENT '行业编码',
  `industry_first_class` int(11) NOT NULL,
  `industry_second_class` int(11) NOT NULL,
  `industry_third_class` int(11) NOT NULL DEFAULT 0,
  `industry_role` int(11) NOT NULL COMMENT '行业角色 1老师 2机构 3代运营服务商',
  `qualifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `uniacid` int(11) UNSIGNED NOT NULL COMMENT '店铺ID',
  `audit_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '审核状态 0默认 1审核中 2审核成功 3审核失败',
  `audit_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核失败的原因',
  `class_auth_taskid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目认证任务ID',
  `add_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `submit_audit_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `handle_audit_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `employee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `employee_id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工身份证号码',
  `employee_expire_time_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1自定义时间 2长期有效',
  `employee_expire_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工身份证有效期',
  `employee_front_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '员工身份证正面',
  `employee_back_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '员工身份证反面',
  `cooperation_agreement_material_expiretime_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1自定义时间 2长期有效',
  `cooperation_agreement_material_expiretime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工合作协议有效期',
  `cooperation_agreement_material_paths` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '员工合作协议',
  `special_qualifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '特殊协议',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ttapp_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `time2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ttapp_material`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `material_type` int(11) NOT NULL DEFAULT 0,
  `uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `material_type`(`material_type`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_ttapp_resource`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '素材路径',
  `uri` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '抖音返回资源uri',
  `resource_type` int(11) NOT NULL DEFAULT 1 COMMENT '课程相关	\r\n1商品详情图 2商品视频履约内容 3商品音频履约内容 4商品图片履约内容 100商品其他履约内容\r\n\r\n资质相关\r\n21老师身份证照片 22机构法人身份证照片 23老师资质照片 24机构资质照片 25机构logo照片 \r\n\r\n交易展示相关\r\n31课程展示图片 32老师展示图片 33机构展示图片',
  `log_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志id，用于查询错误',
  `json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '抖音响应信息',
  `state` int(11) NOT NULL DEFAULT -1 COMMENT '资源上传状态 -1未上传 1已上传',
  `state_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '资源上传回调信息',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `sh_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '资源审核信息',
  `audit_status` int(11) NOT NULL DEFAULT 1 COMMENT '履约内容审核结果 1初始值未审核 2通过 3没通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type` int(11) NOT NULL COMMENT '1课程 2商品 3文章 4试卷 5活动 6资料 7打卡 8相册 9测评 10超级考试',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分类图片',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0隐藏 1显示',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `level` int(11) NOT NULL DEFAULT 1 COMMENT '级别',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `level`(`level`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `nickName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `avatarUrl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `trueName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `gender` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未知 1男 2女',
  `wxapp_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信小程序openid',
  `wxh5_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信公众号openid',
  `bdapp_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '百度小程序openid',
  `ttapp_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字节跳动小程序openid',
  `ksapp_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手小程序openid',
  `is_h5` tinyint(1) NULL DEFAULT 0 COMMENT '0',
  `is_app` tinyint(1) NULL DEFAULT 0 COMMENT '0',
  `is_pc` tinyint(1) NULL DEFAULT 0 COMMENT '0',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '盐值',
  `regtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册时间',
  `last_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后活跃时间',
  `state` tinyint(1) NOT NULL DEFAULT 2 COMMENT '用户状态  0为拉黑 1为游客 2为用户',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级ID 0代表平台',
  `is_distributor` int(11) NOT NULL DEFAULT 1 COMMENT '1普通用户 2审核中分销商 3审核通过分销商 4审核拒绝分销商',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `unionid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '开放平台唯一标识',
  `is_user` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有用户信息 0没有 1有',
  `lid` int(11) NOT NULL DEFAULT 0 COMMENT '标签id',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'token',
  `bind_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '与分销商绑定时间 为空则为注册时间（兼容之前）',
  `wxstore_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信小店openid',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gender`(`gender`) USING BTREE,
  INDEX `lid`(`lid`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `is_distributor`(`is_distributor`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `wxapp_openid`(`wxapp_openid`) USING BTREE,
  INDEX `wxh5_openid`(`wxh5_openid`) USING BTREE,
  INDEX `bdapp_openid`(`bdapp_openid`) USING BTREE,
  INDEX `ttapp_openid`(`ttapp_openid`) USING BTREE,
  INDEX `ksapp_openid`(`ksapp_openid`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `wxstore_openid`(`wxstore_openid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_annex`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `annex_id` int(11) NOT NULL COMMENT '资料ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `buy_type` tinyint(1) NOT NULL COMMENT '-1 助力 0、1购买 2兑换码 3买课送 5积分商城 7幸运抽奖 8拼团 10广告获取',
  `course_id` int(11) NOT NULL DEFAULT 0 COMMENT '通过哪个课程领取的',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_assess`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `assess_id` int(11) NOT NULL COMMENT '测评ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `buy_type` tinyint(1) NOT NULL COMMENT '1免费领取 2购买 10广告获取',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_batch_import`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导入时间',
  `random_code` int(11) NOT NULL DEFAULT 0 COMMENT '随机数',
  `total` int(11) NOT NULL DEFAULT 0,
  `yes` int(11) NOT NULL DEFAULT 0,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `random_code`(`random_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_batch_import_error`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `import_id` int(11) NOT NULL COMMENT '批次ID',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `error_msg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '错误原因',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `import_id`(`import_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_batch_import_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `import_id` int(11) NOT NULL COMMENT '导入ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `import_id`(`import_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_cache`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_car`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `good_id` int(11) NOT NULL COMMENT '商品ID',
  `num` int(11) NOT NULL COMMENT '数量',
  `unit_price` decimal(10, 2) NOT NULL COMMENT '单价',
  `total_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '总价',
  `goods_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品信息',
  `goods_str` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格信息',
  `sign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '-1' COMMENT '规格ID',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `good_id`(`good_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_cert`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cert_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证书路径',
  `type` int(11) NOT NULL COMMENT '1试卷证书',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证书标题',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `r_id` int(11) NULL DEFAULT NULL COMMENT '关联ID',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '试卷ID',
  `q_id` int(11) NULL DEFAULT NULL COMMENT '题库ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '店铺ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `paper_font_size_type` int(11) NOT NULL DEFAULT 1 COMMENT '试卷/超级试卷 字号大小 1标准 2大 3超大',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `u_uid`(`uniacid`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ua` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `last_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `u_i`(`uniacid`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_integral`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `origin` tinyint(1) NOT NULL DEFAULT 1 COMMENT '来源1用户 2后台',
  `integral` int(11) NOT NULL COMMENT '积分',
  `type` tinyint(1) NOT NULL COMMENT '1加 2减',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '后台备注',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `order_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_lable`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniacid` int(11) NOT NULL,
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标签描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_login_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '时间',
  `count` int(11) NOT NULL DEFAULT 1 COMMENT '次数',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `time`(`time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_paper`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `paper_id` int(11) NOT NULL COMMENT '试卷ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '平台ID',
  `buy_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '-1 助力 0、1购买 2兑换码 3买课送 5积分商城 7幸运抽奖 8拼团 10广告获取',
  `course_id` int(11) NOT NULL DEFAULT 0 COMMENT '通过哪个课程领取的',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_product_batch_import`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导入时间',
  `random_code` int(11) NOT NULL DEFAULT 0 COMMENT '随机数',
  `total` int(11) NOT NULL DEFAULT 0,
  `yes` int(11) NOT NULL DEFAULT 0,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` int(2) NOT NULL DEFAULT 1 COMMENT '1课程',
  `product_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `random_code`(`random_code`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_product_batch_import_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `import_id` int(11) NOT NULL COMMENT '导入ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `product_id` int(11) NOT NULL,
  `product_type` int(2) NOT NULL DEFAULT 1,
  `type` tinyint(1) NOT NULL,
  `days` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `import_id`(`import_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_punchcard`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `punchcard_id` int(11) NOT NULL COMMENT '打卡ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `buy_type` int(11) NOT NULL DEFAULT 1 COMMENT '1免费获得 2付费购买 3课程赠送 10广告获取',
  `course_id` int(11) NOT NULL DEFAULT 0 COMMENT '课程ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `first_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首次提交时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `punchcard_id`(`punchcard_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_sign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `lianxu_day` int(11) NOT NULL DEFAULT 0 COMMENT '连续天数',
  `leiji_day` int(11) NOT NULL DEFAULT 0 COMMENT '累计天数',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_sign_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `integral` int(11) NOT NULL COMMENT '积分数',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1普通签到 2连续签到奖励 3累计签到奖励',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间格式',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间戳',
  `day` int(11) NOT NULL COMMENT '天数',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_super_exam`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `exam_id` int(11) NOT NULL COMMENT '试卷ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '平台ID',
  `buy_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '-1买课送 1购买 2兑换码 3会员免费看 4超级会员 5积分商城 6后台 7幸运抽奖 10广告获取',
  `course_id` int(11) NOT NULL DEFAULT 0 COMMENT '通过哪个课程领取的',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `exam_id`(`exam_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_view_footprint_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_view_footprint_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `log_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录类型 1记录每次访问 2记录最新访问',
  `is_diy_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_article_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_course_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_course_buy_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已购买用户足迹 0关闭 1开启',
  `is_good_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_annex_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_annex_buy_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_paper_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_paper_buy_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_superExam_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_superExam_buy_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_enroll_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_vip_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_vip_buy_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_svip_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_svip_buy_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_integralGood_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_groupbuy_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_punchcard_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_punchcard_buy_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_assess_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_assess_buy_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_ai_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_ai_buy_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_circle_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_circle_buy_status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_users_wallet`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `balance` decimal(10, 2) NOT NULL COMMENT '余额',
  `integral` int(11) NOT NULL COMMENT '积分',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_vip`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `over_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0非会员 -1永久 其他时间戳',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `buy_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1购买 2兑换码 3后台',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_vip_card`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `type` tinyint(1) NOT NULL COMMENT '1自定义天数 2永久',
  `day` int(11) NULL DEFAULT NULL COMMENT '天数',
  `price` decimal(10, 2) NOT NULL COMMENT '金额',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0隐藏 1显示',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `vip_card_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_vip_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_price` decimal(10, 2) NOT NULL,
  `total_pay_price` decimal(10, 2) NOT NULL,
  `s_remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `submit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支付 0未支付 1已支付',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '1微信普通支付 2支付宝支付 3百度收银台',
  `pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distribute_price` decimal(10, 2) NULL DEFAULT NULL,
  `surplus_price` decimal(10, 2) NULL DEFAULT NULL,
  `vip_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '快照',
  `deviceType` int(11) NULL DEFAULT NULL COMMENT '端',
  `baidu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '百度支付回调',
  `payData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调',
  `card_id` int(11) NOT NULL DEFAULT 0 COMMENT '会员卡ID',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '1开通会员 2续费会员 3到期续费会员',
  `day` int(11) NULL DEFAULT NULL COMMENT '天数',
  `tt_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号',
  `ks_settle_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号',
  `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有',
  `form_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表单数据',
  `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销',
  `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `card_id`(`card_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `out_trade_no`(`out_trade_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_vip_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员卡名称',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容详情',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `free_receive` int(11) NOT NULL DEFAULT 0 COMMENT '产品免费领取逻辑 1直接可以观看 0需点击免费领取',
  `good_vip_buy` tinyint(1) NOT NULL DEFAULT 0 COMMENT '商品仅会员可购买 0关闭 1开启',
  `good_buy_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品仅会员购买文字 默认为仅会员购买',
  `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '会员表单ID',
  `vip_course_free_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '会员课程免费看',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_vote`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投票活动名称',
  `strat_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `imglist` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图设置',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缩略图',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动介绍',
  `prize` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动奖品',
  `sponsor_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主办方名称',
  `sponsor_phone` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主办方联系电话',
  `phone_sign` tinyint(1) NOT NULL DEFAULT 1 COMMENT '手机报名 1开启 0关闭',
  `sign_examine` tinyint(1) NOT NULL COMMENT '报名审核 1审核 0不审核',
  `vote_total_count_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户总投票次数设置 0不限制 1限制',
  `vote_total_count` int(11) NOT NULL DEFAULT 0 COMMENT '用户总投票次数',
  `vote_day_count` int(11) NOT NULL DEFAULT 1 COMMENT '每人每天投票次数',
  `vote_people_day_count` int(11) NOT NULL DEFAULT 1 COMMENT '每人单日同一项被投票次数',
  `is_code` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1需要验证码 0不需要验证码',
  `view_num` int(11) NOT NULL DEFAULT 0 COMMENT '默认浏览数',
  `fictitious_view` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟浏览数',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `state` int(1) NOT NULL DEFAULT 1 COMMENT '状态 0隐藏 1显示',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题色',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `poster` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '海报',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_vote_sign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `code` int(11) NOT NULL DEFAULT 0 COMMENT '编号',
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参赛者名称',
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参赛描述',
  `imglist` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参赛图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参赛内容',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `avatarUrl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `view_num` int(11) NOT NULL DEFAULT 0 COMMENT '浏览数',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报名时间',
  `examine` tinyint(1) NOT NULL DEFAULT 1 COMMENT '审核状态 1审核中 2审核通过 3审核拒绝',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 显示 0隐藏',
  `fictitious_ticket_num` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟票数',
  `vote_id` int(11) NOT NULL COMMENT '活动ID',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '数字越大越靠前,默认排序为先添加的在前',
  `jujue_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '拒绝理由',
  `ticket_num` int(11) NOT NULL DEFAULT 0 COMMENT '真实票数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_vote_ticket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `vote_id` int(11) NOT NULL COMMENT '投票活动ID',
  `sign_id` int(11) NOT NULL COMMENT '选手ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投票时间',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投票时间 2022-06-01格式',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxapp_ad_product`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '类型 1课程 2资料 3试卷 4超级试卷 5打卡 6测评',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `status` tinyint(1) NOT NULL COMMENT '是否支持看广告得权益 0不支持 1支持',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxapp_ad_product_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `type` int(4) NOT NULL COMMENT '类型 1课程 2资料 3试卷 4超级试卷 5打卡 6测评',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `term_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '有效期限 1多少天内有效2永久有效',
  `term_day` int(11) NOT NULL DEFAULT 0 COMMENT '多少天内有效',
  `data_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据',
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '获得权益时间',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `time`(`time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxapp_ad_product_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `ad_unit_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告位ID',
  `max_get_product_num` int(11) NOT NULL DEFAULT 0 COMMENT '每日最多获取次数 0不限制',
  `btn_bg_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#FFF1E4' COMMENT '按钮背景颜色',
  `btn_text_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#7C4533' COMMENT '按钮文字颜色',
  `course_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `course_btn_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '看广告免费领' COMMENT '按钮文字',
  `course_default_all_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '所有默认开启状态 0关闭 1开启',
  `annex_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `annex_btn_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '看广告免费领' COMMENT '按钮文字',
  `annex_default_all_status` tinyint(255) NOT NULL DEFAULT 1 COMMENT '所有默认开启状态 0关闭 1开启',
  `paper_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `paper_btn_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '看广告免费领' COMMENT '按钮文字',
  `paper_default_all_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '所有默认开启状态 0关闭 1开启',
  `super_exam_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `super_exam_btn_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '看广告免费领' COMMENT '按钮文字',
  `super_exam_default_all_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '所有默认开启状态 0关闭 1开启',
  `punchcard_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `punchcard_btn_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '看广告免费领' COMMENT '按钮文字',
  `punchcard_default_all_status` tinyint(1) NULL DEFAULT 1 COMMENT '所有默认开启状态 0关闭 1开启',
  `assess_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `assess_btn_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '看广告免费领' COMMENT '按钮文字',
  `assess_default_all_status` tinyint(1) NULL DEFAULT 1 COMMENT '所有默认开启状态 0关闭 1开启',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxapp_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'appid',
  `appsecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密钥',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `is_wxpay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启',
  `wxpay_id` int(11) NULL DEFAULT NULL COMMENT '微信支付模板ID',
  `encodingAesKey` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `token` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭',
  `upload_private_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上传密钥',
  `ios_pay_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS支付 1跟随全局 2自定义',
  `is_ios_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS端支付 0关闭支付 1开启支付',
  `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '由于相关规范，ios功能暂不可用' COMMENT 'IOS无法支付文案',
  `is_use_send_manage` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否微信小程序 接入 发货管理 0未接入 1已接入',
  `is_pc_open` tinyint(1) NOT NULL DEFAULT 1 COMMENT '电脑微信小程序 0禁用 1启用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxapp_scheme`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面路径',
  `is_expire` tinyint(255) NULL DEFAULT NULL COMMENT '生成的 URL Link 类型，到期失效：1，永久有效：0',
  `expire_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到期失效的 URL Link 的失效时间，为 Unix 时间戳。生成的到期失效 URL Link 在该时间前有效。最长有效期为1年。expire_type 为 0 必填',
  `scheme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(11) NOT NULL DEFAULT 0,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxapp_subscribe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '店铺ID',
  `zbkbtx_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '直播开播提醒 0关闭 1开启',
  `zbkbtx_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直播开播提醒 模板ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxh5_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'appid',
  `appsecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密钥',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `is_wxpay` tinyint(1) NOT NULL COMMENT '0关闭 1开启',
  `wxpay_id` int(11) NULL DEFAULT NULL COMMENT '微信支付模板ID',
  `is_alipay` tinyint(1) NOT NULL COMMENT '0关闭 1开启',
  `alipay_id` int(11) NULL DEFAULT NULL COMMENT '支付宝支付模板ID',
  `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭',
  `ios_pay_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS支付 1跟随全局 2自定义',
  `is_ios_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS端支付 0关闭支付 1开启支付',
  `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '由于相关规范，ios功能暂不可用' COMMENT 'IOS无法支付文案',
  `wxh5_auth_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义授权接口',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxh5_subscribe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uniacid` int(11) NOT NULL COMMENT '店铺ID',
  `zbkbtx_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '直播开播提醒 0关闭 1开启',
  `zbkbtx_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直播开播提醒 模板ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxlive_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `goodsId` int(11) NULL DEFAULT NULL,
  `auditId` int(11) NULL DEFAULT NULL,
  `uniacid` int(11) NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxstore_class`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 未审核 1审核中  2审核不通过 3审核通过 12撤回审核',
  `audit_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核单ID',
  `reject_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核不通过原因',
  `certificate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `handle_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cat_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `cat_id`(`cat_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `audit_id`(`audit_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxstore_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `headimg_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `uniacid` int(11) NOT NULL COMMENT '店铺ID',
  `msg_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息回调token',
  `msg_aesKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息回调加密key 43位',
  `subject_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺类型，目前为\"企业\"或\"个体工商户\"',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺状态，目前为\"opening\"或\"open_finished\"或\"closing\"或\"close_finished\"',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `msg_status` tinyint(1) NULL DEFAULT 0 COMMENT '消息回调状态 0未生效 1生效（0未授权 1已授权）',
  `add_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `app_id`(`app_id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxstore_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `store_order_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_type` int(2) NOT NULL DEFAULT 1 COMMENT '产品类型 1课程',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `store_product_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wxstore_user_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NOT NULL COMMENT '商品总价',
  `order_price` decimal(10, 2) NOT NULL COMMENT '用户实付金额',
  `change_down_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '改价后降低金额',
  `sku_cnt` int(11) NOT NULL DEFAULT 1 COMMENT 'sku数量\r\n',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0,
  `is_fahuo` tinyint(1) NOT NULL DEFAULT 0,
  `is_shouhuo` tinyint(1) NOT NULL DEFAULT 0,
  `is_settle` tinyint(1) NOT NULL DEFAULT 0,
  `settle_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `store_order_id`(`store_order_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_type`(`product_type`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `store_product_id`(`store_product_id`) USING BTREE,
  INDEX `is_pay`(`is_pay`) USING BTREE,
  INDEX `is_fahuo`(`is_fahuo`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxstore_order_aftersale`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `wxstore_id` int(11) NOT NULL COMMENT '小店ID',
  `order_id` int(11) NOT NULL,
  `type` int(2) NOT NULL DEFAULT 1 COMMENT '1 课程',
  `store_order_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '微信小店订单ID',
  `after_sale_order_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '售后订单ID',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deadline` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仅在待商家审核退款退货申请或收货期间返回，表示操作剩余时间（秒数）',
  `af_type` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后类型。REFUND:退款；RETURN:退货退款；EXCHANGE:换货。',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `wxstore_id`(`wxstore_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxstore_order_aftersale_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `receive_product` tinyint(1) NOT NULL DEFAULT 0 COMMENT '发起售后的时候用户是否已经收到货\r\n',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `media_id_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `af_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `af_id` int(11) NOT NULL COMMENT '售后单ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `af_id`(`af_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxstore_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `store_id` int(11) NOT NULL COMMENT '小店ID',
  `store_product_id` varchar(170) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小店商品ID',
  `product_type` int(2) NOT NULL DEFAULT 1 COMMENT '产品类型 1课程',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `out_product_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '外部商品ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `head_imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主图',
  `deliver_method` int(2) NOT NULL DEFAULT 1 COMMENT '发货方式：0-快递发货；1-无需快递，手机号发货；3-无需快递，可选发货账号类型，默认为0，若为无需快递，则无需填写运费模版id',
  `imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品详情图片',
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品详情文本',
  `cat_id` int(11) NOT NULL COMMENT '类目ID',
  `attrs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品参数',
  `brand_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌id，无品牌为“2100000000”品牌id，无品牌为“2100000000”',
  `product_qua_infos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品资质列表',
  `aftersale_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '售后说明',
  `is_xiangou` tinyint(1) NOT NULL COMMENT '是否限购 0不限购 1限购',
  `limited_info_period_type` int(2) NOT NULL DEFAULT 0 COMMENT '限购周期类型，0:无限购（默认），1:按自然日限购，2:按自然周限购，3:按自然月限购，4:按自然年限购',
  `limited_info_limited_buy_num` int(11) NOT NULL DEFAULT 5 COMMENT '限购数量',
  `seven_day_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支持七天无理由退货，0-不支持七天无理由，1-支持七天无理由，2-支持七天无理由(定制商品除外)，3-支持七天无理由(使用后不支持)。',
  `freight_insurance` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支持运费险，0-不支持运费险，1-支持运费险。',
  `fake_one_pay_three` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支持假一赔三，0-不支持假一赔三，1-支持假一赔三',
  `damage_guarantee` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否支持坏损包退，0-不支持坏损包退，1-支持坏损包退。',
  `after_sale_address_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后/退货地址id，使用地址管理相关接口进行添加或获取',
  `data_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1线上数据',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '商品线上状态0初始值 5上架 6回收站 9彻底删除 11自主下架 13违规下架/风控系统下架 14保证金不足下架 15品牌过期下架 20商品被封禁',
  `edit_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '商品草稿状态0初始值 1编辑中 2审核中 3审核失败 4审核成功 7商品异步提交上传中 8商品异步提交 上传失败',
  `reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `add_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `handle_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `page_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '落地页内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `store_product_id`(`store_product_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `out_product_id`(`out_product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxstore_product_sku`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `store_id` int(11) NOT NULL,
  `store_product_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小店商品ID',
  `out_product_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sku_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `out_sku_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `thumb_img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `sale_price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `stock_num` int(11) NOT NULL DEFAULT 99999,
  `sku_attrs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '销售属性',
  `stock_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sku库存情况。0:现货（默认），1:全款预售。部分类目支持全款预售，具体参考文档获取类目信息中的字段attr.pre_sale',
  `full_payment_presale_delivery_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sku发货节点，该字段仅对stock_type=1有效。0:付款后n天发货，1:预售结束后n天发货',
  `presale_begin_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `presale_end_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `full_payment_presale_delivery_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1线上数据',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `store_product_id`(`store_product_id`) USING BTREE,
  INDEX `out_product_id`(`out_product_id`) USING BTREE,
  INDEX `sku_id`(`sku_id`) USING BTREE,
  INDEX `out_sku_id`(`out_sku_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxstore_resource`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1资质 2其他图片',
  `store_id` int(11) NOT NULL COMMENT '小店ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxstore_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `is_order_qsk` tinyint(1) NOT NULL DEFAULT 1 COMMENT '去上课开关',
  `is_message` tinyint(1) NOT NULL DEFAULT 0,
  `msg_jump_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1微信小程序 2公众号/h5',
  `delivery_priority` tinyint(1) NOT NULL DEFAULT 1 COMMENT '交付课程优先级 1手机号 2微信卡爱法昂平台',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

CREATE TABLE IF NOT EXISTS `ims_yzd_kp_wxstroe_class_all`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cat_id` int(11) NOT NULL COMMENT '小店类目ID',
  `f_cat_id` int(11) NOT NULL COMMENT '小店父类目ID',
  `level` int(2) NOT NULL DEFAULT 0 COMMENT '级',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类目名称 ',
  `leaf` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为叶子类目（品类）',
  `product_qua_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `qua` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cat_id`(`cat_id`) USING BTREE,
  INDEX `f_cat_id`(`f_cat_id`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  INDEX `leaf`(`leaf`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

ALTER TABLE ims_yzd_kp_distribute_grade ADD COLUMN good_dis tinyint(1) NOT NULL DEFAULT 1 AFTER `vip_commission_3`;
ALTER TABLE ims_yzd_kp_distribute_grade ADD COLUMN good_commission_type tinyint(1) NOT NULL DEFAULT 0 AFTER `good_dis`;
ALTER TABLE ims_yzd_kp_distribute_grade ADD COLUMN good_commission_1 decimal(10, 2) NOT NULL DEFAULT 20.00 AFTER `good_commission_type`;
ALTER TABLE ims_yzd_kp_distribute_grade ADD COLUMN good_commission_2 decimal(10, 2) NOT NULL DEFAULT 10.00 AFTER `good_commission_1`;
ALTER TABLE ims_yzd_kp_distribute_grade ADD COLUMN good_commission_3 decimal(10, 2) NOT NULL DEFAULT 5.00 AFTER `good_commission_2`;
ALTER TABLE ims_yzd_kp_distribute_order MODIFY COLUMN type int(11) NOT NULL COMMENT '订单类型 1课程 2会员卡 3商城' AFTER `id`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN good_dis tinyint(1) NOT NULL DEFAULT 0 AFTER `vip_commission_3`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN good_commission_type tinyint(1) NOT NULL DEFAULT 1 AFTER `good_dis`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN good_commission_1 decimal(10, 2) NOT NULL DEFAULT 20.00 AFTER `good_commission_type`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN good_commission_2 decimal(10, 2) NOT NULL DEFAULT 10.00 AFTER `good_commission_1`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN good_commission_3 decimal(10, 2) NOT NULL DEFAULT 5.00 AFTER `good_commission_2`;
ALTER TABLE ims_yzd_kp_poster ADD COLUMN good longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品' AFTER `dis`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN btn1BgColor varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `priceColor`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN btn2BgColor varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `btn1BgColor`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN auto_confirm_time int(11) NOT NULL DEFAULT 7 COMMENT '自动确认收货时间 单位天' AFTER `no_pay_cancel_time`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN kd_type int(11) NOT NULL DEFAULT 0 COMMENT '快递接口类型 0关闭 1快递鸟 2阿里云' AFTER `auto_confirm_time`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN kdn_id longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'kdn_id' AFTER `kd_type`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN kdn_key longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'kdn_key' AFTER `kdn_id`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN aly_appcode longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'aly_appcode' AFTER `kdn_key`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN shop_type_style int(11) NOT NULL DEFAULT 1 COMMENT '商城分类样式' AFTER `aly_appcode`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN dyj_type int(11) NOT NULL DEFAULT 0 COMMENT '打印机类型 0关闭 1易联云' AFTER `shop_type_style`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN yly_zdh varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `dyj_type`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN yly_my varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `yly_zdh`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN yly_user_id varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `yly_my`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN yly_apikey varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `yly_user_id`;
ALTER TABLE ims_yzd_kp_sys MODIFY COLUMN priceColor varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '价格颜色' AFTER `mainColor`;



ALTER TABLE ims_yzd_kp_course_order MODIFY COLUMN distribute_price decimal(10, 2) NULL DEFAULT NULL COMMENT '分销佣金' AFTER `auto_sales_time`;
ALTER TABLE ims_yzd_kp_course_order MODIFY COLUMN surplus_price decimal(10, 2) NULL DEFAULT NULL COMMENT '平台的钱' AFTER `distribute_price`;
ALTER TABLE ims_yzd_kp_course_order MODIFY COLUMN integral int(11) NULL DEFAULT NULL COMMENT '该订单积分' AFTER `surplus_price`;
ALTER TABLE ims_yzd_kp_course_order MODIFY COLUMN deviceType int(11) NULL DEFAULT NULL COMMENT '端' AFTER `before_time`;
ALTER TABLE ims_yzd_kp_vip_order MODIFY COLUMN distribute_price decimal(10, 2) NULL DEFAULT NULL AFTER `pay_time`;
ALTER TABLE ims_yzd_kp_vip_order MODIFY COLUMN surplus_price decimal(10, 2) NULL DEFAULT NULL AFTER `distribute_price`;
ALTER TABLE ims_yzd_kp_vip_order MODIFY COLUMN deviceType int(11) NULL DEFAULT NULL COMMENT '端' AFTER `vip_data`;
ALTER TABLE ims_yzd_kp_vip_order MODIFY COLUMN type tinyint(1) NULL DEFAULT NULL COMMENT '1开通会员 2续费会员 3到期续费会员' AFTER `card_id`;

ALTER TABLE ims_yzd_kp_course_order ADD COLUMN payData longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调' AFTER `baidu`;
ALTER TABLE ims_yzd_kp_course_order MODIFY COLUMN pay_type int(11) NOT NULL DEFAULT 0 COMMENT '1微信支付 2支付宝支付 3百度小程序支付 4免费领取 5会员免费领取 6字节跳动微信支付 7字节跳动支付宝支付 8字节跳动银行卡支付 9通过课程免费兑换 ' AFTER `is_pay`;
ALTER TABLE ims_yzd_kp_distribute_order MODIFY COLUMN one_money decimal(10, 2) NOT NULL DEFAULT 0.00 AFTER `three_user_id`;
ALTER TABLE ims_yzd_kp_distribute_order MODIFY COLUMN two_money decimal(10, 2) NOT NULL DEFAULT 0.00 AFTER `one_money`;
ALTER TABLE ims_yzd_kp_distribute_order MODIFY COLUMN three_money decimal(10, 2) NOT NULL DEFAULT 0.00 AFTER `two_money`;
ALTER TABLE ims_yzd_kp_distribute_wallet MODIFY COLUMN ktx_money decimal(10, 2) NULL DEFAULT 0.00 COMMENT '可提现金额' AFTER `dis_id`;
ALTER TABLE ims_yzd_kp_distribute_wallet MODIFY COLUMN ytx_money decimal(10, 2) NULL DEFAULT 0.00 COMMENT '已提现金额' AFTER `ktx_money`;
ALTER TABLE ims_yzd_kp_distribute_wallet MODIFY COLUMN bktx_money decimal(10, 2) NULL DEFAULT 0.00 COMMENT '不可提现金额' AFTER `ytx_money`;
ALTER TABLE ims_yzd_kp_distribute_wallet MODIFY COLUMN txz_money decimal(10, 2) NULL DEFAULT 0.00 COMMENT '提现中金额' AFTER `bktx_money`;
ALTER TABLE ims_yzd_kp_form MODIFY COLUMN type int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单' AFTER `title`;
ALTER TABLE ims_yzd_kp_form_data MODIFY COLUMN type int(11) NOT NULL DEFAULT 1 COMMENT '1课程表单 2表单 3试卷表单' AFTER `id`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN token longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'token' AFTER `alipay_id`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN salt longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'salt' AFTER `token`;
ALTER TABLE ims_yzd_kp_vip_order ADD COLUMN payData longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他支付回调' AFTER `baidu`;

ALTER TABLE ims_yzd_kp_course_order MODIFY COLUMN cancel_time varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消时间' AFTER `cancel_state`;
ALTER TABLE ims_yzd_kp_course_term ADD COLUMN buy_type int(11) NOT NULL DEFAULT 1 COMMENT '1购买' AFTER `course_type`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN vip_dis tinyint(1) NULL DEFAULT 0 AFTER `course_commission_3`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN vip_commission_type tinyint(1) NULL DEFAULT 1 AFTER `vip_dis`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN vip_commission_1 decimal(10, 2) NULL DEFAULT 20.00 AFTER `vip_commission_type`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN vip_commission_2 decimal(10, 2) NULL DEFAULT 10.00 AFTER `vip_commission_1`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN vip_commission_3 decimal(10, 2) NULL DEFAULT 2.00 AFTER `vip_commission_2`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN good_dis tinyint(1) NULL DEFAULT 0 AFTER `vip_commission_3`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN good_commission_type tinyint(1) NULL DEFAULT 1 AFTER `good_dis`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN good_commission_1 decimal(10, 2) NULL DEFAULT 20.00 AFTER `good_commission_type`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN good_commission_2 decimal(10, 2) NULL DEFAULT 10.00 AFTER `good_commission_1`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN good_commission_3 decimal(10, 2) NULL DEFAULT 5.00 AFTER `good_commission_2`;
ALTER TABLE ims_yzd_kp_question_item MODIFY COLUMN sort int(11) NOT NULL DEFAULT 0 COMMENT '排序 先添加的在前 数字越小越靠前' AFTER `score`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN login_style longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '登录弹窗数据' AFTER `yly_apikey`;

ALTER TABLE ims_yzd_kp_storage ADD COLUMN youpaiyun longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_storage_list ADD COLUMN data longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `duration`;
ALTER TABLE ims_yzd_kp_users_paper ADD COLUMN buy_type tinyint(1) NOT NULL DEFAULT 1 AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_vip ADD COLUMN buy_type tinyint(1) NOT NULL DEFAULT 1 AFTER `uniacid`;


ALTER TABLE ims_yzd_kp_distribute_grade ADD COLUMN enroll_dis tinyint(1) NOT NULL DEFAULT 1 AFTER `good_commission_3`;
ALTER TABLE ims_yzd_kp_distribute_grade ADD COLUMN enroll_commission_type tinyint(1) NOT NULL DEFAULT 1 AFTER `enroll_dis`;
ALTER TABLE ims_yzd_kp_distribute_grade ADD COLUMN enroll_commission_1 decimal(10, 2) NOT NULL DEFAULT 20.00 AFTER `enroll_commission_type`;
ALTER TABLE ims_yzd_kp_distribute_grade ADD COLUMN enroll_commission_2 decimal(10, 2) NOT NULL DEFAULT 10.00 AFTER `enroll_commission_1`;
ALTER TABLE ims_yzd_kp_distribute_grade ADD COLUMN enroll_commission_3 decimal(10, 2) NOT NULL DEFAULT 5.00 AFTER `enroll_commission_2`;
ALTER TABLE ims_yzd_kp_distribute_grade MODIFY COLUMN good_commission_type tinyint(1) NOT NULL DEFAULT 1 AFTER `good_dis`;
ALTER TABLE ims_yzd_kp_distribute_order MODIFY COLUMN type int(11) NOT NULL COMMENT '订单类型 1课程 2会员卡 3商城 4活动报名' AFTER `id`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN enroll_dis tinyint(1) NOT NULL DEFAULT 0 AFTER `good_commission_3`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN enroll_commission_type tinyint(1) NOT NULL DEFAULT 1 AFTER `enroll_dis`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN enroll_commission_1 decimal(10, 2) NOT NULL DEFAULT 20.00 AFTER `enroll_commission_type`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN enroll_commission_2 decimal(10, 2) NOT NULL DEFAULT 10.00 AFTER `enroll_commission_1`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN enroll_commission_3 decimal(10, 2) NOT NULL DEFAULT 5.00 AFTER `enroll_commission_2`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN good_dis tinyint(1) NOT NULL DEFAULT 0 AFTER `vip_commission_3`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN good_commission_type tinyint(1) NOT NULL DEFAULT 1 AFTER `good_dis`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN good_commission_1 decimal(10, 2) NOT NULL DEFAULT 20.00 AFTER `good_commission_type`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN good_commission_2 decimal(10, 2) NOT NULL DEFAULT 10.00 AFTER `good_commission_1`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN good_commission_3 decimal(10, 2) NOT NULL DEFAULT 5.00 AFTER `good_commission_2`;
ALTER TABLE ims_yzd_kp_form MODIFY COLUMN type int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单' AFTER `title`;
ALTER TABLE ims_yzd_kp_form_data MODIFY COLUMN type int(11) NOT NULL DEFAULT 1 COMMENT '1课程表单 2表单 3试卷表单 4活动表单' AFTER `id`;
ALTER TABLE ims_yzd_kp_poster ADD COLUMN enroll longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动报名' AFTER `good`;
ALTER TABLE ims_yzd_kp_type MODIFY COLUMN type int(11) NOT NULL COMMENT '1课程 2商品 3文章 4试卷 5活动' AFTER `id`;


ALTER TABLE ims_yzd_kp_core_power ADD COLUMN file_size int(11) NOT NULL DEFAULT 0 COMMENT '文件最大尺寸MB 0为不限制' AFTER `state`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN column_menu_style tinyint(1) NOT NULL DEFAULT 1 COMMENT '专栏目录样式 1课程列表 2简约' AFTER `menu_style`;
ALTER TABLE ims_yzd_kp_diy ADD COLUMN ad longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `update_time`;
ALTER TABLE ims_yzd_kp_form MODIFY COLUMN type int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单' AFTER `title`;
ALTER TABLE ims_yzd_kp_form_data MODIFY COLUMN type int(11) NOT NULL DEFAULT 1 COMMENT '1课程表单 2表单 3试卷表单 4活动表单 5资料表单' AFTER `id`;
ALTER TABLE ims_yzd_kp_poster ADD COLUMN annex longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '资料' AFTER `article`;
ALTER TABLE ims_yzd_kp_storage_group MODIFY COLUMN type int(11) NOT NULL COMMENT '1图片 2视频 3音频 4文件' AFTER `title`;
ALTER TABLE ims_yzd_kp_storage_list MODIFY COLUMN type int(11) NOT NULL COMMENT '1图片 2视频 3音频 4文件' AFTER `path`;
ALTER TABLE ims_yzd_kp_type MODIFY COLUMN type int(11) NOT NULL COMMENT '1课程 2商品 3文章 4试卷 5活动 6资料' AFTER `id`;

ALTER TABLE ims_yzd_kp_poster ADD COLUMN daily longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '感悟' AFTER `annex`;

ALTER TABLE ims_yzd_kp_daily_perception MODIFY COLUMN content longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '感悟内容' AFTER `time`;
ALTER TABLE ims_yzd_kp_good_order ADD COLUMN is_minishop tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为微信小程序交易组件支付 0不是 1是' AFTER `good_type`;
ALTER TABLE ims_yzd_kp_good_order ADD COLUMN minishop_ticket varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `is_minishop`;
ALTER TABLE ims_yzd_kp_good_order ADD COLUMN minishop_order_id varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `minishop_ticket`;


ALTER TABLE ims_yzd_kp_annex_order ADD COLUMN tt_settle_no varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号' AFTER `payData`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN tt_settle_no varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号' AFTER `payData`;
ALTER TABLE ims_yzd_kp_enroll_order ADD COLUMN tt_settle_no varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号' AFTER `code`;
ALTER TABLE ims_yzd_kp_good_order ADD COLUMN tt_settle_no varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号' AFTER `minishop_order_id`;
ALTER TABLE ims_yzd_kp_paper_order ADD COLUMN tt_settle_no varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号' AFTER `payData`;
ALTER TABLE ims_yzd_kp_storage_list ADD COLUMN size2 int(11) NULL DEFAULT NULL AFTER `size`;
ALTER TABLE ims_yzd_kp_storage_list ADD COLUMN state int(11) NOT NULL DEFAULT 0 COMMENT '0可用/转码完成 1未转码' AFTER `data`;
ALTER TABLE ims_yzd_kp_users MODIFY COLUMN pid int(11) NOT NULL DEFAULT 0 COMMENT '上级ID 0代表平台' AFTER `note`;
ALTER TABLE ims_yzd_kp_vip_order ADD COLUMN tt_settle_no varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字节跳动分账单号' AFTER `day`;

ALTER TABLE ims_yzd_kp MODIFY COLUMN op longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `content`;
ALTER TABLE ims_yzd_kp_annex_order ADD COLUMN use_user_coupon_id int(11) NOT NULL DEFAULT 0 COMMENT '使用的用户优惠券id' AFTER `tt_settle_no`;
ALTER TABLE ims_yzd_kp_annex_order ADD COLUMN coupon_discount_price decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券优惠金额' AFTER `use_user_coupon_id`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN use_user_coupon_id int(11) NOT NULL DEFAULT 0 COMMENT '使用的用户优惠券id' AFTER `tt_settle_no`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN coupon_discount_price decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券优惠金额' AFTER `use_user_coupon_id`;
ALTER TABLE ims_yzd_kp_paper_order ADD COLUMN use_user_coupon_id int(11) NOT NULL DEFAULT 0 COMMENT '使用的用户优惠券id' AFTER `tt_settle_no`;
ALTER TABLE ims_yzd_kp_paper_order ADD COLUMN coupon_discount_price decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券优惠金额' AFTER `use_user_coupon_id`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN coupon_set longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '优惠券设置' AFTER `login_style`;
ALTER TABLE ims_yzd_kp_vip MODIFY COLUMN buy_type tinyint(1) NOT NULL DEFAULT 1 COMMENT '1购买 2兑换码 3后台' AFTER `uniacid`;


ALTER TABLE ims_yzd_kp_annex_order ADD COLUMN ks_settle_no varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号' AFTER `coupon_discount_price`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN ks_settle_no varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号' AFTER `coupon_discount_price`;
ALTER TABLE ims_yzd_kp_course_term ADD COLUMN last_time varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后播放时间' AFTER `buy_type`;
ALTER TABLE ims_yzd_kp_enroll_order ADD COLUMN ks_settle_no varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号' AFTER `tt_settle_no`;
ALTER TABLE ims_yzd_kp_good_order ADD COLUMN ks_settle_no varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号' AFTER `tt_settle_no`;
ALTER TABLE ims_yzd_kp_nav ADD COLUMN ksapp tinyint(1) NOT NULL DEFAULT 0 COMMENT '支持快手小程序' AFTER `bdapp`;
ALTER TABLE ims_yzd_kp_paper_order ADD COLUMN ks_settle_no varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号' AFTER `coupon_discount_price`;
ALTER TABLE ims_yzd_kp_users ADD COLUMN ksapp_openid varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手小程序openid' AFTER `ttapp_openid`;
ALTER TABLE ims_yzd_kp_vip_order ADD COLUMN ks_settle_no varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手分账单号' AFTER `tt_settle_no`;

ALTER TABLE ims_yzd_kp_annex ADD COLUMN vip_free_see tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启' AFTER `update_time`;
ALTER TABLE ims_yzd_kp_contact ADD COLUMN is_wx tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_contact ADD COLUMN wx_title varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信客服标题' AFTER `is_wx`;
ALTER TABLE ims_yzd_kp_contact ADD COLUMN wx_corpId varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信企业ID' AFTER `wx_title`;
ALTER TABLE ims_yzd_kp_contact ADD COLUMN wx_url longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信客服链接' AFTER `wx_corpId`;
ALTER TABLE ims_yzd_kp_paper ADD COLUMN vip_free_see tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启' AFTER `people`;

ALTER TABLE ims_yzd_kp_poster ADD COLUMN assist longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `daily`;

ALTER TABLE ims_yzd_kp_good ADD COLUMN is_give tinyint(4) NOT NULL DEFAULT 0 COMMENT '赠送开关 0关闭 1开启' AFTER `form_id`;
ALTER TABLE ims_yzd_kp_good ADD COLUMN course_arr longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '赠送课程' AFTER `is_give`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN is_code tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭' AFTER `phone`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN is_yhxdtz tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭' AFTER `code_id`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN is_xyhzctz tinyint(1) NOT NULL DEFAULT 0 COMMENT '1开启 0关闭' AFTER `yhxdtz_id`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN xyhzctz_id varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新用户注册通知' AFTER `is_xyhzctz`;
ALTER TABLE ims_yzd_kp_message MODIFY COLUMN uniacid int(11) NOT NULL AFTER `xyhzctz_id`;

ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN fx_content longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分销说明' AFTER `notice`;

ALTER TABLE ims_yzd_kp_annex ADD COLUMN url_name longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `url`;
ALTER TABLE ims_yzd_kp_annex ADD COLUMN try_content longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试看内容' AFTER `img`;
ALTER TABLE ims_yzd_kp_annex MODIFY COLUMN type tinyint(1) NOT NULL DEFAULT 1 COMMENT '1上传 2链接 3自定义跳转' AFTER `title`;
ALTER TABLE ims_yzd_kp_daily ADD COLUMN relation_course_arr longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关联课程' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN fxzx_title longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `fx_content`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN fxyj_title2 longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `fxzx_title`;
ALTER TABLE ims_yzd_kp_users ADD COLUMN is_pc tinyint(1) NULL DEFAULT 0 COMMENT '0' AFTER `is_app`;
ALTER TABLE ims_yzd_kp_users ADD COLUMN token varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'token' AFTER `lid`;

ALTER TABLE ims_yzd_kp_core_user ADD COLUMN permission_id int(11) NOT NULL DEFAULT 0 COMMENT '权限ID' AFTER `token`;
ALTER TABLE ims_yzd_kp_core_user ADD COLUMN name varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `permission_id`;

ALTER TABLE ims_yzd_kp_sys ADD COLUMN course_comment tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程评论 0不需要审核 1需要审核' AFTER `coupon_set`;

ALTER TABLE ims_yzd_kp_sys ADD COLUMN pc_coupon_topimg longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'PC领券中心上方图' AFTER `course_comment`;

ALTER TABLE ims_yzd_kp_form MODIFY COLUMN type int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单' AFTER `title`;
ALTER TABLE ims_yzd_kp_form_data MODIFY COLUMN type int(11) NOT NULL DEFAULT 1 COMMENT '1课程表单 2表单 3试卷表单 4活动表单 5资料表单 6打卡表单' AFTER `id`;
ALTER TABLE ims_yzd_kp_type MODIFY COLUMN type int(11) NOT NULL COMMENT '1课程 2商品 3文章 4试卷 5活动 6资料 7打卡' AFTER `id`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN domain longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '独立域名' AFTER `state`;

ALTER TABLE ims_yzd_kp_article ADD COLUMN relation_position tinyint(1) NOT NULL DEFAULT 2 COMMENT '1顶部 2底部' AFTER `update_time`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN relation_course_show tinyint(1) NOT NULL DEFAULT 0 AFTER `relation_position`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN relation_course_arr longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `relation_course_show`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN relation_good_show tinyint(1) NOT NULL DEFAULT 0 AFTER `relation_course_arr`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN relation_good_arr longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `relation_good_show`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN relation_paper_show tinyint(1) NOT NULL DEFAULT 0 AFTER `relation_good_arr`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN relation_paper_arr longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `relation_paper_show`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN relation_annex_show tinyint(1) NOT NULL DEFAULT 0 AFTER `relation_paper_arr`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN relation_annex_arr longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `relation_annex_show`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN relation_enroll_show tinyint(1) NOT NULL DEFAULT 0 AFTER `relation_annex_arr`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN relation_enroll_arr longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `relation_enroll_show`;
ALTER TABLE ims_yzd_kp_type MODIFY COLUMN type int(11) NOT NULL COMMENT '1课程 2商品 3文章 4试卷 5活动 6资料 7打卡 8相册' AFTER `id`;

ALTER TABLE ims_yzd_kp_course ADD COLUMN tab_type tinyint(1) NOT NULL DEFAULT 0 COMMENT '0跟随系统 1自定义' AFTER `form_id`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN tab_list longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'tab栏目样式' AFTER `tab_type`;
ALTER TABLE ims_yzd_kp_distribute ADD COLUMN form_data longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN form_id int(11) NOT NULL DEFAULT 0 COMMENT '表单ID' AFTER `fxyj_title2`;
ALTER TABLE ims_yzd_kp_form MODIFY COLUMN type int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销' AFTER `title`;
ALTER TABLE ims_yzd_kp_form_data ADD COLUMN deviceType int(11) NOT NULL DEFAULT 0 COMMENT '端' AFTER `form_id`;
ALTER TABLE ims_yzd_kp_form_data ADD COLUMN form_data longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '原始表单' AFTER `deviceType`;
ALTER TABLE ims_yzd_kp_form_data MODIFY COLUMN type int(11) NOT NULL DEFAULT 1 COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销' AFTER `id`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN h5_url longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '手机端跳转地址' AFTER `domain`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN tab_list longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'TAB栏样式' AFTER `pc_coupon_topimg`;

ALTER TABLE ims_yzd_kp_course ADD COLUMN keyword longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关键词' AFTER `tab_list`;
ALTER TABLE ims_yzd_kp_distribute_order ADD COLUMN time varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '时间' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN code longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '全局代码块' AFTER `h5_url`;
ALTER TABLE ims_yzd_kp_vip_set ADD COLUMN free_receive int(11) NOT NULL DEFAULT 0 COMMENT '产品免费领取逻辑 1直接可以观看 0需点击免费领取' AFTER `uniacid`;

ALTER TABLE ims_yzd_kp ADD COLUMN time varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `op`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN fx_mode int(11) NOT NULL DEFAULT 1 COMMENT '分销模式 1静态模式 永久绑定 2动态模式 3竞争模式 4维护模式' AFTER `form_id`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN protect_day int(11) NOT NULL DEFAULT 30 COMMENT '保护期 单位0' AFTER `fx_mode`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN one_order int(11) NOT NULL DEFAULT 10 COMMENT '满足1级订单几个不解除关系' AFTER `protect_day`;
ALTER TABLE ims_yzd_kp_users ADD COLUMN bind_time varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '与分销商绑定时间 为空则为注册时间（兼容之前）' AFTER `token`;

ALTER TABLE ims_yzd_kp_tmplmsg_set ADD COLUMN is_kctz tinyint(1) NOT NULL DEFAULT 0 AFTER `zccgtz_id`;
ALTER TABLE ims_yzd_kp_tmplmsg_set ADD COLUMN kctz_id longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `is_kctz`;

ALTER TABLE ims_yzd_kp_course ADD COLUMN is_relation_good tinyint(1) NOT NULL DEFAULT 0 COMMENT '0否 1是' AFTER `relation_course_arr`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN relation_good_arr longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推荐商品' AFTER `is_relation_good`;
ALTER TABLE ims_yzd_kp_form MODIFY COLUMN type int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单' AFTER `title`;
ALTER TABLE ims_yzd_kp_form_data MODIFY COLUMN type int(11) NOT NULL DEFAULT 1 COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单' AFTER `id`;
ALTER TABLE ims_yzd_kp_poster ADD COLUMN assess longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `assist`;
ALTER TABLE ims_yzd_kp_type MODIFY COLUMN type int(11) NOT NULL COMMENT '1课程 2商品 3文章 4试卷 5活动 6资料 7打卡 8相册 9测评' AFTER `id`;
ALTER TABLE ims_yzd_kp_vip_set ADD COLUMN good_vip_buy tinyint(1) NOT NULL DEFAULT 0 COMMENT '商品仅会员可购买 0关闭 1开启' AFTER `free_receive`;
ALTER TABLE ims_yzd_kp_vip_set ADD COLUMN good_buy_title varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品仅会员购买文字 默认为仅会员购买' AFTER `good_vip_buy`;

ALTER TABLE ims_yzd_kp_good_order ADD COLUMN is_minishop_order tinyint(1) NOT NULL DEFAULT 0 COMMENT '0普通订单 1自定义交易组件订单' AFTER `minishop_order_id`;
ALTER TABLE ims_yzd_kp_good_order ADD COLUMN scene varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单场景值' AFTER `ks_settle_no`;
ALTER TABLE ims_yzd_kp_good_order_detail ADD COLUMN sku_id varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `three_money`;
ALTER TABLE ims_yzd_kp_wxapp_config ADD COLUMN encodingAesKey longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `wxpay_id`;
ALTER TABLE ims_yzd_kp_wxapp_config ADD COLUMN token longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `encodingAesKey`;

ALTER TABLE ims_yzd_kp_search_hot MODIFY COLUMN type int(11) NOT NULL COMMENT '课程:type=1,文章:2,商城:3,资料:4,积分商城:5,打卡搜索:6 -1论坛' AFTER `state`;
ALTER TABLE ims_yzd_kp_search_log MODIFY COLUMN type int(11) NOT NULL COMMENT '课程:type=1,文章:2,商城:3,资料:4,积分商城:5,打卡搜索:6 -1论坛' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_tmplmsg_set ADD COLUMN is_sjtjtx tinyint(1) NOT NULL DEFAULT 0 AFTER `kctz_id`;
ALTER TABLE ims_yzd_kp_tmplmsg_set ADD COLUMN sjtjtx_id longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `is_sjtjtx`;

ALTER TABLE ims_yzd_kp_distribute_order MODIFY COLUMN type int(11) NOT NULL COMMENT '订单类型 1课程 2会员卡 3商城 4活动报名 5超级会员' AFTER `id`;
ALTER TABLE ims_yzd_kp_live_set ADD COLUMN live_auth tinyint(1) NOT NULL DEFAULT 1 COMMENT '实时音视频播放权限 0关闭video 1开启live_player' AFTER `uniacid`;

ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN login_title varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `icp`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN login_bg_img longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `login_title`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN login_left_img longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `login_bg_img`;
ALTER TABLE ims_yzd_kp_exchange_data MODIFY COLUMN type int(2) NOT NULL COMMENT '类型 1课程 2会员卡 3试卷 4资料 5超级会员卡' AFTER `state`;
ALTER TABLE ims_yzd_kp_exchange_list MODIFY COLUMN type int(2) NOT NULL COMMENT '类型 1课程 2会员卡 3试卷 4资料 5超级会员卡' AFTER `title`;
ALTER TABLE ims_yzd_kp_form MODIFY COLUMN type int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单 9商品表单' AFTER `title`;
ALTER TABLE ims_yzd_kp_form_data MODIFY COLUMN type int(11) NOT NULL DEFAULT 1 COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单 9商品表单' AFTER `id`;
ALTER TABLE ims_yzd_kp_good MODIFY COLUMN form_id int(11) NOT NULL DEFAULT 0 AFTER `params`;
ALTER TABLE ims_yzd_kp_good_order ADD COLUMN is_form tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有' AFTER `scene`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN shop_form_id int(11) NOT NULL DEFAULT 0 COMMENT '商城表单' AFTER `tab_list`;

ALTER TABLE ims_yzd_kp_course MODIFY COLUMN try_time int(11) NULL DEFAULT NULL COMMENT '试看秒数' AFTER `is_try`;
ALTER TABLE ims_yzd_kp_course_info ADD COLUMN is_try tinyint(1) NOT NULL DEFAULT 0 COMMENT '试看 0否 1是' AFTER `second`;
ALTER TABLE ims_yzd_kp_course_info ADD COLUMN try_time int(11) NOT NULL DEFAULT 0 COMMENT '试看秒数 0完整试看' AFTER `is_try`;

ALTER TABLE ims_yzd_kp_course ADD COLUMN sort_type tinyint(1) NOT NULL DEFAULT 0 COMMENT '排序 0正序 1倒序' AFTER `keyword`;
ALTER TABLE ims_yzd_kp_good_order ADD COLUMN refund_kdgs_code varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司编码' AFTER `shouhou_state`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN marqueeSpeedTop int(11) NOT NULL DEFAULT 5 COMMENT '速度' AFTER `marqueeCopyright`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN marqueeSpeedBottom int(11) NOT NULL DEFAULT 7 AFTER `marqueeSpeedTop`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN bottom_copyright_show tinyint(1) NOT NULL DEFAULT 0 COMMENT '0隐藏 1显示' AFTER `shop_form_id`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN bottom_top_link longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '底部版权上方链接' AFTER `bottom_copyright_show`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN bottom_top_link_color varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '底部版权上方颜色' AFTER `bottom_top_link`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN bottom_b_link longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '底部版权下方链接' AFTER `bottom_top_link_color`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN bottom_b_link_color varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '底部版权下方颜色' AFTER `bottom_b_link`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN bottom_bg_color varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '底部版权背景颜色' AFTER `bottom_b_link_color`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN course_free_receive tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程免费领取逻辑 1直接可以观看 0需点击免费领取' AFTER `bottom_bg_color`;
ALTER TABLE ims_yzd_kp_users_integral ADD COLUMN content longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '后台备注' AFTER `type`;

ALTER TABLE ims_yzd_kp_article ADD COLUMN poster_type tinyint(1) NOT NULL DEFAULT 1 COMMENT '1跟随系统 2自定义' AFTER `relation_enroll_arr`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN poster longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '海报数据' AFTER `poster_type`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN article_jf_state_type tinyint(1) NOT NULL DEFAULT 1 COMMENT '1跟随系统 2自定义' AFTER `poster`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN article_jf_state tinyint(1) NOT NULL DEFAULT 0 COMMENT '文章积分 0关闭 1开启' AFTER `article_jf_state_type`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN article_jf_type tinyint(1) NOT NULL DEFAULT 1 COMMENT '文章积分类型1进度 2时间' AFTER `article_jf_state`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN article_jf_count tinyint(1) NOT NULL DEFAULT 1 COMMENT '文章积分获得次数' AFTER `article_jf_type`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN article_jf_number tinyint(1) NOT NULL DEFAULT 10 COMMENT '获得积分数量' AFTER `article_jf_count`;
ALTER TABLE ims_yzd_kp_article ADD COLUMN article_jf_data int(11) NOT NULL DEFAULT 50 COMMENT '进度或时间' AFTER `article_jf_number`;
ALTER TABLE ims_yzd_kp_core_power ADD COLUMN status int(11) NOT NULL DEFAULT 1 COMMENT '1正常 2禁用' AFTER `file_size`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN header_search_show tinyint(1) NOT NULL DEFAULT 1 COMMENT '顶部搜索框 1显示 0隐藏' AFTER `code`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN header_study_show tinyint(1) NOT NULL DEFAULT 1 COMMENT '顶部我的学习 1显示 0隐藏' AFTER `header_search_show`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN header_login_show tinyint(1) NOT NULL DEFAULT 1 COMMENT '顶部登录按钮 1显示 0隐藏' AFTER `header_study_show`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN hover_menu longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像悬浮菜单' AFTER `header_login_show`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN user_menu longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个人中心菜单' AFTER `hover_menu`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN article_comment_examine tinyint(1) NOT NULL DEFAULT 0 COMMENT '文章评论审核 0不需要审核 1需要审核' AFTER `course_free_receive`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN article_comment tinyint(1) NOT NULL DEFAULT 1 COMMENT '文章评论0关闭 1开启' AFTER `article_comment_examine`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN article_jf_state tinyint(1) NOT NULL DEFAULT 0 COMMENT '文章积分 0关闭 1开启' AFTER `article_comment`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN article_jf_type tinyint(1) NOT NULL DEFAULT 1 COMMENT '文章积分类型1进度 2时间' AFTER `article_jf_state`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN article_jf_data int(11) NOT NULL DEFAULT 50 COMMENT '进度或时间' AFTER `article_jf_type`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN article_jf_count int(11) NOT NULL DEFAULT 1 COMMENT '文章积分获得次数' AFTER `article_jf_data`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN article_jf_number int(11) NOT NULL DEFAULT 10 COMMENT '获得积分数量' AFTER `article_jf_count`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN course_menu_style tinyint(1) NOT NULL DEFAULT 0 COMMENT '已播放目录标题颜色 0默认 1自定义' AFTER `article_jf_number`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN course_menu_color varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#121212' AFTER `course_menu_style`;

ALTER TABLE ims_yzd_kp_course ADD COLUMN live_zan_num int(11) NOT NULL DEFAULT 0 COMMENT '直播赞数' AFTER `sort_type`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN live_gift tinyint(1) NOT NULL DEFAULT 0 COMMENT '礼物打赏 1开启 0关闭' AFTER `live_zan_num`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN live_shop tinyint(1) NOT NULL DEFAULT 0 COMMENT '直播带货  1开启 0关闭' AFTER `live_gift`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN live_zan tinyint(1) NOT NULL DEFAULT 0 COMMENT '直播点赞  1开启 0关闭' AFTER `live_shop`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN live_muted tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁言 0不禁言 1禁言' AFTER `live_zan`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN live_people int(11) NOT NULL DEFAULT 0 COMMENT '直播虚拟人数' AFTER `live_muted`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN live_relation_course_arr longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '直播带货关联课程' AFTER `live_people`;
ALTER TABLE ims_yzd_kp_course_live_chat MODIFY COLUMN type int(11) NOT NULL COMMENT '1文字 2图片 3语音 4礼物' AFTER `user`;
ALTER TABLE ims_yzd_kp_course_term MODIFY COLUMN buy_type int(11) NOT NULL DEFAULT 1 COMMENT '1购买 2兑换码 3助力 4购买商品赠送 5积分商城赠送 6后台' AFTER `course_type`;
ALTER TABLE ims_yzd_kp_exchange_data ADD COLUMN time2 varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人人商城售卖时间' AFTER `time`;
ALTER TABLE ims_yzd_kp_exchange_data ADD COLUMN order_code longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '人人商城订单编号' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_exchange_data MODIFY COLUMN state int(2) NOT NULL DEFAULT 0 COMMENT '0未兑换 1已兑换 2已作废 3已出售待兑换' AFTER `time2`;
ALTER TABLE ims_yzd_kp_live_set ADD COLUMN forbidden_words longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '违禁词' AFTER `live_auth`;
ALTER TABLE ims_yzd_kp_live_set ADD COLUMN gift longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '礼物' AFTER `forbidden_words`;
ALTER TABLE ims_yzd_kp_live_set ADD COLUMN auto_playback tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动回放 0关闭 1开启' AFTER `gift`;
ALTER TABLE ims_yzd_kp_live_set ADD COLUMN domain_url longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回放存储域名' AFTER `auto_playback`;
ALTER TABLE ims_yzd_kp_storage_list ADD COLUMN c_id int(11) NULL DEFAULT NULL COMMENT '其他ID' AFTER `state`;
ALTER TABLE ims_yzd_kp_storage_list MODIFY COLUMN size int(11) NOT NULL COMMENT '大小 单位B 字节' AFTER `title`;
ALTER TABLE ims_yzd_kp_storage_list MODIFY COLUMN oss_type int(11) NOT NULL COMMENT 'oss类型1本地 2阿里云 3七牛云 4腾讯云 6腾讯云点播 7又拍云 -1链接导入 -2直播回放' AFTER `uid`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN rrsc_api_key longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '人人商城api_key' AFTER `course_menu_color`;

ALTER TABLE ims_yzd_kp_course ADD COLUMN live_socket_state tinyint(1) NOT NULL DEFAULT 0 COMMENT 'PC直播端 0不在线 1在线' AFTER `live_relation_course_arr`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN live_socket_fd varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PC直播端 fn id' AFTER `live_socket_state`;
ALTER TABLE ims_yzd_kp_course_live_chat ADD COLUMN role tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色1用户 2讲师' AFTER `size`;
ALTER TABLE ims_yzd_kp_live_set ADD COLUMN live_type tinyint(1) NOT NULL DEFAULT 1 COMMENT '1标准直播 2快直播' AFTER `domain_url`;

ALTER TABLE ims_yzd_kp_article MODIFY COLUMN article_jf_count int(11) NOT NULL DEFAULT 1 COMMENT '文章积分获得次数' AFTER `article_jf_type`;
ALTER TABLE ims_yzd_kp_article MODIFY COLUMN article_jf_number int(11) NOT NULL DEFAULT 10 COMMENT '获得积分数量' AFTER `article_jf_count`;
ALTER TABLE ims_yzd_kp_distribute MODIFY COLUMN type tinyint(1) NULL DEFAULT NULL COMMENT '0申请 1后台添加 2没申请 3课程 4商品' AFTER `state`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN rank_state tinyint(1) NOT NULL DEFAULT 0 COMMENT '分销排行状态 0关闭 1开启' AFTER `one_order`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN rank_type int(11) NOT NULL COMMENT '1累积佣金 2已发放佣金' AFTER `rank_state`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN rank_name varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '佣金排行榜' COMMENT '佣金排行名称 ' AFTER `rank_type`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN rank_num int(11) NOT NULL DEFAULT 10 COMMENT '排行显示数量' AFTER `rank_name`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN rank_img longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '排行背景图' AFTER `rank_num`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN dis_commission_show tinyint(1) NOT NULL DEFAULT 0 COMMENT '分销价格显示 0隐藏 1显示' AFTER `rank_img`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN dis_commission_show_name varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '分销最高可得' COMMENT '分销最高可得' AFTER `dis_commission_show`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN good longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `dis_commission_show_name`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN course longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `good`;
ALTER TABLE ims_yzd_kp_punchcard ADD COLUMN jf_state tinyint(1) NOT NULL DEFAULT 0 COMMENT '积分 0关闭 1开启' AFTER `default_sales`;
ALTER TABLE ims_yzd_kp_punchcard ADD COLUMN jf_count int(11) NOT NULL DEFAULT 1 COMMENT '积分获得次数' AFTER `jf_state`;
ALTER TABLE ims_yzd_kp_punchcard ADD COLUMN jf_number int(11) NOT NULL DEFAULT 10 COMMENT '获得积分数量' AFTER `jf_count`;

ALTER TABLE ims_yzd_kp_forum_set ADD COLUMN submit_condition int(11) NOT NULL DEFAULT 1 COMMENT '1所有人 2会员 3超级会员' AFTER `is_video`;

ALTER TABLE ims_yzd_kp_bdapp_config ADD COLUMN `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭' AFTER `app_public_key`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN top_logo longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `login_left_img`;
ALTER TABLE ims_yzd_kp_h5_config ADD COLUMN `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭' AFTER `alipay_id`;
ALTER TABLE ims_yzd_kp_ksapp_config ADD COLUMN `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN header_search_type int(11) NOT NULL DEFAULT 1 COMMENT '顶部搜索框搜索类型 1课程 2文章 3试卷 4活动 5资料' AFTER `user_menu`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN dhm_log_show tinyint(1) NOT NULL DEFAULT 1 COMMENT '兑换记录 1显示 0隐藏' AFTER `rrsc_api_key`;
ALTER TABLE ims_yzd_kp_tmplmsg_set ADD COLUMN is_shzttx tinyint(1) NOT NULL DEFAULT 0 AFTER `sjtjtx_id`;
ALTER TABLE ims_yzd_kp_tmplmsg_set ADD COLUMN shzttx_id longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `is_shzttx`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭' AFTER `salt`;
ALTER TABLE ims_yzd_kp_wxapp_config ADD COLUMN `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭' AFTER `token`;
ALTER TABLE ims_yzd_kp_wxh5_config ADD COLUMN `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 0关闭' AFTER `alipay_id`;

ALTER TABLE ims_yzd_kp_site_set ADD COLUMN `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仅此域名可以打开 官网' AFTER `id`;

ALTER TABLE ims_yzd_kp_course_info ADD COLUMN `menu_id` int(11) NOT NULL DEFAULT 0 COMMENT '目录ID' AFTER `try_time`;
ALTER TABLE ims_yzd_kp_good ADD COLUMN `poster_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1跟随系统 2自定义' AFTER `course_arr`;
ALTER TABLE ims_yzd_kp_good ADD COLUMN `poster` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '海报数据' AFTER `poster_type`;
ALTER TABLE ims_yzd_kp_ksapp_config ADD COLUMN `pay_type` int(11) NOT NULL DEFAULT 1297 COMMENT '支付 服务类目' AFTER `show`;
ALTER TABLE ims_yzd_kp_site_set ADD COLUMN `hover_right_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '右下悬浮开关 1显示 0隐藏' AFTER `index_solution_img3`;

ALTER TABLE ims_yzd_kp_bdapp_config ADD COLUMN `token` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '登录密钥' AFTER `show`;
ALTER TABLE ims_yzd_kp_ksapp_config ADD COLUMN `upload_private_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上传密钥' AFTER `pay_type`;
ALTER TABLE ims_yzd_kp_wxapp_config ADD COLUMN `upload_private_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上传密钥' AFTER `show`;

ALTER TABLE ims_yzd_kp_annex ADD COLUMN `list_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '列表展示 1展示 0隐藏' AFTER `vip_free_see`;
ALTER TABLE ims_yzd_kp_bdapp_config ADD COLUMN `ios_pay_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS支付 1跟随全局 2自定义' AFTER `token`;
ALTER TABLE ims_yzd_kp_bdapp_config ADD COLUMN `is_ios_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS端支付 0关闭支付 1开启支付' AFTER `ios_pay_type`;
ALTER TABLE ims_yzd_kp_bdapp_config ADD COLUMN `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '由于相关规范，ios功能暂不可用' COMMENT 'IOS无法支付文案' AFTER `is_ios_pay`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `list_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '列表展示 1展示 0隐藏' AFTER `live_socket_fd`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN `svip` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `course`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN `vip` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `svip`;
ALTER TABLE ims_yzd_kp_form ADD COLUMN `count` int(11) NOT NULL DEFAULT 1 COMMENT '每人最多提交次数 仅DIY表单生效' AFTER `content`;
ALTER TABLE ims_yzd_kp_form ADD COLUMN `count_type` int(11) NOT NULL DEFAULT 1 COMMENT '是否限制 1无限制 2次数 仅DIY表单生效' AFTER `count`;
ALTER TABLE ims_yzd_kp_form MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单 9商品表单 10会员下单表单' AFTER `title`;
ALTER TABLE ims_yzd_kp_form_data ADD COLUMN `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'vip || svip' AFTER `form_data`;
ALTER TABLE ims_yzd_kp_form_data MODIFY COLUMN `type` int(11) NOT NULL DEFAULT 1 COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单 9商品表单 10会员下单表单' AFTER `id`;
ALTER TABLE ims_yzd_kp_h5_config ADD COLUMN `ios_pay_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS支付 1跟随全局 2自定义' AFTER `show`;
ALTER TABLE ims_yzd_kp_h5_config ADD COLUMN `is_ios_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS端支付 0关闭支付 1开启支付' AFTER `ios_pay_type`;
ALTER TABLE ims_yzd_kp_h5_config ADD COLUMN `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '由于相关规范，ios功能暂不可用' COMMENT 'IOS无法支付文案' AFTER `is_ios_pay`;
ALTER TABLE ims_yzd_kp_ksapp_config ADD COLUMN `ios_pay_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS支付 1跟随全局 2自定义' AFTER `upload_private_key`;
ALTER TABLE ims_yzd_kp_ksapp_config ADD COLUMN `is_ios_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS端支付 0关闭支付 1开启支付' AFTER `ios_pay_type`;
ALTER TABLE ims_yzd_kp_ksapp_config ADD COLUMN `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '由于相关规范，ios功能暂不可用' COMMENT 'IOS无法支付文案' AFTER `is_ios_pay`;
ALTER TABLE ims_yzd_kp_paper ADD COLUMN `list_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '列表展示 1展示 0隐藏' AFTER `vip_free_see`;
ALTER TABLE ims_yzd_kp_svip_card ADD COLUMN `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '会员表单ID' AFTER `state`;
ALTER TABLE ims_yzd_kp_svip_order ADD COLUMN `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有' AFTER `ks_settle_no`;
ALTER TABLE ims_yzd_kp_svip_order ADD COLUMN `form_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表单数据' AFTER `is_form`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `ios_pay_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS支付 1跟随全局 2自定义' AFTER `show`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `is_ios_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS端支付 0关闭支付 1开启支付' AFTER `ios_pay_type`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '由于相关规范，ios功能暂不可用' COMMENT 'IOS无法支付文案' AFTER `is_ios_pay`;
ALTER TABLE ims_yzd_kp_vip_order ADD COLUMN `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有' AFTER `ks_settle_no`;
ALTER TABLE ims_yzd_kp_vip_order ADD COLUMN `form_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表单数据' AFTER `is_form`;
ALTER TABLE ims_yzd_kp_vip_set ADD COLUMN `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '会员表单ID' AFTER `good_buy_title`;
ALTER TABLE ims_yzd_kp_wxapp_config ADD COLUMN `ios_pay_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS支付 1跟随全局 2自定义' AFTER `upload_private_key`;
ALTER TABLE ims_yzd_kp_wxapp_config ADD COLUMN `is_ios_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS端支付 0关闭支付 1开启支付' AFTER `ios_pay_type`;
ALTER TABLE ims_yzd_kp_wxapp_config ADD COLUMN `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '由于相关规范，ios功能暂不可用' COMMENT 'IOS无法支付文案' AFTER `is_ios_pay`;
ALTER TABLE ims_yzd_kp_wxh5_config ADD COLUMN `ios_pay_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS支付 1跟随全局 2自定义' AFTER `show`;
ALTER TABLE ims_yzd_kp_wxh5_config ADD COLUMN `is_ios_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'IOS端支付 0关闭支付 1开启支付' AFTER `ios_pay_type`;
ALTER TABLE ims_yzd_kp_wxh5_config ADD COLUMN `ios_pay_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '由于相关规范，ios功能暂不可用' COMMENT 'IOS无法支付文案' AFTER `is_ios_pay`;


ALTER TABLE ims_yzd_kp_course ADD COLUMN `first_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音小程序 一级分类' AFTER `list_show`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `second_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音小程序二级分类' AFTER `first_class`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `tt_res_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '抖音添加课程接口返回信息' AFTER `second_class`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `tt_product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音课程唯一ID' AFTER `tt_res_json`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `tt_audit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音课程审核ID' AFTER `tt_product_id`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `tt_callback_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '抖音审核回调' AFTER `tt_audit_id`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `tt_produce_status` int(11) NOT NULL DEFAULT -1 COMMENT '状态 -1未生效 1已生效' AFTER `tt_callback_json`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `tt_state` int(11) NOT NULL DEFAULT 1 COMMENT '1未提交审核 2审核中 3审核通过 4审核失败' AFTER `tt_produce_status`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `tt_is_sh` int(11) NOT NULL DEFAULT 0 COMMENT '是否已过审过 0没有 1有' AFTER `tt_state`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `update_state` int(11) NOT NULL DEFAULT 2 COMMENT '更新状态 1更新中 2已完结' AFTER `tt_is_sh`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `live_people_dia` tinyint(1) NOT NULL DEFAULT 1 COMMENT '直播 在线人数列表展示 0关闭 1展示' AFTER `update_state`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `tt_anchor_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音视频挂载锚点文案' AFTER `live_people_dia`;
ALTER TABLE ims_yzd_kp_course_info ADD COLUMN `is_content` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示单节详情 0隐藏 1显示' AFTER `menu_id`;
ALTER TABLE ims_yzd_kp_course_info ADD COLUMN `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情' AFTER `is_content`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `dy_settle` tinyint(1) NOT NULL DEFAULT 0 COMMENT '抖音是否分账 0未分账 1已分账' AFTER `payData`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `dy_settle_out_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音外部分账单' AFTER `dy_settle`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `dy_settle_time1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音可以分账的时间' AFTER `tt_settle_no`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `dy_settle_time2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音实际分账的时间' AFTER `dy_settle_time1`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `dy_trade` int(11) NOT NULL DEFAULT 0 COMMENT '2 抖音交易系统2.0' AFTER `ks_settle_no`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `dy_create_order_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '抖音交易系统 预下单回调' AFTER `dy_trade`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `dy_item_order_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `dy_create_order_json`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `dy_refund_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `dy_item_order_id`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `dy_delivery_state` int(11) NOT NULL DEFAULT 0 COMMENT '抖音核销状态 0未使用 1已核销' AFTER `dy_refund_json`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `phone_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号' AFTER `dy_delivery_state`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `dy_order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音订单ID' AFTER `phone_num`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音核销时间' AFTER `dy_order_id`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `object_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '资质类型选择：1-老师，2-机构' AFTER `update_time`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `true_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师真实姓名' AFTER `object_type`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `first_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仅老师 一级讲师分类' AFTER `true_name`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `second_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仅老师 二级讲师分类' AFTER `first_class`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `third_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仅老师 三级讲师分类 暂为0' AFTER `second_class`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `ID_number` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '老师要求输入合法的中国大陆身份证号码' AFTER `third_class`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `ID_img_uris` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '老师身份证图片uri列表，需要调用上传资源接口后获得uri，要求必须上传正反面身份证图片，数量为2' AFTER `ID_number`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '老师介绍 字符长度限制\r\n\r\n1 <= len <=2000（汉字占2字符） 	\r\n机构介绍，\r\n\r\n字符长度限制12<=len<= 200(汉字占 2 字符)' AFTER `ID_img_uris`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `qualification_info_lst` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '资质信息列表' AFTER `introduction`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `institution_scene_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '线上机构' COMMENT '机构场景类型（仅可填写\"线上机构\"或\"线下机构\"）' AFTER `qualification_info_lst`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `institution_subject_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '企业工商户' COMMENT '机构主体类型（仅可填写\"企业工商户\"或\"个体工商户\"）' AFTER `institution_scene_type`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `tt_res_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '添加资质接口返回信息' AFTER `institution_subject_type`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `tt_object_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `tt_res_json`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `tt_audit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `tt_object_id`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `tt_produce_status` int(11) NULL DEFAULT NULL COMMENT '状态 -1未生效 1已生效' AFTER `tt_audit_id`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `tt_callback_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `tt_produce_status`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `company_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '企业名称' AFTER `tt_callback_json`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `institution_introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '机构介绍' AFTER `company_name`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `legal_person_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构法人姓名' AFTER `institution_introduction`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `legal_person_ID_number` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '机构法人身份证号码，要求输入合法的中国大陆身份证号码' AFTER `legal_person_name`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `legal_person_ID_img_uris` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '机构法人身份证图片uri列表，需要调用上传后获得，要求必须上传正反面身份证图片，数量为2' AFTER `legal_person_ID_number`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `tt_state` int(11) NOT NULL DEFAULT 1 COMMENT '1未提交审核 2审核中 3审核通过 4审核失败' AFTER `legal_person_ID_img_uris`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `tt_is_sh` int(11) NOT NULL DEFAULT 0 COMMENT '是否已过审过资质 0没有 1有' AFTER `tt_state`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN `site_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '站点' AFTER `dhm_log_show`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN `buy_course_notice` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '购课须知' AFTER `site_url`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `is_video` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启视频挂载权限 0关闭 1开启' AFTER `ios_pay_title`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `video_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '视频挂载图标' AFTER `is_video`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `app_private_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `video_img`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `app_public_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `app_private_key`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `douyin_private_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `app_public_key`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `douyin_public_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `douyin_private_key`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `douyin_course` int(11) NOT NULL DEFAULT 0 COMMENT '是否接入课程库0未接入 1已接入' AFTER `douyin_public_key`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `course_callback` tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程库回调 0未设置 1已设置' AFTER `douyin_course`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `create_order_callback` tinyint(1) NOT NULL DEFAULT 0 COMMENT '预下单回调  0未设置 1已设置' AFTER `course_callback`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `refund_callback` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款回调  0未设置 1已设置' AFTER `create_order_callback`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `jiesuan_day` int(11) NOT NULL DEFAULT 7 COMMENT '结算天数' AFTER `refund_callback`;
ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `key_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '公钥版本' AFTER `jiesuan_day`;

ALTER TABLE ims_yzd_kp_annex ADD COLUMN `url_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1直接打开 2复制链接' AFTER `url`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `domain` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '域名' AFTER `top_logo`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `two_menu_expand` tinyint(1) NOT NULL DEFAULT 0 COMMENT '二级目录全部展开 0关闭 1开启' AFTER `tt_anchor_title`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `zhuanzhang_type` int(11) NOT NULL DEFAULT 1 COMMENT '1企业付款到零钱 2商家转账到零钱' AFTER `uniacid`;

ALTER TABLE ims_yzd_kp_sys ADD COLUMN `daily_llz_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '每日金句流量主状态 0关闭 1开启' AFTER `buy_course_notice`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN `daily_llz_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '流量主类型 1banner广告 2视频广告' AFTER `daily_llz_state`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN `daily_llz_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流量主广告位ID' AFTER `daily_llz_type`;

ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '驳回原因' AFTER `deviceType`;

ALTER TABLE ims_yzd_kp_annex_order ADD COLUMN `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销' AFTER `ks_settle_no`;
ALTER TABLE ims_yzd_kp_annex_order ADD COLUMN `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间' AFTER `dy_delivery_state`;
ALTER TABLE ims_yzd_kp_enroll_order ADD COLUMN `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销' AFTER `ks_settle_no`;
ALTER TABLE ims_yzd_kp_enroll_order ADD COLUMN `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间' AFTER `dy_delivery_state`;
ALTER TABLE ims_yzd_kp_good_order ADD COLUMN `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销' AFTER `is_form`;
ALTER TABLE ims_yzd_kp_good_order ADD COLUMN `dy_delivery_time` varbinary(255) NULL DEFAULT NULL COMMENT '核销时间' AFTER `dy_delivery_state`;
ALTER TABLE ims_yzd_kp_integral_mall_order ADD COLUMN `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销' AFTER `json_data`;
ALTER TABLE ims_yzd_kp_integral_mall_order ADD COLUMN `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间' AFTER `dy_delivery_state`;
ALTER TABLE ims_yzd_kp_paper_order ADD COLUMN `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销' AFTER `ks_settle_no`;
ALTER TABLE ims_yzd_kp_paper_order ADD COLUMN `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间' AFTER `dy_delivery_state`;
ALTER TABLE ims_yzd_kp_punchcard_order ADD COLUMN `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销' AFTER `ks_settle_no`;
ALTER TABLE ims_yzd_kp_punchcard_order ADD COLUMN `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间' AFTER `dy_delivery_state`;
ALTER TABLE ims_yzd_kp_svip_order ADD COLUMN `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销' AFTER `form_data`;
ALTER TABLE ims_yzd_kp_svip_order ADD COLUMN `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间' AFTER `dy_delivery_state`;
ALTER TABLE ims_yzd_kp_vip_order ADD COLUMN `dy_delivery_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分账核销状态 0未使用 1已核销' AFTER `form_data`;
ALTER TABLE ims_yzd_kp_vip_order ADD COLUMN `dy_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销时间' AFTER `dy_delivery_state`;

ALTER TABLE ims_yzd_kp_message ADD COLUMN `is_groupbuy` tinyint(1) NOT NULL DEFAULT 0 AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN `groupbuy_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `is_groupbuy`;
ALTER TABLE ims_yzd_kp_tmplmsg_set ADD COLUMN `is_groupbuy` tinyint(1) NOT NULL DEFAULT 0 AFTER `shzttx_id`;
ALTER TABLE ims_yzd_kp_tmplmsg_set ADD COLUMN `groupbuy_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `is_groupbuy`;

ALTER TABLE ims_yzd_kp_punchcard ADD COLUMN `day_max_count` int(11) NOT NULL DEFAULT -1 COMMENT '每日最大打卡次数 -1为不限制' AFTER `jf_number`;

ALTER TABLE ims_yzd_kp_paper ADD COLUMN `is_view_log` tinyint(1) NOT NULL DEFAULT 1 COMMENT '试卷详情页是否可以看到 查看道题记录按钮 0隐藏 1显示' AFTER `list_show`;

ALTER TABLE ims_yzd_kp_form MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单 9商品表单 10会员下单表单 11拼团下单表单' AFTER `title`;
ALTER TABLE ims_yzd_kp_form_data MODIFY COLUMN `type` int(11) NOT NULL DEFAULT 1 COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单 9商品表单 10会员下单表单 11拼团下单表单' AFTER `id`;
ALTER TABLE ims_yzd_kp_groupbuy_list ADD COLUMN `form_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联表单的ID' AFTER `content`;
ALTER TABLE ims_yzd_kp_groupbuy_order ADD COLUMN `is_form` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有表单 0没有 1有' AFTER `json_data`;
ALTER TABLE ims_yzd_kp_storage ADD COLUMN `storage_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '存储类型 1音视频 2图片、资料' AFTER `youpaiyun`;
ALTER TABLE ims_yzd_kp_storage MODIFY COLUMN `type` int(11) NOT NULL DEFAULT 0 COMMENT '1本地存储 2阿里云OSS 3七牛云存储 4腾讯云COS 5阿里云点播 6腾讯云点播 0跟随音视频存储设置' AFTER `id`;
ALTER TABLE ims_yzd_kp_users_annex ADD COLUMN `course_id` int(11) NOT NULL DEFAULT 0 COMMENT '通过哪个课程领取的' AFTER `buy_type`;
ALTER TABLE ims_yzd_kp_users_paper ADD COLUMN `course_id` int(11) NOT NULL DEFAULT 0 COMMENT '通过哪个课程领取的' AFTER `buy_type`;

ALTER TABLE ims_yzd_kp_contact ADD COLUMN `dy_data_im_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抖音客服ID' AFTER `wx_url`;

ALTER TABLE ims_yzd_kp_distribute ADD COLUMN `zfb_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '支付宝二维码' AFTER `form_data`;
ALTER TABLE ims_yzd_kp_distribute ADD COLUMN `wx_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信二维码' AFTER `zfb_ewm`;
ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `zfb_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `reason`;
ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `wx_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `zfb_ewm`;

ALTER TABLE ims_yzd_kp_core_power ADD COLUMN `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注' AFTER `status`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `live_full_screen_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '直播全屏类型 1全屏铺满 2平铺' AFTER `two_menu_expand`;

ALTER TABLE ims_yzd_kp_ttapp_config ADD COLUMN `operation_mode` tinyint(1) NOT NULL DEFAULT 0 COMMENT '运营模式 0未设置 1自营模式 2服务商模式' AFTER `key_version`;

ALTER TABLE ims_yzd_kp_type MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1课程 2商品 3文章 4试卷 5活动 6资料 7打卡 8相册 9测评 10超级考试' AFTER `id`;

ALTER TABLE ims_yzd_kp_annex ADD COLUMN `mode` tinyint(1) NOT NULL DEFAULT 1 COMMENT '资料模式 1单资料模式 2多资料模式' AFTER `title`;
ALTER TABLE ims_yzd_kp_exchange_list MODIFY COLUMN `type` int(2) NOT NULL COMMENT '类型 1课程 2会员卡 3试卷 4资料 5超级会员卡 6超级试卷' AFTER `title`;
ALTER TABLE ims_yzd_kp_super_exam ADD COLUMN `vip_free_see` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭 1开启' AFTER `is_change_paper_question`;
ALTER TABLE ims_yzd_kp_users_super_exam MODIFY COLUMN `buy_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1购买 2兑换码 3会员免费看 4超级会员 6后台' AFTER `uniacid`;

ALTER TABLE ims_yzd_kp_storage ADD COLUMN hwobs longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `storage_type`;

ALTER TABLE ims_yzd_kp_annex MODIFY COLUMN `mode` tinyint(1) NOT NULL DEFAULT 1 COMMENT '资料模式 1单资料模式 2多资料模式' AFTER `title`;
ALTER TABLE ims_yzd_kp_enroll ADD COLUMN `is_sku` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是多规格 0单规格 1多规格' AFTER `line_price`;
ALTER TABLE ims_yzd_kp_enroll ADD COLUMN `sku_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'sku信息' AFTER `is_sku`;
ALTER TABLE ims_yzd_kp_enroll_order ADD COLUMN `sku_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `dy_delivery_time`;
ALTER TABLE ims_yzd_kp_enroll_order ADD COLUMN `sku_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `sku_id`;
ALTER TABLE ims_yzd_kp_forum_set ADD COLUMN `view_condition` int(11) NOT NULL DEFAULT 1 COMMENT '用户浏览权限1所有人 2会员 3超级会员' AFTER `submit_condition`;
ALTER TABLE ims_yzd_kp_storage ADD COLUMN `hwvod` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `hwobs`;

ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `is_help_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示帮助中心按钮 1是 0否' AFTER `domain`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `help_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '帮助中心链接' AFTER `is_help_show`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `is_rrsc_diy` tinyint(1) NOT NULL DEFAULT 0 AFTER `help_url`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `rrsc_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `is_rrsc_diy`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `rrsc_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `rrsc_title`;
ALTER TABLE ims_yzd_kp_forum_info ADD COLUMN `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 0不置顶 1置顶' AFTER `view_num`;

ALTER TABLE ims_yzd_kp_message ADD COLUMN `is_yhxdtz_free_send` tinyint(1) NOT NULL DEFAULT 1 COMMENT '免费订单是否提醒 0不提醒 1提醒' AFTER `is_yhxdtz`;
ALTER TABLE ims_yzd_kp_tmplmsg_set ADD COLUMN `is_yhxdcgtx_free_send` tinyint(1) NOT NULL DEFAULT 1 COMMENT '免费订单是否提醒 0不提醒 1提醒' AFTER `yhxdcgtx_id`;

ALTER TABLE ims_yzd_kp_integral_mall_good MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1实物 2虚拟 3课程 4试卷 5资料 6超级试卷' AFTER `title`;
ALTER TABLE ims_yzd_kp_super_exam MODIFY COLUMN `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1练习模式（做完立即显示答案） 2考试模式 3超级模式' AFTER `title`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN `course_list_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '课程列表样式 2一行一个（列表） 1一行两个 3一行一个（大图）' AFTER `course_type_style`;

ALTER TABLE ims_yzd_kp_contact ADD COLUMN `mp_ks_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快手客服ID' AFTER `dy_data_im_id`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `douyin_class_version` int(11) NOT NULL DEFAULT 1 AFTER `rrsc_desc`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN `dxk_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信客密码' AFTER `groupbuy_id`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN `dxk_spid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信客spid' AFTER `dxk_password`;
ALTER TABLE ims_yzd_kp_message MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1阿里云 2腾讯云 3短信客' AFTER `state`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN `course_true_prevent_recording` tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程防录屏 0关闭 1开启' AFTER `daily_llz_id`;
ALTER TABLE ims_yzd_kp_ttapp_class ADD COLUMN `special_qualification` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '特殊资质' AFTER `teacher_qualification_certificate`;
ALTER TABLE ims_yzd_kp_ttapp_class ADD COLUMN `is_upload_special_qualification` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否上传特殊资质 0不上传 1上传' AFTER `special_qualification`;
ALTER TABLE ims_yzd_kp_ttapp_entity_class_auth ADD COLUMN `special_qualifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '特殊协议' AFTER `cooperation_agreement_material_paths`;

ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `is_use_tag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否使用抖音新版履约退款 0不使用 1使用' AFTER `dy_delivery_time`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `delivery_ok_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可以核销的时间' AFTER `is_use_tag`;
ALTER TABLE ims_yzd_kp_course_order MODIFY COLUMN `dy_delivery_state` int(11) NOT NULL DEFAULT 0 COMMENT '核销状态 快手：0未核销 1已核销 抖音：0待履约 1履约中 2履约完成（仅is_use_tag为1生效）' AFTER `dy_refund_json`;

ALTER TABLE ims_yzd_kp_sys ADD COLUMN `mall_comment_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '商城评价 0隐藏 1显示' AFTER `course_true_prevent_recording`;
ALTER TABLE ims_yzd_kp_tmplmsg_set ADD COLUMN `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '模板通知类型1历史模板 2类目模板' AFTER `id`;

ALTER TABLE ims_yzd_kp_course ADD COLUMN `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密密码 0-8位数字或字母' AFTER `line_price`;
ALTER TABLE ims_yzd_kp_course MODIFY COLUMN `price_type` tinyint(1) NOT NULL COMMENT '价格类型 1免费 2付费 3密码兑换' AFTER `is_alone_sale`;
ALTER TABLE ims_yzd_kp_course_term ADD COLUMN `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入课程学习时间' AFTER `last_time`;
ALTER TABLE ims_yzd_kp_course_term MODIFY COLUMN `buy_type` int(11) NOT NULL DEFAULT 1 COMMENT '1购买 2兑换码 3助力 4购买商品赠送 5积分商城赠送 6后台 7幸运抽奖 8拼团 9密码兑换' AFTER `course_type`;
ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN `fxs_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '分銷商' AFTER `vip`;
ALTER TABLE ims_yzd_kp_forum_set ADD COLUMN `img_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1大图 2缩略图' AFTER `view_condition`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN `course_attribute_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '课程属性 0隐藏 1显示' AFTER `mall_comment_show`;

ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `ks_class_version` int(11) NOT NULL DEFAULT 1 AFTER `douyin_class_version`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `ewm_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1自动弹出 0不自动弹出' AFTER `ewm_title`;
ALTER TABLE ims_yzd_kp_distribute_set MODIFY COLUMN `rank_type` int(11) NOT NULL COMMENT '0累积佣金1已发放佣金' AFTER `rank_state`;
ALTER TABLE ims_yzd_kp_ksapp_config ADD COLUMN `kuaishou_course` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否接入课程库0未接入 1已接入' AFTER `ios_pay_title`;
ALTER TABLE ims_yzd_kp_ksapp_log MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1上传图片 2订单信息同步 3分账 4上传图片、视频、音频 5课程审核' AFTER `id`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN `is_default_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '静默登录 0关闭 1开启' AFTER `is_phone_platform`;
ALTER TABLE ims_yzd_kp_wxh5_config ADD COLUMN `wxh5_auth_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义授权接口' AFTER `ios_pay_title`;

ALTER TABLE ims_yzd_kp_core_permission ADD COLUMN `role_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1店员 2讲师' AFTER `update_time`;
ALTER TABLE ims_yzd_kp_core_user ADD COLUMN `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID' AFTER `name`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `platform_review_status` int(2) NOT NULL DEFAULT 2 COMMENT '平台审核状态 1审核中 2审核通过 3审核拒绝' AFTER `live_full_screen_type`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `reject_reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '拒绝原因' AFTER `platform_review_status`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `is_lecturer_mode` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否关联讲师钱包 0否 1是' AFTER `delivery_ok_time`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `lecturer_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '讲师钱包金额' AFTER `is_lecturer_mode`;
ALTER TABLE ims_yzd_kp_course_order ADD COLUMN `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID' AFTER `lecturer_money`;
ALTER TABLE ims_yzd_kp_course_remind ADD COLUMN `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '平台ID' AFTER `state`;
ALTER TABLE ims_yzd_kp_exchange_list ADD COLUMN `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_form ADD COLUMN `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID' AFTER `count_type`;
ALTER TABLE ims_yzd_kp_forum_info MODIFY COLUMN `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文字' AFTER `time`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `take_proportion_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '抽成比例 1跟随全局 2自定义' AFTER `tt_is_sh`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `take_proportion` decimal(10, 2) NOT NULL DEFAULT 10.00 COMMENT '自定义的抽成比例' AFTER `take_proportion_type`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `audit_status` int(2) NOT NULL DEFAULT 1 COMMENT '审核状态0审核中 1审核通过 2审核驳回' AFTER `take_proportion`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `refuse_reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '驳回原因' AFTER `audit_status`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联用户ID' AFTER `refuse_reason`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `alipay_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝姓名' AFTER `user_id`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `alipay_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝账号' AFTER `alipay_name`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `alipay_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '支付宝收款码图片' AFTER `alipay_account`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `wechat_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信姓名' AFTER `alipay_ewm`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `wechat_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信账号' AFTER `wechat_name`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `wechat_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信收款二维码' AFTER `wechat_account`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `bank_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡账号' AFTER `wechat_ewm`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `bank_people_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '持卡人名称' AFTER `bank_account`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `bank_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '开户行名称' AFTER `bank_people_name`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `login_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号' AFTER `bank_name`;
ALTER TABLE ims_yzd_kp_lecturer ADD COLUMN `login_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码' AFTER `login_account`;
ALTER TABLE ims_yzd_kp_lecturer MODIFY COLUMN `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间' AFTER `sex`;
ALTER TABLE ims_yzd_kp_lecturer MODIFY COLUMN `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间' AFTER `add_time`;
ALTER TABLE ims_yzd_kp_storage_group ADD COLUMN `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID' AFTER `update_time`;
ALTER TABLE ims_yzd_kp_storage_list ADD COLUMN `lecturer_id` int(11) NOT NULL DEFAULT 0 COMMENT '讲师ID' AFTER `size2`;

ALTER TABLE ims_yzd_kp_sys ADD COLUMN `layout_style` tinyint(1) NOT NULL DEFAULT 2 COMMENT '后台样式 1老版本 2新版本' AFTER `course_attribute_show`;

ALTER TABLE ims_yzd_kp_annex ADD COLUMN `is_send_me` tinyint(1) NOT NULL DEFAULT 0 COMMENT '发送给自己 1支持 0不支持' AFTER `list_show`;
ALTER TABLE ims_yzd_kp_enroll ADD COLUMN `is_param` tinyint(1) NOT NULL DEFAULT 0 COMMENT '多参数 0关闭 1开启' AFTER `update_time`;
ALTER TABLE ims_yzd_kp_enroll ADD COLUMN `param_list` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `is_param`;

ALTER TABLE ims_yzd_kp_course_term ADD COLUMN `staff_id` int(11) NOT NULL COMMENT '添加店员ID' AFTER `add_time`;

ALTER TABLE ims_yzd_kp_core_power ADD COLUMN `is_log` tinyint(1) NOT NULL DEFAULT 1 COMMENT '操作日志 0关闭 1开启' AFTER `note`;
ALTER TABLE ims_yzd_kp_core_power ADD COLUMN `log_delete_time_day` int(11) NOT NULL DEFAULT 7 COMMENT '日志保留时间' AFTER `is_log`;
ALTER TABLE ims_yzd_kp_course ADD COLUMN `is_order_study` tinyint(1) NOT NULL DEFAULT 0 COMMENT '按顺序学习 0关闭 1开启' AFTER `reject_reason`;
ALTER TABLE ims_yzd_kp_diy ADD COLUMN `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注' AFTER `ad`;
ALTER TABLE ims_yzd_kp_diy ADD COLUMN `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 0否 1是' AFTER `note`;
ALTER TABLE ims_yzd_kp_diy ADD COLUMN `delete_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时间' AFTER `is_delete`;

ALTER TABLE ims_yzd_kp_paper ADD COLUMN `is_jump_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '练习模式答对跳转 1答对自动跳转下一题 2答对停留在此题目并显示答案及解析' AFTER `is_suspend`;
ALTER TABLE ims_yzd_kp_super_exam ADD COLUMN `is_jump_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '练习模式答对跳转 1答对自动跳转下一题 2答对停留在此题目并显示答案及解析' AFTER `is_suspend`;


ALTER TABLE ims_yzd_kp_core_power ADD COLUMN `last_show_ad_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次该店铺显示广告弹窗时间' AFTER `log_delete_time_day`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `ad_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '广告弹窗内容' AFTER `ks_class_version`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `ad_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '广告弹窗状态 0关闭 1开启' AFTER `ad_content`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `ad_time_type` int(2) NOT NULL DEFAULT 1 COMMENT '1仅显示一次 2每隔多少天弹一次 3每次都显示' AFTER `ad_status`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `ad_time_day` int(4) NOT NULL DEFAULT 1 COMMENT '每隔几天弹一次' AFTER `ad_time_type`;


ALTER TABLE ims_yzd_kp_core_power ADD COLUMN `is_support_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '技术支持显示类型 1跟随全局 2自定义' AFTER `last_show_ad_time`;
ALTER TABLE ims_yzd_kp_core_power ADD COLUMN `support_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '技术支持' AFTER `is_support_type`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `support_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '技术支持' AFTER `ad_time_day`;
ALTER TABLE ims_yzd_kp_course_live_chat MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1文字 2图片 3语音 4礼物 5带货' AFTER `user`;
ALTER TABLE ims_yzd_kp_course_live_chat MODIFY COLUMN `role` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色1用户 2讲师 3中控台 4机器人' AFTER `size`;
ALTER TABLE ims_yzd_kp_course_live_user ADD COLUMN `lahei_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '拉黑状态 0正常 1拉黑' AFTER `state`;
ALTER TABLE ims_yzd_kp_course_live_user ADD COLUMN `current_in_live_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '当场直播进入时间' AFTER `update_time`;
ALTER TABLE ims_yzd_kp_course_live_user ADD COLUMN `current_out_live_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '当场直播结束时间' AFTER `current_in_live_time`;
ALTER TABLE ims_yzd_kp_course_live_user ADD COLUMN `study_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '学习时长 秒' AFTER `current_out_live_time`;
ALTER TABLE ims_yzd_kp_course_live_user ADD COLUMN `zan_num` int(11) NOT NULL DEFAULT 0 COMMENT '该用户在本直播间的点赞次数' AFTER `study_time`;
ALTER TABLE ims_yzd_kp_course_live_user ADD COLUMN `uniacid` int(11) NOT NULL AFTER `zan_num`;
ALTER TABLE ims_yzd_kp_course_live_user ADD COLUMN `view_count` int(11) NOT NULL DEFAULT 0 COMMENT '进过几次直播间' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_course_live_user MODIFY COLUMN `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁言状态0正常 1禁言' AFTER `user_id`;

ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `customer_service_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客服名称' AFTER `support_text`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `customer_service_ewm` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '客服二维码' AFTER `customer_service_title`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `customer_service_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '客服头像' AFTER `customer_service_ewm`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `customer_service_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客服手机号' AFTER `customer_service_img`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `customer_service_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '客服0不显示1显示' AFTER `customer_service_phone`;

ALTER TABLE ims_yzd_kp_coupon ADD COLUMN `is_coupon_center` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否在领券中心显示 0否 1是' AFTER `state`;
ALTER TABLE ims_yzd_kp_coupon MODIFY COLUMN `use_type` tinyint(1) NOT NULL COMMENT '1课程 2试卷 3资料 4商品 5当面付' AFTER `type`;
ALTER TABLE ims_yzd_kp_coupon_user MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1领券中心领取 2后台发券' AFTER `coupon_data`;
ALTER TABLE ims_yzd_kp_coupon_user MODIFY COLUMN `use_type` int(11) NOT NULL COMMENT '1课程 2试卷 3资料 4商品 5当面付' AFTER `coupon_type`;
ALTER TABLE ims_yzd_kp_course_live_info ADD COLUMN `is_fake_live` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0真直播 1假直播' AFTER `notice_content`;
ALTER TABLE ims_yzd_kp_course_live_info ADD COLUMN `fake_live_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '假直播url' AFTER `is_fake_live`;
ALTER TABLE ims_yzd_kp_course_live_info ADD COLUMN `fake_live_duration` int(11) NULL DEFAULT NULL COMMENT '假直播秒数' AFTER `fake_live_url`;
ALTER TABLE ims_yzd_kp_course_live_info ADD COLUMN `fake_live_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `fake_live_duration`;

ALTER TABLE ims_yzd_kp_course_live_info ADD COLUMN `live_share` tinyint(1) NULL DEFAULT 0 COMMENT '直播间分享 1开启 0关闭' AFTER `fake_live_title`;
ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `is_use_user_confirm` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否需要用户确认 用于 新版商家转账' AFTER `wx_ewm`;
ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `user_is_confirm` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户是否已确认收款 仅用于新版商家转账' AFTER `is_use_user_confirm`;
ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `new_sjzz_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'https://pay.weixin.qq.com/doc/v3/merchant/4012712115' AFTER `user_is_confirm`;
ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `new_sjzz_fail_reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `new_sjzz_status`;
ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `package_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `new_sjzz_fail_reason`;
ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `user_confirm_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `package_info`;
ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `is_close` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否关单 0未关单 1已关单' AFTER `user_confirm_time`;
ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `transfer_submit_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交商家转账时间' AFTER `is_close`;
ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `transfer_handle_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理商家转账时间 比如到账时间、关单时间' AFTER `transfer_submit_time`;
ALTER TABLE ims_yzd_kp_distribute_tx ADD COLUMN `out_bill_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内部商家转账单号' AFTER `transfer_handle_time`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `wx_key_v3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付V3密钥' AFTER `zhuanzhang_type`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `wx_platform_cert_serial_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付 平台证书序列号' AFTER `wx_key_v3`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `wx_platform_cert` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信支付 平台证书' AFTER `wx_platform_cert_serial_number`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `wx_signature_verification_mode` tinyint(1) NOT NULL DEFAULT 1 COMMENT '回调验签模式 1平台证书 2微信支付公钥' AFTER `wx_platform_cert`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `wx_public_key_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付 公钥ID' AFTER `wx_signature_verification_mode`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `wx_public_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信支付 公钥内容' AFTER `wx_public_key_id`;
ALTER TABLE ims_yzd_kp_pay MODIFY COLUMN `zhuanzhang_type` int(11) NOT NULL DEFAULT 1 COMMENT '1企业付款到零钱 2商家转账到零钱 3商家转账（新版）' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_sys_live ADD COLUMN `live_back_index` tinyint(1) NULL DEFAULT 0 COMMENT '直播间返回首页 0关闭 1开启' AFTER `menu_courseware_show`;

ALTER TABLE ims_yzd_kp_ai_app ADD COLUMN `is_img` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可以发图片 0 否 1是' AFTER `quick_list`;
ALTER TABLE ims_yzd_kp_ai_app MODIFY COLUMN `day_max_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '2不限制次数 1限制次数' AFTER `vip_free_see`;
ALTER TABLE ims_yzd_kp_ai_app_chat_list ADD COLUMN `img_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `app_id`;
ALTER TABLE ims_yzd_kp_sys_live ADD COLUMN `room_tips` tinyint(1) NULL DEFAULT 1 COMMENT '0关闭1开启' AFTER `live_back_index`;

ALTER TABLE ims_yzd_kp_pay_log ADD COLUMN `is_wx_use_send_manage` tinyint(1) NOT NULL DEFAULT 0 COMMENT '该订单是否接入微信小程序 订单发货管理 0未接入 1已接入' AFTER `user_id`;
ALTER TABLE ims_yzd_kp_pay_log ADD COLUMN `is_wx_send_type` int(2) NOT NULL DEFAULT 0 COMMENT '订单发货类型 1虚拟订单 2实物发货订单' AFTER `is_wx_use_send_manage`;
ALTER TABLE ims_yzd_kp_pay_log ADD COLUMN `is_wx_send` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否微信api发货 0未发货 1发货' AFTER `is_wx_send_type`;
ALTER TABLE ims_yzd_kp_pay_log ADD COLUMN `is_pay` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0未支付 1已支付' AFTER `is_wx_send`;
ALTER TABLE ims_yzd_kp_pay_log ADD COLUMN `deviceType` int(2) NOT NULL DEFAULT 0 COMMENT '端' AFTER `is_pay`;
ALTER TABLE ims_yzd_kp_pay_log ADD COLUMN `body_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品名称' AFTER `deviceType`;
ALTER TABLE ims_yzd_kp_wxapp_config ADD COLUMN `is_use_send_manage` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否微信小程序 接入 发货管理 0未接入 1已接入' AFTER `ios_pay_title`;

ALTER TABLE ims_yzd_kp_ai_app ADD COLUMN `dify_api_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'https://api.dify.ai/v1' COMMENT 'dify api url' AFTER `type`;
ALTER TABLE ims_yzd_kp_ai_app MODIFY COLUMN `type` int(2) NOT NULL DEFAULT 1 COMMENT '1腾讯云 lke 2dify' AFTER `app_logo`;
ALTER TABLE ims_yzd_kp_ai_app_chat_group ADD COLUMN `dify_conversation_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'dify组id' AFTER `app_id`;
ALTER TABLE ims_yzd_kp_ai_app_chat_list ADD COLUMN `dify_message_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'dify消息id' AFTER `img_url`;
ALTER TABLE ims_yzd_kp_ai_chat_group ADD COLUMN `dify_conversation_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `delete_time`;
ALTER TABLE ims_yzd_kp_ai_chat_list ADD COLUMN `dify_message_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `thought_zhankai`;
ALTER TABLE ims_yzd_kp_ai_creation_log ADD COLUMN `dify_message_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `thought_zhankai`;
ALTER TABLE ims_yzd_kp_ai_set ADD COLUMN `dify_api_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'https://api.dify.ai/v1' COMMENT 'dify api url' AFTER `streaming_throttle`;
ALTER TABLE ims_yzd_kp_ai_set MODIFY COLUMN `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1腾讯云 2dify' AFTER `nav_ai_tool_show`;
ALTER TABLE ims_yzd_kp_form MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单 9商品表单 10会员下单表单 11拼团下单表单 12超级会员下单表单' AFTER `title`;

ALTER TABLE ims_yzd_kp_distribute_order MODIFY COLUMN `type` int(11) NOT NULL COMMENT '订单类型 1课程 2会员卡 3商城 4活动报名 5超级会员 6当面付' AFTER `id`;
ALTER TABLE ims_yzd_kp_form MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单 9商品表单 10会员下单表单 11拼团下单表单 12超级会员下单表单 13超级试卷' AFTER `title`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `huifu_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇付商户号' AFTER `wx_public_key`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `huifu_sys_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇付系统ID' AFTER `huifu_id`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `huifu_product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇付产品号' AFTER `huifu_sys_id`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `huifu_merchant_private_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '汇付商户私钥' AFTER `huifu_product_id`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `huifu_public_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '汇付公钥' AFTER `huifu_merchant_private_key`;
ALTER TABLE ims_yzd_kp_pay_log ADD COLUMN `is_huifu` tinyint(1) NOT NULL DEFAULT 0 AFTER `body_title`;
ALTER TABLE ims_yzd_kp_pay_log ADD COLUMN `hf_seq_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '汇付全局流水号' AFTER `is_huifu`;
ALTER TABLE ims_yzd_kp_pay_log MODIFY COLUMN `type` int(11) NOT NULL DEFAULT 1 COMMENT '1课程 2商品 3资料 4试卷 5 超级试卷 6活动报名 7会员 8超级会员 9积分商城 10拼团 11打卡 12测评 13直播打赏 14ai应用 15当面付' AFTER `order_id`;

ALTER TABLE ims_yzd_kp_course_live_user ADD COLUMN `pid` int(11) NOT NULL DEFAULT 0 COMMENT ' 0默认 -1无邀请人' AFTER `view_count`;
ALTER TABLE ims_yzd_kp_sys_live ADD COLUMN `menu_rank_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '榜单' AFTER `room_tips`;
ALTER TABLE ims_yzd_kp_sys_live ADD COLUMN `menu_rank_sort` int(11) NOT NULL DEFAULT 5 AFTER `menu_rank_title`;
ALTER TABLE ims_yzd_kp_sys_live ADD COLUMN `menu_rank_show` tinyint(1) NOT NULL DEFAULT 1 AFTER `menu_rank_sort`;
ALTER TABLE ims_yzd_kp_sys_live ADD COLUMN `is_rank` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启榜单 0不开启 1开启' AFTER `menu_rank_show`;

ALTER TABLE ims_yzd_kp_distribute_set ADD COLUMN `is_vip_with` tinyint(1) NOT NULL DEFAULT 0 COMMENT '仅会员可提现 0关闭 1开启' AFTER `fxs_title`;
ALTER TABLE ims_yzd_kp_site_set ADD COLUMN `nav_style` tinyint(1) NOT NULL DEFAULT 1 COMMENT '顶部导航文字颜色 1浅色 2深色' AFTER `wiki_top_bg`;
ALTER TABLE ims_yzd_kp_sys_live ADD COLUMN `is_gift_rank_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启打赏榜 0不开启 1开启' AFTER `is_rank`;
ALTER TABLE ims_yzd_kp_sys_live ADD COLUMN `is_online_num_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启在线人数显示 0不开启 1开启' AFTER `is_gift_rank_show`;

ALTER TABLE ims_yzd_kp_sys_login ADD COLUMN `is_show_desc` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示描述' AFTER `uniacid`;

ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `wxstore_class_version` int(11) NOT NULL DEFAULT 1 AFTER `customer_service_status`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN `lianlu_mch_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联麓 企业Id' AFTER `dxk_spid`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN `lianlu_tz_appid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联麓 通知短信appid' AFTER `lianlu_mch_id`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN `lianlu_tz_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联麓 通知短信key' AFTER `lianlu_tz_appid`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN `lianlu_yx_appid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联麓 营销短信appid' AFTER `lianlu_tz_key`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN `lianlu_yx_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联麓 营销短信key' AFTER `lianlu_yx_appid`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN `is_wxstore_buy_tz` tinyint(1) NOT NULL DEFAULT 0 COMMENT '微信小店短信通知 1开启 0关闭' AFTER `lianlu_yx_key`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN `wxstore_buy_tz_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信小店短信通知 模板ID' AFTER `is_wxstore_buy_tz`;
ALTER TABLE ims_yzd_kp_message ADD COLUMN `wxstore_buy_tz_msg_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1通知短信 2营销短信' AFTER `wxstore_buy_tz_id`;
ALTER TABLE ims_yzd_kp_message MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1阿里云 2腾讯云 3短信客 4联麓信息' AFTER `state`;
ALTER TABLE ims_yzd_kp_sys ADD COLUMN `layout_color` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1深色 2浅色' AFTER `layout_style`;
ALTER TABLE ims_yzd_kp_users ADD COLUMN `wxstore_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信小店openid' AFTER `bind_time`;
ALTER TABLE ims_yzd_kp_wxapp_config ADD COLUMN `is_pc_open` tinyint(1) NOT NULL DEFAULT 1 COMMENT '电脑微信小程序 0禁用 1启用' AFTER `is_use_send_manage`;

ALTER TABLE ims_yzd_kp_course_live_info ADD COLUMN `live_send_img` tinyint(1) NOT NULL DEFAULT 1 COMMENT '直播间是否可以发送图片0不可以 1可以' AFTER `live_share`;
ALTER TABLE ims_yzd_kp_exchange_set ADD COLUMN `dhm_btn_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '立即兑换' COMMENT '按钮文字' AFTER `dhm_bottom_content`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN `is_ewm_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '二维码登录 0关闭 1开启' AFTER `header_search_type`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN `ewm_login_type` int(2) NOT NULL DEFAULT 1 COMMENT '二维码类型 1微信小程序 2微信H5 4百度小程序 5抖音小程序 8快手小程序' AFTER `is_ewm_login`;
ALTER TABLE ims_yzd_kp_site_solution ADD COLUMN `icon_img_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '解决方案图标' AFTER `sort`;
ALTER TABLE ims_yzd_kp_storage_list ADD COLUMN `cover` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '封面图' AFTER `c_id`;

ALTER TABLE ims_yzd_kp_exchange_set ADD COLUMN `wxapp_link` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信小程序兑换码 link' AFTER `dhm_btn_text`;
ALTER TABLE ims_yzd_kp_exchange_set ADD COLUMN `wxapp_link_expire_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '微信小程序兑换码 link 过期时间' AFTER `wxapp_link`;


ALTER TABLE ims_yzd_kp_distribute_order MODIFY COLUMN `type` int(11) NOT NULL COMMENT '订单类型 1课程 2会员卡 3商城 4活动报名 5超级会员 6当面付 7人（客户定制）' AFTER `id`;
ALTER TABLE ims_yzd_kp_extra ADD COLUMN `is_course_menu_search` tinyint(1) NOT NULL DEFAULT 0 COMMENT '音视频课程目录搜索 0关闭 1开启' AFTER `is_click_label`;
ALTER TABLE ims_yzd_kp_pay_log MODIFY COLUMN `type` int(11) NOT NULL DEFAULT 1 COMMENT '1课程 2商品 3资料 4试卷 5 超级试卷 6活动报名 7会员 8超级会员 9积分商城 10拼团 11打卡 12测评 13直播打赏 14ai应用 15当面付 16human（客户定制）' AFTER `order_id`;
ALTER TABLE ims_yzd_kp_vip_card ADD COLUMN `vip_card_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_vip_set ADD COLUMN `vip_course_free_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '会员课程免费看' AFTER `form_id`;

ALTER TABLE ims_yzd_kp_course_term MODIFY COLUMN `buy_type` int(11) NOT NULL DEFAULT 1 COMMENT '1购买 2兑换码 3助力 4购买商品赠送 5积分商城赠送 6后台 7幸运抽奖 8拼团 9密码兑换 10广告获取' AFTER `course_type`;
ALTER TABLE ims_yzd_kp_users_annex MODIFY COLUMN `buy_type` tinyint(1) NOT NULL COMMENT '-1 助力 0、1购买 2兑换码 3买课送 5积分商城 7幸运抽奖 8拼团 10广告获取' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_users_assess MODIFY COLUMN `buy_type` tinyint(1) NOT NULL COMMENT '1免费领取 2购买 10广告获取' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_users_paper MODIFY COLUMN `buy_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '-1 助力 0、1购买 2兑换码 3买课送 5积分商城 7幸运抽奖 8拼团 10广告获取' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_users_punchcard MODIFY COLUMN `buy_type` int(11) NOT NULL DEFAULT 1 COMMENT '1免费获得 2付费购买 3课程赠送 10广告获取' AFTER `time`;
ALTER TABLE ims_yzd_kp_users_super_exam MODIFY COLUMN `buy_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1购买 2兑换码 3会员免费看 4超级会员 5积分商城 6后台 7幸运抽奖 10广告获取' AFTER `uniacid`;

ALTER TABLE ims_yzd_kp_wxapp_ad_product_set ADD COLUMN `course_default_all_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '所有默认开启状态 0关闭 1开启' AFTER `course_btn_title`;
ALTER TABLE ims_yzd_kp_wxapp_ad_product_set ADD COLUMN `annex_default_all_status` tinyint(255) NOT NULL DEFAULT 1 COMMENT '所有默认开启状态 0关闭 1开启' AFTER `annex_btn_title`;
ALTER TABLE ims_yzd_kp_wxapp_ad_product_set ADD COLUMN `paper_default_all_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '所有默认开启状态 0关闭 1开启' AFTER `paper_btn_title`;
ALTER TABLE ims_yzd_kp_wxapp_ad_product_set ADD COLUMN `super_exam_default_all_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '所有默认开启状态 0关闭 1开启' AFTER `super_exam_btn_title`;
ALTER TABLE ims_yzd_kp_wxapp_ad_product_set ADD COLUMN `punchcard_default_all_status` tinyint(1) NULL DEFAULT 1 COMMENT '所有默认开启状态 0关闭 1开启' AFTER `punchcard_btn_title`;
ALTER TABLE ims_yzd_kp_wxapp_ad_product_set ADD COLUMN `assess_default_all_status` tinyint(1) NULL DEFAULT 1 COMMENT '所有默认开启状态 0关闭 1开启' AFTER `assess_btn_title`;

ALTER TABLE ims_yzd_kp_extra ADD COLUMN `course_note_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程笔记开关 0关闭 1开启' AFTER `is_course_menu_search`;
ALTER TABLE ims_yzd_kp_extra ADD COLUMN `course_note_gongkai_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '笔记公开 0关闭 1开启' AFTER `course_note_status`;
ALTER TABLE ims_yzd_kp_users_super_exam MODIFY COLUMN `buy_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '-1买课送 1购买 2兑换码 3会员免费看 4超级会员 5积分商城 6后台 7幸运抽奖 10广告获取' AFTER `uniacid`;

ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `order_sync_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '同步订单状态 0未完成 1已完成' AFTER `wxstore_class_version`;

ALTER TABLE ims_yzd_kp_extra ADD COLUMN `is_share_login` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享是否要登录0否1是' AFTER `course_note_gongkai_status`;
ALTER TABLE ims_yzd_kp_extra ADD COLUMN `is_try_login` tinyint(1) NOT NULL DEFAULT 1 COMMENT '试看是否需要登录0否1是' AFTER `is_share_login`;
ALTER TABLE ims_yzd_kp_paper ADD COLUMN `is_auto_join_wrong` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否自动加入错题本 0关闭 1开启' AFTER `is_view_log`;
ALTER TABLE ims_yzd_kp_super_exam ADD COLUMN `is_auto_join_wrong` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否自动加入错题本 0关闭 1开启' AFTER `vip_free_see`;


ALTER TABLE ims_yzd_kp_ai_app ADD COLUMN `bot_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'coze智能体ID' AFTER `app_key`;
ALTER TABLE ims_yzd_kp_ai_app MODIFY COLUMN `type` int(2) NOT NULL DEFAULT 1 COMMENT '1腾讯云 lke 2dify 3coze' AFTER `app_logo`;
ALTER TABLE ims_yzd_kp_ai_set ADD COLUMN `bot_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '智能体ID' AFTER `app_key`;
ALTER TABLE ims_yzd_kp_ai_set MODIFY COLUMN `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1腾讯云 2dify 3coze' AFTER `nav_ai_tool_show`;
ALTER TABLE ims_yzd_kp_form MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单 9商品表单 10会员下单表单 11拼团下单表单 12超级会员下单表单 13超级试卷 14圈子下单表单' AFTER `title`;
ALTER TABLE ims_yzd_kp_form_data MODIFY COLUMN `type` int(11) NOT NULL DEFAULT 1 COMMENT '1课程表单 2自定义表单 3试卷表单 4活动表单 5资料表单 6打卡表单 7分销 8测评表单 9商品表单 10会员下单表单 11拼团下单表单 14圈子下单表单' AFTER `id`;
ALTER TABLE ims_yzd_kp_pay_log MODIFY COLUMN `type` int(11) NOT NULL DEFAULT 1 COMMENT '1课程 2商品 3资料 4试卷 5 超级试卷 6活动报名 7会员 8超级会员 9积分商城 10拼团 11打卡 12测评 13直播打赏 14ai应用 15当面付 16human（客户定制）17圈子' AFTER `order_id`;

ALTER TABLE ims_yzd_kp_extra ADD COLUMN `before_buy_show_menu` tinyint(4) NULL DEFAULT 1 COMMENT '购买前目录展示 1展示 0隐藏' AFTER `is_try_login`;
ALTER TABLE ims_yzd_kp_storage_list MODIFY COLUMN `type` int(11) NOT NULL COMMENT '1图片 2视频 3音频 4文件 5电子书' AFTER `path`;

ALTER TABLE ims_yzd_kp_circle_set ADD COLUMN `dynamics_search` tinyint(4) NULL DEFAULT 1 COMMENT '圈子动态搜索 0关闭 1开启  默认开启' AFTER `skip_play`;
ALTER TABLE ims_yzd_kp_circle_set ADD COLUMN `dynamics_edit` tinyint(4) NULL DEFAULT 1 COMMENT '圈子动态编辑 0关闭 1开启 默认开启' AFTER `dynamics_search`;
ALTER TABLE ims_yzd_kp_form_data ADD COLUMN `is_view` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否查看 0未查看 1已查看 仅针对DIY表单生效' AFTER `note`;
ALTER TABLE ims_yzd_kp_pc_header ADD COLUMN `pid` int(11) NULL DEFAULT 0 COMMENT '父id 默认0' AFTER `uniacid`;

ALTER TABLE ims_yzd_kp_enroll ADD COLUMN `time_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '活动时间类型 1自定义时间 2长期活动' AFTER `param_list`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN `top_default_color` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#ffffff' COMMENT '顶部默认背景色' AFTER `ewm_login_type`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN `ewm_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'h5二维码域名' AFTER `top_default_color`;

ALTER TABLE ims_yzd_kp_article ADD COLUMN `file_list` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '0' AFTER `article_jf_data`;
ALTER TABLE ims_yzd_kp_circle_comment ADD COLUMN `img_list` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片列表' AFTER `dynamics_id`;
ALTER TABLE ims_yzd_kp_circle_set ADD COLUMN `dynamics_comment_img` tinyint(1) NOT NULL DEFAULT 1 COMMENT '动态评价图片 0关闭 1开启' AFTER `dynamics_edit`;
ALTER TABLE ims_yzd_kp_extra ADD COLUMN `buy_course_notice_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '购课须知' COMMENT '购课须知' AFTER `before_buy_show_menu`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `transfer_scene_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '佣金报酬' COMMENT '转账场景' AFTER `huifu_public_key`;
ALTER TABLE ims_yzd_kp_pay ADD COLUMN `transfer_user_perception` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '劳务报酬' COMMENT '用户收款感知' AFTER `transfer_scene_name`;
ALTER TABLE ims_yzd_kp_pc_config ADD COLUMN `login_bg_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `ewm_domain`;

ALTER TABLE ims_yzd_kp_circle_order ADD COLUMN `is_form` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有表单 0没有 1有' AFTER `invitation_user_id`;
ALTER TABLE ims_yzd_kp_scrm_course ADD COLUMN `userid_arr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '成员id arr' AFTER `userid`;

ALTER TABLE ims_yzd_kp_circle_set ADD COLUMN `virtual_num` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟人数' AFTER `dynamics_comment_img`;
ALTER TABLE ims_yzd_kp_core_sys ADD COLUMN `refund_new_version_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款新版本节点时间' AFTER `order_sync_status`;
ALTER TABLE ims_yzd_kp_users_view_footprint_set ADD COLUMN `log_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录类型 1记录每次访问 2记录最新访问' AFTER `uniacid`;
ALTER TABLE ims_yzd_kp_sys_language_set ADD COLUMN `font_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '字体路径' AFTER `text_direction`;


ALTER TABLE ims_yzd_kp_course_live_info ADD COLUMN `show_subscribe_status` tinyint(4) NULL DEFAULT 0 COMMENT '订阅开关 0关闭 1开启 默认关闭 开启后，用户在小程序/公众号h5直播页主动订阅后，将会在推送时间接收到一次微信消息推送' AFTER `live_send_img`;
ALTER TABLE ims_yzd_kp_course_live_info ADD COLUMN `subscribe_auto_send_time` int(11) NULL DEFAULT 0 COMMENT '自动推送时间 0关闭自动推送 5直播前5分钟  10直播前10分钟  15、20、30、45、60 默认为0' AFTER `show_subscribe_status`;
ALTER TABLE ims_yzd_kp_extra ADD COLUMN `course_free_customize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '免费' COMMENT '免费课程文字自定义' AFTER `buy_course_notice_title`;
ALTER TABLE ims_yzd_kp_extra ADD COLUMN `course_study_people_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '课程学习人数 1显示 0隐藏' AFTER `course_free_customize`;
ALTER TABLE ims_yzd_kp_live_set ADD COLUMN `callback_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调密钥' AFTER `live_type`;
ALTER TABLE ims_yzd_kp_storage MODIFY COLUMN `type` int(11) NOT NULL DEFAULT 0 COMMENT '1本地存储 2阿里云OSS 3七牛云存储 4腾讯云COS 5阿里云点播 6腾讯云点播 0跟随音视频存储设置  7又拍云 8华为云存储' AFTER `id`;
ALTER TABLE ims_yzd_kp_tmplmsg_set ADD COLUMN `is_yhsqtktz` tinyint(1) NOT NULL DEFAULT 0 AFTER `groupbuy_id`;
ALTER TABLE ims_yzd_kp_tmplmsg_set ADD COLUMN `yhsqtktz_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `is_yhsqtktz`;