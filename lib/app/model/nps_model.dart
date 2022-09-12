class Nps {
  String? id;
  String? data;
  String? idProximaTelaEstatica;
  List<Gabarito>? gabarito;
  String? imagemAnimacao;
  String? imagemDenucia;
  String? imagemDivulgacao;
  String? resposta;
  String? tituloQuestao;
  String? nomeTela;

  Nps(
      {this.id,
      this.data,
      this.idProximaTelaEstatica,
      this.gabarito,
      this.imagemAnimacao,
      this.imagemDenucia,
      this.imagemDivulgacao,
      this.resposta,
      this.tituloQuestao,
      this.nomeTela});

  Nps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['gabarito'] != null) {
      gabarito = <Gabarito>[];
      json['gabarito'].forEach((v) {
        gabarito!.add(new Gabarito.fromJson(v));
      });
    }
    id = json['id'];
    data = json['data'];
    idProximaTelaEstatica = json['idProximaTelaEstatica'];
    imagemAnimacao = json['imagemAnimacao'];
    imagemDenucia = json['imagemDenucia'];
    imagemDivulgacao = json['imagemDivulgacao'];
    resposta = json['resposta'];
    tituloQuestao = json['tituloQuestao'];
    nomeTela = json['nomeTela'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.gabarito != null) {
      data['gabarito'] = this.gabarito!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['data'] = this.data;
    data['idProximaTelaEstatica'] = this.idProximaTelaEstatica;
    data['imagemAnimacao'] = this.imagemAnimacao;
    data['imagemDenucia'] = this.imagemDenucia;
    data['imagemDivulgacao'] = this.imagemDivulgacao;
    data['resposta'] = this.resposta;
    data['tituloQuestao'] = this.tituloQuestao;
    data['nomeTela'] = this.nomeTela;
    return data;
  }
}

class Gabarito {
  String? idProximaTela;
  String? resposta;

  Gabarito({this.idProximaTela, this.resposta});

  Gabarito.fromJson(Map<String, dynamic> json) {
    idProximaTela = json['idProximaTela'];
    resposta = json['resposta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProximaTela'] = this.idProximaTela;
    data['resposta'] = this.resposta;
    return data;
  }
}
