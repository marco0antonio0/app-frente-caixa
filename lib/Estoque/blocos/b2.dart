import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/Estoque/page1.dart';
import 'package:gestao_de_caixa/FrenteCaixa/page2.dart';
import 'package:gestao_de_caixa/widgets.dart';
import 'package:get/get.dart';

class b2 extends StatelessWidget {
  const b2({super.key});

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    double largura_btn = (largura / 2) - 30;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Buttom_Personalizado(
              status: true,
              texto: 'Estoque',
              largura_btn: largura_btn,
            ),
          ),
          InkWell(
            onTap: () => Get.off(() => Page2(),
                transition: Transition.leftToRightWithFade,
                duration: Duration(milliseconds: 300)),
            child: Buttom_Personalizado(
              status: false,
              texto: 'Frente de caixa',
              largura_btn: largura_btn,
            ),
          ),
        ],
      ),
    );
  }
}
