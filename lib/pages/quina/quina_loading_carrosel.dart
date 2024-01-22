import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardLoading extends StatelessWidget {
  const CardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 224, 224, 224),
      highlightColor: const Color.fromARGB(255, 245, 245, 245),
      child: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    width: 10,
                    height: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Color.fromARGB(255, 250, 250, 250),
                    )),
              ),
              Expanded(
                  flex: 12,
                  child: Container(
                      width: 200,
                      height: 180,
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 15.00, right: 15.00),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 250, 250, 250),
                      ))),
              Expanded(
                flex: 1,
                child: Container(
                    width: 10,
                    height: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      color: Color.fromARGB(255, 250, 250, 250),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
