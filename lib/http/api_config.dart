/// 所有api接口存放文件

/// 是否是生产环境
const bool inProduction = const bool.fromEnvironment("dart.vm.product");

const String pro = "http://rap2api.taobao.org/app/mock/6511";
const String dev = "http://rap2api.taobao.org/app/mock/6511";

class ApiConfig {
  // 默认域名信息
  static const String BASE_URL = inProduction ? pro : dev;
  // 获取用户列表信息
  static const String GET_USER_LIST = BASE_URL + "/user/pay";
}