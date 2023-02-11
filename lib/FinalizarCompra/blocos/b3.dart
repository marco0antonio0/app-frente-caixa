import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/Edicao/page3.dart';
import 'package:gestao_de_caixa/FrenteCaixa/blocos/b3.dart';
import 'package:gestao_de_caixa/bancoSqlite/db.dart';
import 'package:gestao_de_caixa/widgets.dart';
import 'package:get/get.dart';

class b3 extends StatefulWidget {
  b3({super.key, this.valorTotal});
  var valorTotal;
  @override
  State<b3> createState() => _b3State(this.valorTotal);
}

class _b3State extends State<b3> {
  _b3State(this.total);
  var total;
  TextEditingController controller = TextEditingController(text: '0.0');
  @override
  Widget build(BuildContext context) {
    double altura = (MediaQuery.of(context).size.height);
    double largura = (MediaQuery.of(context).size.width);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Flexible(
          child: Column(
        children: [
          //========================
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 10),
              child:
                  Texto(texto: 'Total da compra: ' + '$total', fontsize: 30.0)),
          //========================
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Texto(
                  texto: total > double.parse(controller.text)
                      ? 'Valor recebido insuficiente para pagar as compras'
                      : total == double.parse(controller.text)
                          ? 'Valor recebido certinho'
                          : 'Troco: ' +
                              '${double.parse(controller.text) - total}',
                  fontsize: 30.0)),
          //========================
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: WidgetTextInput(
              controller: controller,
              texto: 'Digite o valor recebido do cliente',
              tipoDeTeclado: TextInputType.number,
            ),
          ),
        ],
      )),
    );
  }
}
