class RespostaAbertaContato {
  String? id;
  String? idProximaTelaEstatica;
  String? imagemAnimacao;
  String? nomeTela;
  String? repostaAberta;
  String? tituloQuestao;
  String? nomeCliente;
  String? telefoneCliente;
  String? emailCliente;

  RespostaAbertaContato(
      {this.id,
      this.idProximaTelaEstatica,
      this.imagemAnimacao,
      this.nomeTela,
      this.repostaAberta,
      this.tituloQuestao,
      this.nomeCliente,
      this.telefoneCliente,
      this.emailCliente});

  RespostaAbertaContato.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProximaTelaEstatica = json['idProximaTelaEstatica'];
    imagemAnimacao = json['imagemAnimacao'];
    nomeTela = json['nomeTela'];
    repostaAberta = json['repostaAberta'];
    tituloQuestao = json['tituloQuestao'];
    nomeCliente = json['nomeCliente'];
    telefoneCliente = json['telefoneCliente'];
    emailCliente = json['emailCliente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idProximaTelaEstatica'] = this.idProximaTelaEstatica;
    data['imagemAnimacao'] = this.imagemAnimacao;
    data['nomeTela'] = this.nomeTela;
    data['repostaAberta'] = this.repostaAberta;
    data['tituloQuestao'] = this.tituloQuestao;
    data['nomeCliente'] = this.nomeCliente;
    data['telefoneCliente'] = this.telefoneCliente;
    data['emailCliente'] = this.emailCliente;
    return data;
  }
}
