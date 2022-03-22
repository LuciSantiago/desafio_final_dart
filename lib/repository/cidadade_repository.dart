import 'package:desafio_final/model/cidade.dart';
import 'package:dio/dio.dart';

class CidadeRepository {
  Future<List<Cidade>> buscarCidade() async {
    Response response;
    var dio = Dio();

    response = await dio.get<List>(
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/35/distritos');
    var listCidade = (response.data as List).map((cidade) {
      return Cidade.fromMap(cidade);
    }).toList();

    return listCidade;
  }
}
