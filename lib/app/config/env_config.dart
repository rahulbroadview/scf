import '../core/constant/string_constant.dart';

abstract class BaseConfig {
  String get apiHttpsHost;
}

class DevConfig implements BaseConfig {
  @override
  String get apiHttpsHost => ConstString.devBaseUrl;
}

class QAConfig implements BaseConfig {
  @override
  String get apiHttpsHost => ConstString.qaBaseUrl;
}

class ProdConfig implements BaseConfig {
  @override
  String get apiHttpsHost => ConstString.prodBaseUrl;
}

class Environment {
  static final Environment _singleton = Environment._internal();

  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static const String dev = ConstString.dev;
  static const String qa = ConstString.qa;
  static const String prod = ConstString.prod;

  BaseConfig getEnvConfig(String environment) {
    switch (environment) {
      case Environment.dev:
        return DevConfig();
      case Environment.qa:
        return QAConfig();
      case Environment.prod:
        return ProdConfig();
      default:
        return QAConfig();
    }
  }
}
