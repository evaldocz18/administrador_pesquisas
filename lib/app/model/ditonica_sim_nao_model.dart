class DitonicaSimNao {
  String? id;
  String? nomeTela;
  String? imagemAnimacao;
  String? tituloQuestao;
  String? resposta;
  List<Gabarito>? caixaSelecaoGabarito;

  DitonicaSimNao({
    this.id,
    this.nomeTela,
    this.imagemAnimacao,
    this.tituloQuestao,
    this.resposta,
    this.caixaSelecaoGabarito,
  });
}

class Gabarito {
  String idProximaTela;
  String resposta;

  Gabarito(this.resposta, this.idProximaTela);
}
