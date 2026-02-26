// 基于dio进行二次封装

import 'package:dio/dio.dart';
import 'package:hm_store_app/constants/index.dart';

class DioRequest {
  final _dio = Dio();

  DioRequest() {
    _dio.options.baseUrl = GlobalConstants.BASE_URL;
    _dio.options.connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _dio.options.sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _dio.options.receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    // 拦截器
    _addIntercepter();
  }
  void _addIntercepter() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (req, handler) {
          handler.next(req);
        },
        onResponse: (res, handler) {
          // 处理http_code
          if (res.statusCode! >= 200 && res.statusCode! < 300) {
            handler.next(res);
            return;
          }
          handler.reject(DioException(requestOptions: res.requestOptions));
        },
        onError: (err, handler) {
          handler.reject(err);
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>;
      if (data["code"] == GlobalConstants.SUCCESS_CODE) {
        return data["result"];
      } else {
        throw Exception(data["msg"] ?? "加载异常");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

// 这种方式创建的变量是一个全局变量
final dioRequest = DioRequest();
