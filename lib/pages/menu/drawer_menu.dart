import 'package:flutter/material.dart';
import 'package:loterias_caixa/components/buton/button.dart';
import 'package:percent_indicator/percent_indicator.dart';

// ignore: camel_case_types
class drawerMenu extends StatefulWidget {
  const drawerMenu({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _drawerMenu createState() => _drawerMenu();
}

// ignore: camel_case_types
class _drawerMenu extends State<drawerMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return menuDrawer(context);
  }

  Widget menuDrawer(context) {
    return Drawer(
      child: StreamBuilder(
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: const Color.fromARGB(255, 0, 101, 183),
                height: 80,
                margin: const EdgeInsets.only(top: 20),
                child: const Center(
                    child: Text('Resultados Loterias',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
              ),
              ButtonIcon(
                delay: 0.1,
                icon: const Icon(Icons.spa,
                    color: Color.fromARGB(255, 147, 0, 137)),
                text: const Text('Lotofacil'),
                route: '/lotofacil',
                color: const Color.fromARGB(255, 147, 0, 137),
              ),
              ButtonIcon(
                delay: 0.1,
                icon: const Icon(Icons.spa,
                    color: Color.fromARGB(255, 38, 0, 133)),
                text: const Text('Quina'),
                route: '/quina',
                color: const Color.fromARGB(255, 38, 0, 133),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget headerDrawer() {
    Color colorIcon;

    colorIcon = const Color.fromRGBO(136, 167, 198, 1.0);

    return DrawerHeader(
      margin: const EdgeInsets.only(bottom: 0),
      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 16, 60, 95),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 10),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/user.jpg'),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Icon(Icons.workspace_premium,
                            color: colorIcon, size: 15.0),
                      ),
                      const Text(
                        'teste',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          'teste',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width <= 350
                                ? 16
                                : 20,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        child: Row(
                          children: [
                            RichText(
                              text: const TextSpan(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  TextSpan(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                    text: 'ID: ',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 12,
                              width: 2.8,
                              margin: const EdgeInsets.only(right: 8, left: 8),
                              decoration: BoxDecoration(
                                color: Colors.blue[500],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 3),
                                  child: Icon(Icons.location_city,
                                      color: Colors.white, size: 15.0),
                                ),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            overflow: TextOverflow.ellipsis),
                                        text: 'sss',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 8),
                        child: LinearPercentIndicator(
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 10.0,
                          percent: double.parse('0'),
                          center: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 2),
                                child: Icon(Icons.workspace_premium,
                                    color: Colors.black, size: 10.0),
                              ),
                              const Text(
                                're',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          // ignore: deprecated_member_use
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          barRadius: const Radius.circular(10),
                          progressColor: Colors.blue,
                        ),
                      ),
                      const Text(
                        'Próxima semana',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
