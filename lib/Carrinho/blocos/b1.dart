import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/Edicao/page3.dart';
import 'package:gestao_de_caixa/FrenteCaixa/page2.dart';
import 'package:gestao_de_caixa/bancoSqlite/db.dart';
import 'package:gestao_de_caixa/widgets.dart';
import 'package:get/get.dart';

Db_banco banco = Db_banco.instance;

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
                    Get.off(() => Page2());
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
                  child: Texto(texto: 'Carrinho', fontsize: 30.0)),
              Spacer(flex: 100),
              InkWell(
                  onTap: () {
                    banco.deletetable(table: 'carrinho');
                    Get.offAll(() => Page2());
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
                      child: Image(image: AssetImage('images/image 6.png')))),
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
