import 'package:flutter/material.dart';
import 'package:loterias_caixa/pages/home/home_grid.dart';
import 'package:loterias_caixa/pages/menu/drawer_menu.dart';
import 'package:share_plus/share_plus.dart';
import 'package:loterias_caixa/config/global.dart' as globals;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 101, 183),
          title: Container(
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 101, 183),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /* Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      width: 25,
                      height: 25,
                      child: Container(
                          decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/caixa-logo.png'),
                          fit: BoxFit.fill,
                        ),
                      )),
                    )), */
                Expanded(
                  flex: 9,
                  child: Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(left: 5, top: 7),
                    child: const Text('Mega-Sena',
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
                          if (globals.resultadoMegaSenaString != "") {
                            Share.share(globals.resultadoMegaSenaString);
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
      body: const HomeGrid(),
      drawer:
          const drawerMenu(), /*Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 50.00,
            ),
            ListTile(
              leading: Icon(Icons.spa, color: Color.fromARGB(255, 147, 0, 137)),
              title: Text("Lotofacil"),
              onTap: () {
                Navigator.pushNamed(context, '/lotofacil');
              },
            ),
          ],
        ),
      ), */
    );
  }
}
