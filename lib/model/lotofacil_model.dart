import 'package:loterias_caixa/model/rateio_premio_model.dart';

class LotofacilModel {
  List<Lotofacil> lotofacil = [];
  String date = '';
  String error = '';

  LotofacilModel({required this.lotofacil});

  LotofacilModel.withError(errorMessage) {
    error = errorMessage;
  }

  LotofacilModel.fromJsonn(List<dynamic> json) {
    lotofacil = [];
    for (var v in json) {
      lotofacil.add(Lotofacil.fromJson(v));
    }
  }
}

class Lotofacil {
  bool acumulado = true;
  String dataApuracao = '';
  String dataProximoConcurso = '';
  bool exibirDetalhamentoPorCidade = false;
  int indicadorConcursoEspecial = 0;
  List<String> listaDezenas = [];
  List<GanhadoresUf> listaMunicipioUFGanhadores = [];
  List<RateioPremio> listaRateioPremio = [];
  String localSorteio = '';
  String nomeMunicipioUFSorteio = '';
  int numero = 0;
  int numeroConcursoFinal_0_5 = 0;
  double valorAcumuladoConcurso_0_5 = 0;
  int numeroConcursoAnterior = 0;
  int numeroConcursoProximo = 0;
  int numeroJogo = 0;
  String observacao = '';
  String tipoJogo = '';
  bool ultimoConcurso = true;
  double valorArrecadado = 0.00;
  double valorAcumuladoConcursoEspecial = 0.00;
  double valorAcumuladoProximoConcurso = 0.00;
  double valorEstimadoProximoConcurso = 0.00;
  double valorSaldoReservaGarantidora = 0.00;
  double valorTotalPremioFaixaUm = 0.00;
  String error = '';

  Lotofacil(
      {required this.acumulado,
      required this.dataApuracao,
      required this.dataProximoConcurso,
      required this.exibirDetalhamentoPorCidade,
      required this.indicadorConcursoEspecial,
      required this.listaDezenas,
      required this.listaMunicipioUFGanhadores,
      required this.numeroConcursoFinal_0_5,
      required this.valorAcumuladoConcurso_0_5,
      required this.listaRateioPremio,
      required this.localSorteio,
      required this.nomeMunicipioUFSorteio,
      required this.numero,
      required this.numeroConcursoAnterior,
      required this.numeroConcursoProximo,
      required this.numeroJogo,
      required this.observacao,
      required this.tipoJogo,
      required this.ultimoConcurso,
      required this.valorArrecadado,
      required this.valorAcumuladoConcursoEspecial,
      required this.valorEstimadoProximoConcurso,
      required this.valorSaldoReservaGarantidora,
      required this.valorTotalPremioFaixaUm});

  Lotofacil.fromJson(Map<String, dynamic> json) {
    acumulado = json['acumulado'];
    dataApuracao = json['dataApuracao'];
    dataProximoConcurso = json['dataProximoConcurso'];
    exibirDetalhamentoPorCidade = json['exibirDetalhamentoPorCidade'];
    indicadorConcursoEspecial = json['indicadorConcursoEspecial'];
    for (var item in json['listaDezenas']) {
      listaDezenas.add(item.toString());
    }
    for (var item in json['listaMunicipioUFGanhadores']) {
      listaMunicipioUFGanhadores.add(GanhadoresUf.fromJson(item));
    }
    for (var item in json['listaRateioPremio']) {
      listaRateioPremio.add(RateioPremio.fromJson(item));
    }
    localSorteio = json['localSorteio'];
    nomeMunicipioUFSorteio = json['nomeMunicipioUFSorteio'];
    numero = json['numero'];
    numeroConcursoAnterior = json['numeroConcursoAnterior'];
    numeroConcursoProximo = json['numeroConcursoProximo'];
    numeroJogo = json['numeroJogo'];
    observacao = json['observacao'];
    tipoJogo = json['tipoJogo'];
    ultimoConcurso = json['ultimoConcurso'];
    valorArrecadado = json['valorArrecadado'];
    numeroConcursoFinal_0_5 = json['numeroConcursoFinal_0_5'];
    valorAcumuladoConcurso_0_5 = json['valorAcumuladoConcurso_0_5'];
    valorAcumuladoProximoConcurso = json['valorAcumuladoProximoConcurso'];
    valorAcumuladoConcursoEspecial = json['valorAcumuladoConcursoEspecial'];
    valorEstimadoProximoConcurso = json['valorEstimadoProximoConcurso'];
    valorSaldoReservaGarantidora = json['valorSaldoReservaGarantidora'];
    valorTotalPremioFaixaUm = json['valorTotalPremioFaixaUm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['acumulado'] = acumulado;
    data['dataApuracao'] = dataApuracao;
    data['dataProximoConcurso'] = dataProximoConcurso;
    data['exibirDetalhamentoPorCidade'] = exibirDetalhamentoPorCidade;
    data['indicadorConcursoEspecial'] = indicadorConcursoEspecial;
    data['listaDezenas'] = listaDezenas;
    data['listaMunicipioUFGanhadores'] = listaMunicipioUFGanhadores;
    data['listaRateioPremio'] = listaRateioPremio;
    data['localSorteio'] = localSorteio;
    data['nomeMunicipioUFSorteio'] = nomeMunicipioUFSorteio;
    data['numero'] = numero;
    data['numeroConcursoAnterior'] = numeroConcursoAnterior;
    data['numeroConcursoProximo'] = numeroConcursoProximo;
    data['numeroJogo'] = numeroJogo;
    data['observacao'] = observacao;
    data['tipoJogo'] = tipoJogo;
    data['ultimoConcurso'] = ultimoConcurso;
    data['valorArrecadado'] = valorArrecadado;
    data['valorAcumuladoConcursoEspecial'] = valorAcumuladoConcursoEspecial;
    data['valorEstimadoProximoConcurso'] = valorEstimadoProximoConcurso;
    data['valorSaldoReservaGarantidora'] = valorSaldoReservaGarantidora;
    data['valorTotalPremioFaixaUm'] = valorTotalPremioFaixaUm;

    return data;
  }

  Lotofacil.withError(errorMessage) {
    error = errorMessage;
  }
}
