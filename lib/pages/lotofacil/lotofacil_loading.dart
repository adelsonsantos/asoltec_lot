import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LotofacilLoadong extends StatelessWidget {
  const LotofacilLoadong({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 224, 224, 224),
      highlightColor: const Color.fromARGB(255, 245, 245, 245),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              margin:
                  const EdgeInsets.only(left: 15.00, right: 15.00, top: 5.00),
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 250, 250, 250),
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 120,
                  height: 40,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15.00),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 250, 250, 250),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _circuloResultado(""),
              _circuloResultado(""),
              _circuloResultado(""),
              _circuloResultado(""),
              _circuloResultado(""),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _circuloResultado(""),
              _circuloResultado(""),
              _circuloResultado(""),
              _circuloResultado(""),
              _circuloResultado(""),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _circuloResultado(""),
              _circuloResultado(""),
              _circuloResultado(""),
              _circuloResultado(""),
              _circuloResultado(""),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              margin:
                  const EdgeInsets.only(left: 15.00, right: 15.00, top: 5.00),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 250, 250, 250),
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
              margin:
                  const EdgeInsets.only(left: 15.00, right: 15.00, top: 5.00),
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 250, 250, 250),
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
              margin:
                  const EdgeInsets.only(left: 15.00, right: 15.00, top: 5.00),
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 250, 250, 250),
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 120,
                  height: 40,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15.00),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 250, 250, 250),
                  ))
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 200,
                  height: 35,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15.00),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 250, 250, 250),
                  ))
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 200,
                  height: 35,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15.00),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 250, 250, 250),
                  ))
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 200,
                  height: 35,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15.00),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 250, 250, 250),
                  ))
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 200,
                  height: 35,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15.00),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 250, 250, 250),
                  ))
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 200,
                  height: 35,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15.00),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 250, 250, 250),
                  ))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 150,
                  height: 40,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15.00),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 250, 250, 250),
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              margin:
                  const EdgeInsets.only(left: 15.00, right: 15.00, top: 5.00),
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 250, 250, 250),
              )),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 150,
                  height: 40,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15.00),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 250, 250, 250),
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              margin:
                  const EdgeInsets.only(left: 15.00, right: 15.00, top: 5.00),
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 250, 250, 250),
              )),
          const SizedBox(
            height: 50,
          ),
        ],
      )),
    );
  }

  Widget _circuloResultado(String texto) {
    return Center(
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(200),
          ),
          color: Color.fromARGB(255, 32, 152, 105),
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
}
