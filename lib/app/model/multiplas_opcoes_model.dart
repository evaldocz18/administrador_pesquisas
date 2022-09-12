class MultiplasOpcoes {
  String? id;
  List<Gabarito>? gabarito;
  String? imagemAnimacao;
  String? nomeTela;
  List<PerguntasBinarias>? perguntas;
  String? tituloQuestao;
  String? idProximaTelaEstatica;

  MultiplasOpcoes(
      {this.id,
      this.gabarito,
      this.imagemAnimacao,
      this.nomeTela,
      this.perguntas,
      this.tituloQuestao,
      this.idProximaTelaEstatica});

  MultiplasOpcoes.fromJson(Map<String, dynamic> json) {
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
      perguntas = <PerguntasBinarias>[];
      json['perguntas'].forEach((v) {
        perguntas!.add(new PerguntasBinarias.fromJson(v));
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

class PerguntasBinarias {
  bool? prioridadeResposta;
  String? questao;
  bool? state;

  PerguntasBinarias({this.prioridadeResposta, this.questao, this.state});

  PerguntasBinarias.fromJson(Map<String, dynamic> json) {
    prioridadeResposta = json['prioridadeResposta'];
    questao = json['questao'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prioridadeResposta'] = this.prioridadeResposta;
    data['questao'] = this.questao;
    data['state'] = this.state;
    return data;
  }
}
