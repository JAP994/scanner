import 'package:dio/dio.dart';
import 'package:scanner/models/service_model.dart';

class Services {
  final _dio = Dio();

  Future<List<ServiceModel>> getAllServices() async {
    try {
      final response = await _dio.get(
        "https://acceptable-eggs-0ba2b16280.strapiapp.com/api/services",
        queryParameters: {"populate": "*"},
      );

      final listServices = response.data["data"];

      return (listServices as List)
          .map((item) => ServiceModel.fromMap(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // if (e is DioException && e.response?.statusCode == 404) {
      //   return [];
      // }
      rethrow;
    }
  }
}
