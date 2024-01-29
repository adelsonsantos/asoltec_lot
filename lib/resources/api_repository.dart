import 'api_provider.dart';
import 'package:loterias_caixa/model/mega_sena_model.dart';
import 'package:loterias_caixa/model/lotofacil_model.dart';
import 'package:loterias_caixa/model/quina_model.dart';
import 'package:loterias_caixa/model/lotomania_model.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<Megasena> getResultadoMegaSena(int concurso) {
    return _provider.getResultadoMegaSena(concurso);
  }

  Future<Lotofacil> getResultadoLotofacil(int concurso) {
    return _provider.getResultadoLotofacil(concurso);
  }

  Future<Quina> getResultadoQuina(int concurso) {
    return _provider.getResultadoQuina(concurso);
  }

  Future<Lotomania> getResultadoLotomania(int concurso) {
    return _provider.getResultadoLotomania(concurso);
  }
}

class NetworkError extends Error {}
