import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/widgets.dart';

class b4 extends StatelessWidget {
  b4({super.key, this.status = true, @required this.dados});
  var dados;
  bool status = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(children: [
        Align(
            alignment: Alignment(-0.5, 0),
            child: status
                ? Texto(
                    texto: 'Produto ' + 'Encontrado',
                    fontsize: 25.0,
                    cor: Color(0xff5EEAB7))
                : Texto(
                    texto: 'Produto ' + 'não Encontrado',
                    fontsize: 25.0,
                    cor: Colors.red)),
        status
            ? Container(
                margin: EdgeInsets.only(top: 10),
                child: WidgetProduto(
                  dados: dados,
                ),
              )
            : None()
      ]),
    );
  }
}
