class RespostaAberta {
  String? id;
  String? idProximaTelaEstatica;
  List<Gabarito>? gabarito;
  String? imagemAnimacao;
  String? nomeTela;
  String? repostaAberta;
  String? tituloQuestao;

  RespostaAberta(
      {this.id,
      this.idProximaTelaEstatica,
      this.gabarito,
      this.imagemAnimacao,
      this.nomeTela,
      this.repostaAberta,
      this.tituloQuestao});

  RespostaAberta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['gabarito'] != null) {
      gabarito = <Gabarito>[];
      json['gabarito'].forEach((v) {
        gabarito!.add(new Gabarito.fromJson(v));
      });
    }
    imagemAnimacao = json['imagemAnimacao'];
    nomeTela = json['nomeTela'];
    repostaAberta = json['repostaAberta'];
    tituloQuestao = json['tituloQuestao'];
     idProximaTelaEstatica = json['idProximaTelaEstatica'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.gabarito != null) {
      data['gabarito'] = this.gabarito!.map((v) => v.toJson()).toList();
    }
    data['imagemAnimacao'] = this.imagemAnimacao;
    data['nomeTela'] = this.nomeTela;
    data['repostaAberta'] = this.repostaAberta;
    data['tituloQuestao'] = this.tituloQuestao;
    data['idProximaTelaEstatica'] = this.idProximaTelaEstatica;
    return data;
  }
}

class Gabarito {
  String? idProximaTela;
  String? repostaAberta;

  Gabarito({this.idProximaTela, this.repostaAberta});

  Gabarito.fromJson(Map<String, dynamic> json) {
    idProximaTela = json['idProximaTela'];
    repostaAberta = json['repostaAberta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProximaTela'] = this.idProximaTela;
    data['repostaAberta'] = this.repostaAberta;
    return data;
  }
}
