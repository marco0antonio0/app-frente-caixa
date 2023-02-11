import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gestao_de_caixa/bancoSqlite/db.dart';
import 'package:gestao_de_caixa/widgets.dart';

class b4 extends StatelessWidget {
  const b4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(top: 20),
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xff5EEAB7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Texto(texto: 'Salvar os\ndados'),
          Container(
              margin: EdgeInsets.only(left: 10),
              child: Image(image: AssetImage('images/image 5.png'), width: 60))
        ],
      ),
    );
  }
}
