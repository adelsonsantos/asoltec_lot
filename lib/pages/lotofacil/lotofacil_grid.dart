// ignore_for_file: unnecessary_brace_in_string_interps

// ignore: depend_on_referenced_packages
import 'package:google_mobile_ads/google_mobile_ads.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:loterias_caixa/bloc/lotofacil/lotofacil_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loterias_caixa/model/lotofacil_model.dart';
import 'package:loterias_caixa/model/rateio_premio_model.dart';
import 'package:loterias_caixa/pages/lotofacil/lotofacil_loading.dart';
import 'package:loterias_caixa/config/global.dart' as globals;

import 'lotofacil_ultimos_concursos.dart';

class LotofacilGrid extends StatefulWidget {
  const LotofacilGrid({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LotofacilState createState() => _LotofacilState();
}

class _LotofacilState extends State<LotofacilGrid> {
  final LotofacilBloc _lotofacilBloc = LotofacilBloc();
  int concursoFinal = 0;
  late BannerAd bannerAd;
  late BannerAd bannerAd2;

  bool isAdLoaded = false;
  var adUnit = "ca-app-pub-5975954326264248/8588866028";
  //var adUnit = "ca-app-pub-5975954326264248/5432076144";

  bool isAdLoaded2 = false;
  var adUnit2 = "ca-app-pub-5975954326264248/6341976632";
  //var adUnit2 = "ca-app-pub-5975954326264248/5420769170";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _lotofacilBloc.add(GetLotofacilList(concursoFinal));
    });
    initBannerAd();

    initBannerAd2();
  }

  initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: adUnit,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }),
        request: const AdRequest());

    bannerAd.load();
  }

  initBannerAd2() {
    bannerAd2 = BannerAd(
        size: AdSize.banner,
        adUnitId: adUnit2,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            isAdLoaded2 = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }),
        request: const AdRequest());

    bannerAd2.load();
  }

  @override
  Widget build(BuildContext context) {
    const colorThema = Color.fromARGB(255, 147, 0, 137);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 248),
      body: RefreshIndicator(
          onRefresh: () async {
            _lotofacilBloc.add(const GetLotofacilList(0));
            await Future.delayed(const Duration(milliseconds: 10));
          },
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                Container(
                  color: colorThema,
                  child: Container(
                      width: double.infinity,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 250, 250),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(150, 30),
                        ),
                      )),
                ),
                _home(),
              ]))),
    );
    //return Scaffold(body: _home());
  }

  Widget _offline(context, String msgTela) {
    return _corpoOffline(context, msgTela);
  }

  Widget _corpoOffline(context, String msgTela) {
    return Container(
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height * 0.90,
        child: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background_mega_sena.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 30.0, bottom: 20.00),
                      width: double.infinity,
                      child: Center(
                          child: Text(msgTela,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 74, 74, 74),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.00)))),
                ])));
  }

  Widget _home() {
    return BlocProvider(
      create: (_) => _lotofacilBloc,
      child: BlocListener<LotofacilBloc, LotofacilState>(
        listener: (context, state) {
          /*if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }*/
        },
        child: BlocBuilder<LotofacilBloc, LotofacilState>(
          builder: (context, state) {
            if (state is LotofacilInitial) {
              return _buildLoading();
            } else if (state is LotofacilLoading) {
              return _buildLoading();
            } else if (state is LotofacilLoaded) {
              if (concursoFinal == 0) {
                concursoFinal = state.lotofacilModel.numero;
              }

              globals.resultadoLotofacilString =
                  "Lotofácil (${state.lotofacilModel.dataApuracao})  \n\n ${state.lotofacilModel.listaDezenas[0]}   ${state.lotofacilModel.listaDezenas[1]}   ${state.lotofacilModel.listaDezenas[2]}   ${state.lotofacilModel.listaDezenas[3]}   ${state.lotofacilModel.listaDezenas[4]}  \n\n  ${state.lotofacilModel.listaDezenas[5]}    ${state.lotofacilModel.listaDezenas[6]}    ${state.lotofacilModel.listaDezenas[7]}    ${state.lotofacilModel.listaDezenas[8]}    ${state.lotofacilModel.listaDezenas[9]}   \n\n ${state.lotofacilModel.listaDezenas[10]}   ${state.lotofacilModel.listaDezenas[11]}   ${state.lotofacilModel.listaDezenas[12]}   ${state.lotofacilModel.listaDezenas[13]}   ${state.lotofacilModel.listaDezenas[14]} ";
              for (String item in state.lotofacilModel.listaDezenas) {
                globals.resultadoLotofacilString + item;
              }

              //return _buildLoading();
              return _dadosMegasena(state.lotofacilModel);
            } else if (state is HomeError) {
              return _offline(context, state.message);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _rowConcursoSorteio(String label, String valor, IconData icone,
      AlignmentDirectional orientacao, double fontSize) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.only(left: 12.00),
              width: width,
              alignment: orientacao,
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      icone,
                      size: fontSize + 2,
                      color: const Color.fromARGB(255, 140, 140, 140),
                    )),
                    TextSpan(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontWeight: FontWeight.normal,
                          fontSize: 12.00),
                      text: "${label} ${valor}",
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }

  Widget _tituloAzul(String texto) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 15.0),
        padding: const EdgeInsets.all(2.0),
        child: Text(
          texto,
          style: const TextStyle(
              color: Color.fromARGB(255, 0, 101, 183),
              fontWeight: FontWeight.bold,
              fontSize: 23),
        ));
  }

  Widget _rowPremiacao(Lotofacil megasena) {
    var formatter = NumberFormat("#,##0.00", "pt_BR");
    return Column(
      children: [
        isAdLoaded
            ? SizedBox(
                height: bannerAd.size.height.toDouble(),
                width: bannerAd.size.width.toDouble(),
                child: AdWidget(ad: bannerAd),
              )
            : const SizedBox(),
        const Divider(),
        const SizedBox(
          height: 15,
        ),
        _tituloAzul("Premiação"),
        for (var item in megasena.listaRateioPremio) //_circuloResultado(item)
          linhaPremiacao(item),
        _rowDetalhamentoPremiacao(megasena),
        _tituloAzul("Arrecadação total"),
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 15.0),
            padding: const EdgeInsets.all(2.0),
            child: Text(
              formatter.format(megasena.valorArrecadado),
              style: const TextStyle(
                  color: Color.fromARGB(255, 74, 74, 74),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )),
        const SizedBox(
          height: 15,
        ),
        const Divider(),
        isAdLoaded2
            ? SizedBox(
                height: bannerAd2.size.height.toDouble(),
                width: bannerAd2.size.width.toDouble(),
                child: AdWidget(ad: bannerAd2),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget _rowDetalhamentoPremiacao(Lotofacil megasena) {
    return megasena.listaMunicipioUFGanhadores.isNotEmpty
        ? Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              _tituloAzul("Detalhamento"),
              for (var item in megasena.listaMunicipioUFGanhadores)
                linhaGanhadores(item),
              const SizedBox(
                height: 15,
              ),
              const Divider()
            ],
          )
        : Container();
  }

  Widget linhaGanhadores(GanhadoresUf ganhadoresUf) {
    String textoganhadores = "";

    if (ganhadoresUf.ganhadores == 1) {
      textoganhadores = "1 aposta ganhou o prêmio para 6 acertos";
    } else {
      textoganhadores =
          "${ganhadoresUf.ganhadores} ganharam o prêmio para 6 acertos";
    }

    return ganhadoresUf.ganhadores > 0
        ? Column(children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 15.0),
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  ganhadoresUf.municipio,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 74, 74, 74),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 15.0),
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  textoganhadores,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 74, 74, 74),
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                )),
            const SizedBox(
              height: 15,
            ),
          ])
        : Container();
  }

  Widget linhaPremiacao(RateioPremio rateioPremio) {
    String textoganhadores = "";
    var formatter = NumberFormat("#,##0.00", "pt_BR");

    if (rateioPremio.numeroDeGanhadores < 1) {
      textoganhadores = "Não houve ganhadores";
    } else if (rateioPremio.numeroDeGanhadores == 1) {
      textoganhadores =
          "${rateioPremio.faixa} aposta ganhadora, R\$ ${formatter.format(rateioPremio.valorPremio)}";
    } else {
      textoganhadores =
          "${rateioPremio.numeroDeGanhadores} apostas ganhadoras, R\$ ${formatter.format(rateioPremio.valorPremio)}";
    }

    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 15.0),
          padding: const EdgeInsets.all(2.0),
          child: Text(
            rateioPremio.descricaoFaixa,
            style: const TextStyle(
                color: Color.fromARGB(255, 74, 74, 74),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          )),
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 15.0),
          padding: const EdgeInsets.all(2.0),
          child: Text(
            textoganhadores,
            style: const TextStyle(
                color: Color.fromARGB(255, 74, 74, 74),
                fontWeight: FontWeight.normal,
                fontSize: 12),
          )),
      const SizedBox(
        height: 15,
      ),
    ]);
  }

  Widget linhaNegritoComDescricaoEstimativa(String titulo, String descricao) {
    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 15.0),
          padding: const EdgeInsets.all(2.0),
          child: Text(
            titulo,
            style: const TextStyle(
                color: Color.fromARGB(255, 74, 74, 74),
                fontWeight: FontWeight.bold,
                fontSize: 25),
          )),
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 15.0),
          padding: const EdgeInsets.all(2.0),
          child: Text(
            descricao,
            style: const TextStyle(
                color: Color.fromARGB(255, 74, 74, 74),
                fontWeight: FontWeight.normal,
                fontSize: 12),
          )),
      const SizedBox(
        height: 15,
      ),
    ]);
  }

  Widget linhaNegritoComDescricao(String titulo, String descricao) {
    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 15.0),
          padding: const EdgeInsets.all(2.0),
          child: Text(
            titulo,
            style: const TextStyle(
                color: Color.fromARGB(255, 74, 74, 74),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          )),
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 15.0),
          padding: const EdgeInsets.all(2.0),
          child: Text(
            descricao,
            style: const TextStyle(
                color: Color.fromARGB(255, 74, 74, 74),
                fontWeight: FontWeight.normal,
                fontSize: 12),
          )),
      const SizedBox(
        height: 15,
      ),
    ]);
  }

  Widget _rowAcumulados(Lotofacil megasena) {
    var formatter = NumberFormat("#,##0.00", "pt_BR");
    return Column(
      children: [
        linhaNegritoComDescricaoEstimativa(
          "R\$ ${formatter.format(megasena.valorEstimadoProximoConcurso)}",
          "Estimativa de prêmio do próximo concurso ${megasena.dataProximoConcurso}",
        ),
        linhaNegritoComDescricao(
            "R\$ ${formatter.format(megasena.valorAcumuladoConcurso_0_5)}",
            "Acumulado próximo concurso final zero (2980)"),
        linhaNegritoComDescricao(
            "R\$ ${formatter.format(megasena.valorAcumuladoConcursoEspecial)}",
            "Acumulado para Sorteio Especial Mega da Virada"),
      ],
    );
  }

  Widget _circuloResultado(String texto) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(200),
          ),
          color: Color.fromARGB(255, 147, 0, 137),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                texto,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Color getColor() {
    return Colors.blue;
  }

  Widget _dadosMegasena(Lotofacil megasena) {
    List<String> linhaUm = [];
    List<String> linhaDois = [];
    List<String> linhaTres = [];
    for (int i = 0; i < megasena.listaDezenas.length; i++) {
      if (i < 5) {
        linhaUm.add(megasena.listaDezenas[i]);
      } else if (i >= 5 && i < 10) {
        linhaDois.add(megasena.listaDezenas[i]);
      } else {
        linhaTres.add(megasena.listaDezenas[i]);
      }
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      int concursoAnterior = megasena.numero.toInt() - 1;
                      _lotofacilBloc.add(GetLotofacilList(concursoAnterior));
                    },
                    child: const Text('< Anterior',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 101, 183),
                            fontSize: 14)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Center(
                      child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                            child: Icon(
                          Icons.calendar_today,
                          size: 14.00,
                          color: Color.fromARGB(255, 140, 140, 140),
                        )),
                        TextSpan(
                          style: const TextStyle(
                              color: Color.fromARGB(255, 74, 74, 74),
                              fontWeight: FontWeight.normal,
                              fontSize: 14.00),
                          text:
                              " Concurso ${megasena.numero.toString()} (${megasena.dataApuracao})",
                        ),
                      ],
                    ),
                  )),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      int concursoProximo = megasena.numero.toInt() + 1;
                      if (concursoProximo <= concursoFinal) {
                        _lotofacilBloc.add(GetLotofacilList(concursoProximo));
                      }
                    },
                    child: const Text('Próximo >',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 101, 183),
                            fontSize: 14)),
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          _rowValorSorteio(megasena.acumulado),
          _rowConcursoSorteio(
              " Sorteio realizado no ",
              "${megasena.localSorteio} ${megasena.nomeMunicipioUFSorteio}",
              Icons.location_on,
              AlignmentDirectional.centerStart,
              15.00),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [for (var item in linhaUm) _circuloResultado(item)],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [for (var item in linhaDois) _circuloResultado(item)],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [for (var item in linhaTres) _circuloResultado(item)],
          ),
          const SizedBox(
            height: 20.00,
          ),
          _rowAcumulados(megasena),
          const Divider(),
          _rowPremiacao(megasena),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          _tituloAzul("Últimos sorteios"),
          LotofacilUltimosConcursosGrid(concurso: megasena.numero),
          const SizedBox(
            height: 50,
          ),
          Container(
            color: const Color.fromARGB(255, 147, 0, 137),
            child: Container(
                width: double.infinity,
                height: 25,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 250, 250, 250),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(150, 30),
                  ),
                )),
          ),
          Container(
            color: const Color.fromARGB(255, 147, 0, 137),
            height: 30.00,
            child: Container(),
          )
        ]);
  }

  Widget _rowValorSorteio(bool acumulou) {
    return acumulou == true
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin:
                      const EdgeInsets.only(top: 5.00, left: 20.00, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    (acumulou == true ? "Acumulou!" : ""),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 101, 183),
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ),
              )
            ],
          )
        : Container();
  }

  Widget _buildLoading() => buildMovieShimmer();

  Widget buildMovieShimmer() => const LotofacilLoadong();
}
