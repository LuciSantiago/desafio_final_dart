import 'dart:convert';

class Estado {
  final int id;
  final String nome;
  final String sigla;
  Estado({
    required this.id,
    required this.nome,
    required this.sigla,
  });

  factory Estado.fromMap(Map<String, dynamic> map) {
    return Estado(id: map['id'], nome: map['nome'], sigla: map['sigla']);
  }

  factory Estado.fromJson(String source) => Estado.fromMap(jsonDecode(source));

  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome, 'sigla': sigla};
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => 'Estado(id: $id, nome: $nome, sigla: $sigla)';
}
