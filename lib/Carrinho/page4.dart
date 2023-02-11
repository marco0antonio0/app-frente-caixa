import 'package:flutter/material.dart';

import 'package:gestao_de_caixa/Carrinho/blocos/b3.dart';
import 'package:gestao_de_caixa/Carrinho/blocos/b4.dart';
import 'package:gestao_de_caixa/Frentecaixa/page2.dart';
import 'package:get/get.dart';
import 'blocos/b1.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => Page2());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff272530),
          body: Center(
            child: SizedBox(
              width: largura > 600 ? 500 : largura,
              child: Column(
                children: [b1(), b3(), b4()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
