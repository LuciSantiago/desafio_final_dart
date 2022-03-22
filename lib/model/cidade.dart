import 'dart:convert';

class Cidade {
  final String id;
  final String nome;
  final int estado;
  Cidade({
    required this.id,
    required this.nome,
    required this.estado,
  });

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
        id: map['id'],
        nome: map['nome'],
        estado: map['municipio']['microrregiao']['mesorregiao']['UF']['id']);
  }

  factory Cidade.fromJson(String source) => Cidade.fromMap(jsonDecode(source));

  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome, 'estado': estado};
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => 'Cidade(id: $id, nome: $nome, estado: $estado)';
}
