import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/Edicao/page3.dart';
import 'package:gestao_de_caixa/bancoSqlite/db.dart';
import 'package:gestao_de_caixa/widgets.dart';
import 'package:get/get.dart';

class b3 extends StatefulWidget {
  b3({super.key});

  @override
  State<b3> createState() => _b3State();
}

class _b3State extends State<b3> {
  Db_banco banco = Db_banco.instance;

  @override
  Widget build(BuildContext context) {
    double altura = (MediaQuery.of(context).size.height);
    double largura = (MediaQuery.of(context).size.width);
    return FutureBuilder(
        future: banco.Select_all(table: 'carrinho'),
        builder: (context, snapshot) {
          final state = snapshot.connectionState;
          var dados = snapshot.data;
          if (state == ConnectionState.done) {
            return Flexible(
              child: Container(
                width: largura,
                child: ListView.builder(
                    itemCount: dados!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return WidgetProduto2(
                        dados: dados[index],
                        qtds: int.parse(dados[index]['qtds']),
                      );
                    }),
              ),
            );
          } else {
            return None();
          }
        });
  }
}
