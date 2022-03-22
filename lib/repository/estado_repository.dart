import 'package:dio/dio.dart';

import '../model/estado.dart';

class EstadoRepository {
  Future<List<Estado>> buscarEstado() async {
    Response response;
    var dio = Dio();

    response = await dio.get<List>(
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados');
    var listEstado = (response.data as List).map((estado) {
      return Estado.fromMap(estado);
    }).toList();

    return listEstado;
  }
}
