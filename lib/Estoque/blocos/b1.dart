import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/Edicao/page3.dart';
import 'package:gestao_de_caixa/widgets.dart';
import 'package:get/get.dart';

class b1 extends StatelessWidget {
  const b1({super.key});

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      //color: Colors.red,
      child: Row(
        children: [
          Spacer(flex: 20),
          Texto(texto: 'Estoque', fontsize: 30.0),
          Spacer(flex: 100),
          InkWell(
              onTap: () {
                Get.to(() => Page3(),
                    transition: Transition.leftToRightWithFade,
                    duration: Duration(milliseconds: 300));
              },
              child: Container(
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff494949),
                      border: Border.all(color: Colors.white.withOpacity(0.5))),
                  child: Image(image: AssetImage('images/image 2.png')))),
          Spacer(flex: 20),
        ],
      ),
    );
  }
}
