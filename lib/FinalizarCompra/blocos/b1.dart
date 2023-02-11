import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/Carrinho/page4.dart';
import 'package:gestao_de_caixa/Edicao/page3.dart';
import 'package:gestao_de_caixa/FrenteCaixa/page2.dart';
import 'package:gestao_de_caixa/bancoSqlite/db.dart';
import 'package:gestao_de_caixa/widgets.dart';
import 'package:get/get.dart';

class b1 extends StatelessWidget {
  const b1({super.key});

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Spacer(flex: 20),
              InkWell(
                  onTap: () {
                    Get.offAll(() => Page4());
                  },
                  child: Container(
                      width: 60,
                      height: 60,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff494949),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.5))),
                      child: Image(image: AssetImage('images/image 7.png')))),
              Spacer(flex: 100),
              Align(
                  alignment: Alignment(0, 0),
                  child: Texto(texto: 'Finalizar comrpa', fontsize: 30.0)),
              Spacer(flex: 100),
              InkWell(
                  child: Container(
                width: 60,
                height: 60,
                padding: EdgeInsets.all(15),
              )),
              Spacer(flex: 20),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 30, bottom: 10),
            alignment: Alignment(-0.7, 0),
            child: Texto(texto: 'Produtos', fontsize: 25.0)),
      ],
    );
  }
}
