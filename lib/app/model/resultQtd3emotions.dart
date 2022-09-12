class ResultadoQtd3Emotions {
  String? questao;
  String? qtdPessimo;
  String? qtdRazoavel;
  String? qtdExcelente;

  ResultadoQtd3Emotions(
      {this.questao, this.qtdPessimo, this.qtdRazoavel, this.qtdExcelente});

  ResultadoQtd3Emotions.fromJson(Map<String, dynamic> json) {
    questao = json['questao'];
    qtdPessimo = json['qtdPessimo'];
    qtdRazoavel = json['qtdRazoavel'];
    qtdExcelente = json['qtdExcelente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questao'] = this.questao;
    data['qtdPessimo'] = this.qtdPessimo;
    data['qtdRazoavel'] = this.qtdRazoavel;
    data['qtdExcelente'] = this.qtdExcelente;
    return data;
  }
}
