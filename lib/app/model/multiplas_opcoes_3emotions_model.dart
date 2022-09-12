class MultiplasOpcoes3emotions {
  String? id;
  List<Gabarito>? gabarito;
  String? imagemAnimacao;
  String? nomeTela;
  List<PerguntasEmotions>? perguntas;
  String? tituloQuestao;
  String? idProximaTelaEstatica;

  MultiplasOpcoes3emotions(
      {this.id,
      this.gabarito,
      this.imagemAnimacao,
      this.nomeTela,
      this.perguntas,
      this.tituloQuestao,
      this.idProximaTelaEstatica});

  MultiplasOpcoes3emotions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['gabarito'] != null) {
      gabarito = <Gabarito>[];
      json['gabarito'].forEach((v) {
        gabarito!.add(new Gabarito.fromJson(v));
      });
    }
    imagemAnimacao = json['imagemAnimacao'];
    nomeTela = json['nomeTela'];
    if (json['perguntas'] != null) {
      perguntas = <PerguntasEmotions>[];
      json['perguntas'].forEach((v) {
        perguntas!.add(new PerguntasEmotions.fromJson(v));
      });
    }
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
    if (this.perguntas != null) {
      data['perguntas'] = this.perguntas!.map((v) => v.toJson()).toList();
    }
    data['tituloQuestao'] = this.tituloQuestao;
    data['idProximaTelaEstatica'] = this.idProximaTelaEstatica;
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

class PerguntasEmotions {
  bool? excelente;
  String? questao;
  bool? razoavel;
  bool? pessimo;

  PerguntasEmotions(
      {this.excelente, this.questao, this.razoavel, this.pessimo});

  PerguntasEmotions.fromJson(Map<String, dynamic> json) {
    excelente = json['excelente'];
    questao = json['questao'];
    razoavel = json['razoavel'];
    pessimo = json['ruim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['excelente'] = this.excelente;
    data['questao'] = this.questao;
    data['razoavel'] = this.razoavel;
    data['ruim'] = this.pessimo;
    return data;
  }
}
