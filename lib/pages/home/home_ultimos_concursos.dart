// ignore_for_file: unnecessary_brace_in_string_interps
import 'package:carousel_slider/carousel_slider.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loterias_caixa/bloc/home/home_bloc.dart';
import 'package:loterias_caixa/bloc/home_ultimos_concursos/home_ultimos_concursos_bloc.dart';
import 'package:loterias_caixa/model/mega_sena_model.dart';
import 'package:loterias_caixa/pages/home/home_loading_carrosel.dart';

class UltimosConcursosGrid extends StatefulWidget {
  final int concurso;
  final String tipoJogo;
  const UltimosConcursosGrid(
      {super.key, required this.concurso, required this.tipoJogo});

  @override
  // ignore: library_private_types_in_public_api
  _UltimosConcursosGridState createState() =>
      // ignore: no_logic_in_create_state
      _UltimosConcursosGridState(concurso, tipoJogo);
}

class _UltimosConcursosGridState extends State<UltimosConcursosGrid> {
  final int concurso;
  final String tipoJogo;
  _UltimosConcursosGridState(this.concurso, this.tipoJogo);

  final HomeUltimosConcursosBloc _homeUltimosConcursosBloc =
      HomeUltimosConcursosBloc();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      // ignore: prefer_const_constructors
      if (tipoJogo == 'megasena') {
        _homeUltimosConcursosBloc.add(GetMegaSenaAnteriorList(concurso));
      }

      if (tipoJogo == 'lotofacil') {
        _homeUltimosConcursosBloc.add(GetLotofacilAnteriorList(concurso));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _financeiro();
  }

  Widget _financeiro() {
    return BlocProvider(
      create: (_) => _homeUltimosConcursosBloc,
      child: BlocListener<HomeUltimosConcursosBloc, HomeUltimosConcursosState>(
        listener: (context, state) {
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(""),
              ),
            );
          }
        },
        child: BlocBuilder<HomeUltimosConcursosBloc, HomeUltimosConcursosState>(
          builder: (context, state) {
            if (state is Initial) {
              return _buildLoading();
            } else if (state is Loading) {
              return _buildLoading();
            } else if (state is Loaded) {
              //return _buildLoading();
              return _buildCard(context, state.megaSenaModel);
            } else if (state is Error) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, List<Megasena> model) {
    return CarouselSlider(
      options: CarouselOptions(
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.decelerate,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal),
      items: model.map((item) => _cardFinalizarEntrega(item)).toList(),
    );
  }

  Widget _buildLoading() => const Center(child: CardLoading());

  Widget _circuloAnteriores(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 10.00),
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(200),
        ),
        color: Color.fromARGB(255, 32, 152, 105),
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal),
        textAlign: TextAlign.center,
      )),
    );
  }

  Decoration _decoratorCard() {
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Color.fromARGB(255, 250, 250, 250),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 186, 186, 186),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 3),
        ),
      ],
    );
  }

  Widget _cardFinalizarEntrega(Megasena megasena) {
    var formatter = NumberFormat("#,##0.00", "pt_BR");
    return Container(
        alignment: Alignment.center,
        decoration: _decoratorCard(),
        margin: const EdgeInsets.only(top: 10.0, bottom: 20.00),
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var item in megasena.listaDezenas)
                    _circuloAnteriores(item)
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.only(left: 15.00),
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                                child: Icon(
                              Icons.calendar_today,
                              size: 16.00,
                              color: Color.fromARGB(255, 140, 140, 140),
                            )),
                            TextSpan(
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 74, 74, 74),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.00),
                              text:
                                  "  ${megasena.dataApuracao} - Concurso ${megasena.numero}",
                            )
                          ],
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.only(left: 15.00),
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                                child: Icon(
                              Icons.monetization_on,
                              size: 16.00,
                              color: Color.fromARGB(255, 140, 140, 140),
                            )),
                            TextSpan(
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 74, 74, 74),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13.00),
                              text: (megasena.acumulado == true
                                  ? "  Não houve ganhadores"
                                  : "${megasena.listaRateioPremio[0].numeroDeGanhadores > 1 ? "  ${megasena.listaRateioPremio[0].numeroDeGanhadores} apostas ganhadoras, " : "  ${megasena.listaRateioPremio[0].numeroDeGanhadores} aposta ganhadora, "}R\$ ${formatter.format(megasena.listaRateioPremio[0].valorPremio)}"),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(GetMegaSenaList(megasena.numero));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(2),
                          margin:
                              const EdgeInsets.only(left: 15.00, bottom: 5.00),
                          alignment: Alignment.center,
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.search,
                                  size: 14.00,
                                  color: Color.fromARGB(255, 32, 152, 105),
                                )),
                                TextSpan(
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 32, 152, 105),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.00),
                                  text: "  Mais detalhes ",
                                ),
                              ],
                            ),
                          )))
                ],
              )
            ]));
  }
}
