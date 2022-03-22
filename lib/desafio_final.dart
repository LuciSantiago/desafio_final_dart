import 'package:desafio_final/repository/cidadade_repository.dart';
import 'package:desafio_final/repository/database.dart';
import 'package:desafio_final/repository/estado_repository.dart';

Future<void> main() async {
  final database = Database();
  var mysqlConnection = await database.openConnection();
  var estadoRepository = EstadoRepository();
  try {
    var estados = await estadoRepository.buscarEstado();
    for (var estado in estados) {
      await mysqlConnection.transaction((_) {
        mysqlConnection.query('insert into estado(id,nome,uf) values(?,?,?)',
            [estado.id, estado.nome, estado.sigla]);
      });
    }
  } catch (e) {
    print(e);
  }

  var cidadeRepository = CidadeRepository();
  try {
    var cidades = await cidadeRepository.buscarCidade();
    for (var cidade in cidades) {
      await mysqlConnection.transaction((_) {
        mysqlConnection.query('insert into cidade(id,nome,id_uf) values(?,?,?)',
            [null, cidade.nome, cidade.estado]);
      });
    }
  } catch (e) {
    print(e);
  }

  await mysqlConnection.close();
}
