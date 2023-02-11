import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/widgets.dart';

class b1 extends StatelessWidget {
  const b1({super.key});

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    return SizedBox(
      width: largura > 600 ? 500 : largura,
      height: 100,
      //color: Colors.red,
      child: Row(
        children: [
          Spacer(flex: 20),
          Texto(texto: 'Frente de caixa', fontsize: 30.0),
          Spacer(flex: 100),
        ],
      ),
    );
  }
}
