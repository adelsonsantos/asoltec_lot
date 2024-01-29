import 'package:dio/dio.dart';
import 'package:loterias_caixa/model/mega_sena_model.dart';
import 'package:loterias_caixa/model/lotofacil_model.dart';
import 'package:loterias_caixa/model/quina_model.dart';
import 'package:loterias_caixa/model/lotomania_model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  final baseUrl = "http://servicebus2.caixa.gov.br/portaldeloterias/api";

  Options headerApi = Options(headers: <String, String>{
    //'content-type': 'application/json',
  });

  Future<Megasena> getResultadoMegaSena(int concurso) async {
    String rota =
        concurso > 0 ? "$baseUrl/megasena/$concurso" : "$baseUrl/megasena/";
    try {
      Response response = await _dio.get(rota, options: headerApi);
      return Megasena.fromJson(response.data);
    } catch (error) {
      return Megasena.withError("Por favor tente novamente mais tarde.");
    }
  }

  Future<Lotofacil> getResultadoLotofacil(int concurso) async {
    String rota =
        concurso > 0 ? "$baseUrl/lotofacil/$concurso" : "$baseUrl/lotofacil/";
    try {
      Response response = await _dio.get(rota, options: headerApi);
      return Lotofacil.fromJson(response.data);
    } catch (error) {
      return Lotofacil.withError("Por favor tente novamente mais tarde.");
    }
  }

  Future<Quina> getResultadoQuina(int concurso) async {
    String rota = concurso > 0 ? "$baseUrl/quina/$concurso" : "$baseUrl/quina/";
    try {
      Response response = await _dio.get(rota, options: headerApi);
      return Quina.fromJson(response.data);
    } catch (error) {
      return Quina.withError("Por favor tente novamente mais tarde.");
    }
  }

  Future<Lotomania> getResultadoLotomania(int concurso) async {
    String rota =
        concurso > 0 ? "$baseUrl/lotomania/$concurso" : "$baseUrl/lotomania/";
    try {
      Response response = await _dio.get(rota, options: headerApi);
      return Lotomania.fromJson(response.data);
    } catch (error) {
      return Lotomania.withError("Por favor tente novamente mais tarde.");
    }
  }
}
