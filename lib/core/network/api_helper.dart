import 'package:dio/dio.dart';

class ApiHelper {
  Dio dio;

  ApiHelper({required this.dio}) {
    BaseOptions options =
        BaseOptions(connectTimeout: const Duration(seconds: 10));
    options.receiveTimeout = const Duration(seconds: 5);
    options.sendTimeout = const Duration(seconds: 5);

    dio.options = options;
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(url);
      return response;
    } on DioError catch (e) {
      print("DioError is :$e");
      rethrow;
    } on Exception catch (e) {
      print("Exception is :$e");
      rethrow;
    } catch (e) {
      print("UnknownError is :$e");
      rethrow;
    }
  }

  Future<dynamic> post(String url, dynamic data) async {
    try {
      final response = await dio.post(url, data: data);
      return response;
    } on DioError catch (e) {
      print("DioError is :$e");
      rethrow;
    } on Exception catch (e) {
      print("Exception is :$e");
      rethrow;
    } catch (e) {
      print("UnknownError is :$e");
      rethrow;
    }
  }

  Future<dynamic> update(String url, dynamic data) async {
    try {
      final response = await dio.put(url, data: data);
      return response;
    } on DioError catch (e) {
      print("DioError is :$e");
      rethrow;
    } on Exception catch (e) {
      print("Exception is :$e");
      rethrow;
    } catch (e) {
      print("UnknownError is :$e");
      rethrow;
    }
  }

  Future<dynamic> put(String url, dynamic data) async {
    try {
      final response = await dio.patch(url, data: data);
      return response;
    } on DioError catch (e) {
      print("DioError is :$e");
      rethrow;
    } on Exception catch (e) {
      print("Exception is :$e");
      rethrow;
    } catch (e) {
      print("UnknownError is :$e");
      rethrow;
    }
  }

  Future<dynamic> delete(String url, dynamic data) async {
    try {
      final response = await dio.delete(url, data: data);
      return response;
    } on DioError catch (e) {
      print("DioError is :$e");
      rethrow;
    } on Exception catch (e) {
      print("Exception is :$e");
      rethrow;
    } catch (e) {
      print("UnknownError is :$e");
      rethrow;
    }
  }
}
