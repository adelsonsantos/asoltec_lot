class RateioPremio {
  String descricaoFaixa = '';
  int faixa = 0;
  int numeroDeGanhadores = 0;
  double valorPremio = 0.00;

  RateioPremio(
      {required this.descricaoFaixa,
      required this.faixa,
      required this.numeroDeGanhadores,
      required this.valorPremio});

  RateioPremio.fromJson(Map<String, dynamic> json) {
    descricaoFaixa = json['descricaoFaixa'];
    faixa = json['faixa'];
    numeroDeGanhadores = json['numeroDeGanhadores'];
    valorPremio = json['valorPremio'];
  }
}

class GanhadoresUf {
  int ganhadores = 0;
  String municipio = "";
  String nomeFatansiaUL = "";
  int posicao = 0;
  String serie = "";
  String uf = "";

  GanhadoresUf(
      {required this.ganhadores,
      required this.municipio,
      required this.nomeFatansiaUL,
      required this.posicao,
      required this.serie,
      required this.uf});

  GanhadoresUf.fromJson(Map<String, dynamic> json) {
    ganhadores = json['ganhadores'];
    municipio = json['municipio'];
    nomeFatansiaUL = json['nomeFatansiaUL'];
    posicao = json['posicao'];
    serie = json['serie'];
    uf = json['uf'];
  }
}
