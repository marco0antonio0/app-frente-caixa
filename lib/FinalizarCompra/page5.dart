import 'package:flutter/material.dart';

import 'package:gestao_de_caixa/FinalizarCompra/blocos/b3.dart';
import 'package:gestao_de_caixa/FinalizarCompra/blocos/b4.dart';
import 'package:gestao_de_caixa/Frentecaixa/page2.dart';
import 'package:get/get.dart';
import 'blocos/b1.dart';

class FinalizarCompra extends StatefulWidget {
  FinalizarCompra({super.key, this.valorTotal});
  var valorTotal;

  @override
  State<FinalizarCompra> createState() =>
      _FinalizarCompraState(this.valorTotal);
}

class _FinalizarCompraState extends State<FinalizarCompra> {
  _FinalizarCompraState(this.valorTotal);
  var valorTotal;
  @override
  Widget build(BuildContext context) {
    double largura = (MediaQuery.of(context).size.width);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff272530),
          body: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: largura > 600 ? 500 : largura,
                child: Column(
                  children: [
                    b1(),
                    b3(
                      valorTotal: valorTotal,
                    ),
                    b4()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
