import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:loterias_caixa/pages/home/home_page.dart';
import 'package:loterias_caixa/pages/lotofacil/lotofacil_page.dart';
import 'package:loterias_caixa/pages/quina/quina_page.dart';
import 'package:loterias_caixa/pages/lotomania/lotomania_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      initialRoute: 'megasena',
      routes: <String, WidgetBuilder>{
        '/megasena': (BuildContext context) => const HomePage(),
        '/lotofacil': (BuildContext context) => const LotofacilPage(),
        '/quina': (BuildContext context) => const QuinaPage(),
        '/lotomania': (BuildContext context) => const LotomaniaPage()
      },
      // home: const LotofacilPage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
