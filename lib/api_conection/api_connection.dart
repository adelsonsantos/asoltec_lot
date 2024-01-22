import 'package:dio/dio.dart';

const baseUrl = "https://servicebus2.caixa.gov.br/portaldeloterias/api/";

Options headerApi = Options(headers: <String, String>{
  'accept':
      'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7'
});
