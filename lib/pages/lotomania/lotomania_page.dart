import 'package:flutter/material.dart';
import 'package:loterias_caixa/pages/lotomania/lotomania_grid.dart';
import 'package:share_plus/share_plus.dart';
import 'package:loterias_caixa/config/global.dart' as globals;

class LotomaniaPage extends StatelessWidget {
  const LotomaniaPage({super.key});

  @override
  Widget build(BuildContext context) {
    const colorThema = Color.fromARGB(255, 247, 139, 0);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: colorThema,
          title: Container(
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              color: colorThema,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(left: 5, top: 7),
                    child: const Text('Lotomania',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      alignment: AlignmentDirectional.centerEnd,
                      margin: const EdgeInsets.only(left: 5, top: 7, right: 5),
                      child: IconButton(
                        icon: const Icon(Icons.share),
                        tooltip: 'Increase volume by 10',
                        onPressed: () {
                          if (globals.resultadoLotomaniaString != "") {
                            Share.share(globals.resultadoLotomaniaString);
                          }
                        },
                      )),
                ),
              ],
            ),
          ),
          elevation: 0,
        ),
      ),
      body: const LotomaniaGrid(),
    );
  }
}
