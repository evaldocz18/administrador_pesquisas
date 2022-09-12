class TelasObjeto {
  List<Telas>? telas;

  TelasObjeto({this.telas});

  TelasObjeto.fromJson(Map<String, dynamic> json) {
    if (json['telas'] != null) {
      telas = <Telas>[];
      json['telas'].forEach((v) {
        telas!.add(new Telas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(List list) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.telas != null) {
      data['telas'] = this.telas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Telas {
  String? id;
  String? idProximaTelaEstatica;
  String? imagemAnimacao;
  String? imagemDenucia;
  String? imagemDivulgacao;
  String? nomeTela;
  String? resposta;
  String? tituloQuestao;
  List<Perguntas>? perguntas;
  String? repostaAberta;
  String? emailCliente;
  String? nomeCliente;
  String? telefoneCliente;

  Telas(
      {this.id,
      this.idProximaTelaEstatica,
      this.imagemAnimacao,
      this.imagemDenucia,
      this.imagemDivulgacao,
      this.nomeTela,
      this.resposta,
      this.tituloQuestao,
      this.perguntas,
      this.repostaAberta,
      this.emailCliente,
      this.nomeCliente,
      this.telefoneCliente});

  Telas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProximaTelaEstatica = json['idProximaTelaEstatica'];
    imagemAnimacao = json['imagemAnimacao'];
    imagemDenucia = json['imagemDenucia'];
    imagemDivulgacao = json['imagemDivulgacao'];
    nomeTela = json['nomeTela'];
    resposta = json['resposta'];
    tituloQuestao = json['tituloQuestao'];
    if (json['perguntas'] != null) {
      perguntas = <Perguntas>[];
      json['perguntas'].forEach((v) {
        perguntas!.add(new Perguntas.fromJson(v));
      });
    }
    repostaAberta = json['repostaAberta'];
    emailCliente = json['emailCliente'];
    nomeCliente = json['nomeCliente'];
    telefoneCliente = json['telefoneCliente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idProximaTelaEstatica'] = this.idProximaTelaEstatica;
    data['imagemAnimacao'] = this.imagemAnimacao;
    data['imagemDenucia'] = this.imagemDenucia;
    data['imagemDivulgacao'] = this.imagemDivulgacao;
    data['nomeTela'] = this.nomeTela;
    data['resposta'] = this.resposta;
    data['tituloQuestao'] = this.tituloQuestao;
    if (this.perguntas != null) {
      data['perguntas'] = this.perguntas!.map((v) => v.toJson()).toList();
    }
    data['repostaAberta'] = this.repostaAberta;
    data['emailCliente'] = this.emailCliente;
    data['nomeCliente'] = this.nomeCliente;
    data['telefoneCliente'] = this.telefoneCliente;
    return data;
  }
}

class Perguntas {
  bool? prioridadeResposta;
  String? questao;
  bool? state;
  bool? excelente;
  bool? razoavel;
  bool? ruim;

  Perguntas(
      {this.prioridadeResposta,
      this.questao,
      this.state,
      this.excelente,
      this.razoavel,
      this.ruim});

  Perguntas.fromJson(Map<String, dynamic> json) {
    prioridadeResposta = json['prioridadeResposta'];
    questao = json['questao'];
    state = json['state'];
    excelente = json['excelente'];
    razoavel = json['razoavel'];
    ruim = json['ruim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prioridadeResposta'] = this.prioridadeResposta;
    data['questao'] = this.questao;
    data['state'] = this.state;
    data['excelente'] = this.excelente;
    data['razoavel'] = this.razoavel;
    data['ruim'] = this.ruim;
    return data;
  }
}