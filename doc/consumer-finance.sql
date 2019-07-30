/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : consumer-finance

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 30/07/2019 14:24:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `balance` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bill_loan
-- ----------------------------
DROP TABLE IF EXISTS `bill_loan`;
CREATE TABLE `bill_loan`  (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  `out_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '外部进件ID',
  `customer_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户ID',
  `investor_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资金方ID',
  `merchant_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商户ID',
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品ID',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `loan_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '借款金额',
  `required_repaying_total_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '需要还款总金额',
  `loan_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '借款时间',
  `term_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '期次',
  `start_date` datetime(0) DEFAULT NULL COMMENT '借款开始时间',
  `end_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '借款结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '放款单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bill_payment
-- ----------------------------
DROP TABLE IF EXISTS `bill_payment`;
CREATE TABLE `bill_payment`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bill_repayment
-- ----------------------------
DROP TABLE IF EXISTS `bill_repayment`;
CREATE TABLE `bill_repayment`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bill_repayment_plan
-- ----------------------------
DROP TABLE IF EXISTS `bill_repayment_plan`;
CREATE TABLE `bill_repayment_plan`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for common_app
-- ----------------------------
DROP TABLE IF EXISTS `common_app`;
CREATE TABLE `common_app`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '应用别名',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '应用名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '服务地址',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_app
-- ----------------------------
INSERT INTO `common_app` VALUES (1, 'antifraud', '反欺诈管理', NULL, NULL);
INSERT INTO `common_app` VALUES (2, 'creditreport', '征信报告管理', NULL, NULL);
INSERT INTO `common_app` VALUES (3, 'riskcontrol', '风控管理', NULL, NULL);
INSERT INTO `common_app` VALUES (4, 'broker', '中间人管理', NULL, NULL);
INSERT INTO `common_app` VALUES (5, 'merchant', '商户管理', NULL, NULL);
INSERT INTO `common_app` VALUES (6, 'app', '应用管理', NULL, NULL);
INSERT INTO `common_app` VALUES (7, 'batchjob', '批量任务管理', NULL, NULL);
INSERT INTO `common_app` VALUES (8, 'credit', '信贷管理', NULL, NULL);
INSERT INTO `common_app` VALUES (9, 'finance', '资金管理', NULL, NULL);
INSERT INTO `common_app` VALUES (10, 'iam', '登录权限认证管理', NULL, NULL);
INSERT INTO `common_app` VALUES (11, 'institution', '机构管理', NULL, NULL);
INSERT INTO `common_app` VALUES (12, 'notification', '通知管理', NULL, NULL);
INSERT INTO `common_app` VALUES (13, 'reports', '报表管理', NULL, NULL);
INSERT INTO `common_app` VALUES (14, 'tenant', '租户管理', NULL, NULL);

-- ----------------------------
-- Table structure for common_back
-- ----------------------------
DROP TABLE IF EXISTS `common_back`;
CREATE TABLE `common_back`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '贷后还款名称',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '贷后还款别名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_back
-- ----------------------------
INSERT INTO `common_back` VALUES (1, '正常还款', 'mormal');
INSERT INTO `common_back` VALUES (2, '提前还款', 'advance');
INSERT INTO `common_back` VALUES (3, '逾期还款', 'overdue');
INSERT INTO `common_back` VALUES (4, '回购', 'buyback');
INSERT INTO `common_back` VALUES (5, '提前结清', 'earlypayoff');
INSERT INTO `common_back` VALUES (6, '代偿', 'traffic');

-- ----------------------------
-- Table structure for common_bank
-- ----------------------------
DROP TABLE IF EXISTS `common_bank`;
CREATE TABLE `common_bank`  (
  `id` int(11) NOT NULL,
  `bank_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '银行编码',
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '银行名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '银行图标',
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '银行网址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '银行信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for common_channel
-- ----------------------------
DROP TABLE IF EXISTS `common_channel`;
CREATE TABLE `common_channel`  (
  `id` int(11) NOT NULL,
  `channel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '渠道名称',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '渠道说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for common_group
-- ----------------------------
DROP TABLE IF EXISTS `common_group`;
CREATE TABLE `common_group`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '组名称',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '组别名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_group
-- ----------------------------
INSERT INTO `common_group` VALUES (1, '资金方', 'INVESTOR');
INSERT INTO `common_group` VALUES (2, '商户', 'MERCHANT');
INSERT INTO `common_group` VALUES (3, '中间服务商', 'BROKER');
INSERT INTO `common_group` VALUES (4, '客户', 'CUSTOMER');

-- ----------------------------
-- Table structure for common_material
-- ----------------------------
DROP TABLE IF EXISTS `common_material`;
CREATE TABLE `common_material`  (
  `id` int(11) NOT NULL COMMENT '资料类别',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资料名称',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资料别名',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资料说明',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for common_mode
-- ----------------------------
DROP TABLE IF EXISTS `common_mode`;
CREATE TABLE `common_mode`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '还款方式名称',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '还款方式别名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_mode
-- ----------------------------
INSERT INTO `common_mode` VALUES (1, '等额本金', NULL);
INSERT INTO `common_mode` VALUES (2, '等额本息', NULL);
INSERT INTO `common_mode` VALUES (3, '等本等系', NULL);
INSERT INTO `common_mode` VALUES (4, '一次性还本付息', NULL);

-- ----------------------------
-- Table structure for common_permission
-- ----------------------------
DROP TABLE IF EXISTS `common_permission`;
CREATE TABLE `common_permission`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for common_routing
-- ----------------------------
DROP TABLE IF EXISTS `common_routing`;
CREATE TABLE `common_routing`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for common_settlement
-- ----------------------------
DROP TABLE IF EXISTS `common_settlement`;
CREATE TABLE `common_settlement`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_settlement
-- ----------------------------
INSERT INTO `common_settlement` VALUES (1, '结算时间跳过节假日', 'SKIP_HOLIDAY');
INSERT INTO `common_settlement` VALUES (2, '结算时间跳过周末', 'SKIP_WEEKDAY');

-- ----------------------------
-- Table structure for common_suite
-- ----------------------------
DROP TABLE IF EXISTS `common_suite`;
CREATE TABLE `common_suite`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for common_tenant
-- ----------------------------
DROP TABLE IF EXISTS `common_tenant`;
CREATE TABLE `common_tenant`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '租户ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '租户名称',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '租户别名',
  `contact_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '租户联系人',
  `contact_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
  `contact_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系手机',
  `contact_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系邮箱',
  `enabled` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否可用',
  `platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否是平台账号',
  `created` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modified` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_tenant
-- ----------------------------
INSERT INTO `common_tenant` VALUES (1, '平台账户默认账户', 'platform', NULL, NULL, NULL, NULL, 'enabled', 'platform', NULL, NULL);
INSERT INTO `common_tenant` VALUES (2, '新建平台账户', 'cloud', NULL, NULL, NULL, NULL, 'disabled', 'platform', NULL, NULL);
INSERT INTO `common_tenant` VALUES (3, '钱袋租户', 'qd', '杨***', '杭州江干区闸弄口', '15110083360', 'yangjava2014@163.com', 'enabled', 'tenant', NULL, NULL);

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '合同表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contract_element
-- ----------------------------
DROP TABLE IF EXISTS `contract_element`;
CREATE TABLE `contract_element`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '合同要素表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contract_signer
-- ----------------------------
DROP TABLE IF EXISTS `contract_signer`;
CREATE TABLE `contract_signer`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '合同签署信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contract_task
-- ----------------------------
DROP TABLE IF EXISTS `contract_task`;
CREATE TABLE `contract_task`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contract_template
-- ----------------------------
DROP TABLE IF EXISTS `contract_template`;
CREATE TABLE `contract_template`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '合同模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contract_value
-- ----------------------------
DROP TABLE IF EXISTS `contract_value`;
CREATE TABLE `contract_value`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '合同内容值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for credit_material
-- ----------------------------
DROP TABLE IF EXISTS `credit_material`;
CREATE TABLE `credit_material`  (
  `id` int(11) NOT NULL,
  `material_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资料名称ID',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '资料文件路径',
  `credit_order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '进件编号ID',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改时间',
  `mofidier` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for credit_order
-- ----------------------------
DROP TABLE IF EXISTS `credit_order`;
CREATE TABLE `credit_order`  (
  `id` int(11) NOT NULL COMMENT '主键ID',
  `tenant_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '进件编号',
  `out_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '外部进件编号',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `business_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '账期',
  `principal_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '申请金额',
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '申请产品ID',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '进件状态',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '进件说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for credit_task
-- ----------------------------
DROP TABLE IF EXISTS `credit_task`;
CREATE TABLE `credit_task`  (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  `credit_order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '进件ID',
  `assignee_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '执行者ID',
  `claimed_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `deadline` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `decided_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `decision` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `step` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for institution
-- ----------------------------
DROP TABLE IF EXISTS `institution`;
CREATE TABLE `institution`  (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机构名称',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机构别名',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for institution_broker
-- ----------------------------
DROP TABLE IF EXISTS `institution_broker`;
CREATE TABLE `institution_broker`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '中间人结构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for institution_investor
-- ----------------------------
DROP TABLE IF EXISTS `institution_investor`;
CREATE TABLE `institution_investor`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '投资方' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for institution_merchant
-- ----------------------------
DROP TABLE IF EXISTS `institution_merchant`;
CREATE TABLE `institution_merchant`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for institution_merchant_credit
-- ----------------------------
DROP TABLE IF EXISTS `institution_merchant_credit`;
CREATE TABLE `institution_merchant_credit`  (
  `id` int(11) NOT NULL,
  `institution_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机构ID',
  `risk_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风控ID',
  `total_credit_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '申请的授信总额度',
  `used_credit_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '已经使用的授信额度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品描述',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品状态',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品创建时间',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品创建人',
  `modified` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品修改时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '3', '嘉英宝', '主要用于精英人士的消费贷款', 'enabled', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for product_contract
-- ----------------------------
DROP TABLE IF EXISTS `product_contract`;
CREATE TABLE `product_contract`  (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '金融产品ID',
  `contract_template_id` int(11) DEFAULT NULL COMMENT '合同模板ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_fee
-- ----------------------------
DROP TABLE IF EXISTS `product_fee`;
CREATE TABLE `product_fee`  (
  `id` int(11) NOT NULL,
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '金融产品ID',
  `back_id` int(11) DEFAULT NULL COMMENT '金融产品类型',
  `expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '金融产品计算表达式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_fee
-- ----------------------------
INSERT INTO `product_fee` VALUES (1, '1', 1, 'PRINCIPAL_AMOUNT * 0.008 + RESIDUAL_TO_PAY_PRINCIPAL_AMOUNT');

-- ----------------------------
-- Table structure for product_institution
-- ----------------------------
DROP TABLE IF EXISTS `product_institution`;
CREATE TABLE `product_institution`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_material
-- ----------------------------
DROP TABLE IF EXISTS `product_material`;
CREATE TABLE `product_material`  (
  `id` int(11) NOT NULL,
  `material_id` int(11) DEFAULT NULL COMMENT '资料名称ID',
  `product_id` int(11) DEFAULT NULL COMMENT '产品ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_mode
-- ----------------------------
DROP TABLE IF EXISTS `product_mode`;
CREATE TABLE `product_mode`  (
  `id` int(11) NOT NULL,
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_mode
-- ----------------------------
INSERT INTO `product_mode` VALUES (1, '1', 1);

-- ----------------------------
-- Table structure for product_rate
-- ----------------------------
DROP TABLE IF EXISTS `product_rate`;
CREATE TABLE `product_rate`  (
  `id` int(11) NOT NULL,
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '金融产品ID',
  `max_rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '最大利率',
  `min_rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '最小利率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_rate
-- ----------------------------
INSERT INTO `product_rate` VALUES (1, '1', '0.15', '0.10');

-- ----------------------------
-- Table structure for product_risk
-- ----------------------------
DROP TABLE IF EXISTS `product_risk`;
CREATE TABLE `product_risk`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '金融产品风控规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_template
-- ----------------------------
DROP TABLE IF EXISTS `product_template`;
CREATE TABLE `product_template`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '金融产品模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_term
-- ----------------------------
DROP TABLE IF EXISTS `product_term`;
CREATE TABLE `product_term`  (
  `id` int(11) NOT NULL,
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品ID',
  `term_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '期次大小',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '金融产品期次问题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_date
-- ----------------------------
DROP TABLE IF EXISTS `system_date`;
CREATE TABLE `system_date`  (
  `id` int(11) NOT NULL COMMENT '系统时间ID',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `business_date` date DEFAULT NULL COMMENT '系统账期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统时间表\r\n每日会按照时间开展业务\r\n一个租户只会有一条账期时间' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_date
-- ----------------------------
INSERT INTO `system_date` VALUES (1, 3, '2017-01-01');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务主键ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '任务名称',
  `task` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '任务',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, NULL, 'CancelUnfinishedOrdersTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (2, NULL, 'GenerateQualityCheckTicketTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (3, NULL, 'RetryExceptionOrderTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (4, NULL, 'UpdateSystemDateTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (5, NULL, 'NotificationTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (6, NULL, 'RepayCashTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (7, NULL, 'PayCashTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (8, NULL, 'AccountBalanceAlertTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (9, NULL, 'ActiveOrderAmountAlertTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (10, NULL, 'UpdateRepaymentsTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (11, NULL, 'EarlyPayoffTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (12, NULL, 'PullingTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (13, NULL, 'SyncRepaymentsTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (14, NULL, 'GetCollectionReportTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (15, NULL, 'NotifyRepaymentTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (16, NULL, 'FirstRepaymentFailureNotificationTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (17, NULL, 'RepaymentOverdueNotificationTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (18, NULL, 'MerchantCreditUsageTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (19, NULL, 'FetchExternalMaterialTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (20, NULL, 'RetryTaskApiTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (21, NULL, 'SendRepaymentResultsTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (22, NULL, 'GenDailyReportTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (23, NULL, 'RerunExceptionOrderTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (24, NULL, 'DailyReportTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (25, NULL, 'FileEarlyPayoffTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (26, NULL, 'FileApprovalTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (27, NULL, 'FileCreditOrderTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (28, NULL, 'FilePaymentTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (29, NULL, 'FileRepaymentDetailTask', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (30, NULL, 'PostLoanJob', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (31, NULL, 'PayCashTask2', NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES (32, NULL, 'NotificationTask2', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for task_date
-- ----------------------------
DROP TABLE IF EXISTS `task_date`;
CREATE TABLE `task_date`  (
  `id` int(11) NOT NULL COMMENT '主键ID',
  `tenant_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  `date` date DEFAULT NULL COMMENT '日期',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_date
-- ----------------------------
INSERT INTO `task_date` VALUES (1, '3', '2017-01-02', '周末不执行任务', 'WEEKEND');
INSERT INTO `task_date` VALUES (2, '3', '2017-01-03', '节假日不执行任务', 'HOLIDAY');

-- ----------------------------
-- Table structure for tenant_role
-- ----------------------------
DROP TABLE IF EXISTS `tenant_role`;
CREATE TABLE `tenant_role`  (
  `id` int(11) NOT NULL COMMENT '角色ID',
  `tenant` int(255) DEFAULT NULL COMMENT '租户ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '角色描述',
  `enabled` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否可用',
  `system` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否是系统角色',
  `created` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modified` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_role
-- ----------------------------
INSERT INTO `tenant_role` VALUES (1, 1, '租户管理', NULL, 'enabled', 'system', NULL, NULL);
INSERT INTO `tenant_role` VALUES (2, 1, '用户管理', NULL, 'enabled', 'system', NULL, NULL);
INSERT INTO `tenant_role` VALUES (3, 1, '应用管理', NULL, 'enabled', 'system', NULL, NULL);
INSERT INTO `tenant_role` VALUES (4, 1, '权限管理', NULL, 'enabled', 'system', NULL, NULL);
INSERT INTO `tenant_role` VALUES (5, 1, '定时任务管理', NULL, 'enabled', 'system', NULL, NULL);
INSERT INTO `tenant_role` VALUES (6, 1, '操作日志管理', NULL, 'enabled', 'system', NULL, NULL);
INSERT INTO `tenant_role` VALUES (1001, 3, '用户管理', NULL, 'enabled', 'system', NULL, NULL);
INSERT INTO `tenant_role` VALUES (1002, 3, '应用管理', NULL, 'enabled', 'system', NULL, NULL);
INSERT INTO `tenant_role` VALUES (1003, 3, '权限管理', NULL, 'enabled', 'system', NULL, NULL);
INSERT INTO `tenant_role` VALUES (1004, 3, '定时任务管理', NULL, 'enabled', 'system', NULL, NULL);
INSERT INTO `tenant_role` VALUES (1005, 3, '操作日志管理', NULL, 'enabled', 'system', NULL, NULL);

-- ----------------------------
-- Table structure for tenant_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `tenant_role_permission`;
CREATE TABLE `tenant_role_permission`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_suite
-- ----------------------------
DROP TABLE IF EXISTS `tenant_suite`;
CREATE TABLE `tenant_suite`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_suite_app
-- ----------------------------
DROP TABLE IF EXISTS `tenant_suite_app`;
CREATE TABLE `tenant_suite_app`  (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_user
-- ----------------------------
DROP TABLE IF EXISTS `tenant_user`;
CREATE TABLE `tenant_user`  (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '登录名称',
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '显示名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `enabled` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否可用',
  `locked` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否锁定',
  `system` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否是系统用户',
  `created` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modified` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_user
-- ----------------------------
INSERT INTO `tenant_user` VALUES (1, '1', 'admin', 'SAAS平台', 'admin', '12345678901', '123@123.com', 'enabled', 'unlocked', 'system', NULL, NULL);
INSERT INTO `tenant_user` VALUES (2, '3', 'admin', '钱袋租户管理员', 'admin', NULL, NULL, 'enabled', 'unlocked', 'system', NULL, NULL);
INSERT INTO `tenant_user` VALUES (3, '3', 'user', '钱袋普通用户', 'admin', NULL, NULL, 'enabled', 'unlocked', 'normal', NULL, NULL);

-- ----------------------------
-- Table structure for tenant_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tenant_user_role`;
CREATE TABLE `tenant_user_role`  (
  `id` int(11) NOT NULL COMMENT '用户角色表ID',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
