import 'package:dio/dio.dart';
import 'package:scanner/models/service_model.dart';

class Services {
  // 1. Instanciar dio
  final _dio = Dio();
  // 2. Crear una función para obtener la información
  Future<List<ServiceModel>> getAllServices() async {
    try {
      final response = await _dio.get(
        "https://acceptable-eggs-0ba2b16280.strapiapp.com/api/services?query pa",
        queryParameters: {"populate": "*"},
      );
      // Parseo de la información
      final listServices = List.from(response.data["data"]);
      // 20x 
      // 40x -> Error del cliente
      // 50x -> Error del servidor

      return listServices
          .map((item) => ServiceModel.fromJson(item as Map<String, dynamic>)).toList();

    } catch (err) {
      // Verificar el status code 
      // if(err is DioException && err.response?.statusCode == 404) {
      //   // Algo ha ocurrido
      //   return [];
      // } 

      // Vericar mensajes de error

      // Controlar el error
      // return [];
      rethrow;
    }
  }
}
