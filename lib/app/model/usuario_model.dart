class Usuarios {
  Usuarios? usuarios;

  Usuarios({this.usuarios});

  Usuarios.fromJson(Map<String, dynamic> json) {
    usuarios = json['usuarios'] != null
        ? new Usuarios.fromJson(json['usuarios'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.usuarios != null) {
      data['usuarios'] = this.usuarios!.toJson();
    }
    return data;
  }
}

class Usuario {
  String? idUsuario;
  String? nomeEmpresa;
  List<String>? questionarios;
  bool? usuarioAtivo;

  Usuario(
      {this.idUsuario,
      this.nomeEmpresa,
      this.usuarioAtivo,
      this.questionarios});

  Usuario.fromJson(Map<String, dynamic> json) {
    idUsuario = json['idUsuario'];
    idUsuario = json['nomeEmpresa'];
    usuarioAtivo = json['usuarioAtivo'];
    questionarios = json['questionarios'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUsuario'] = this.idUsuario;
    data['nomeEmpresa'] = this.idUsuario;
    data['usuarioAtivo'] = this.usuarioAtivo;
    data['questionarios'] = this.questionarios;
    return data;
  }
}
