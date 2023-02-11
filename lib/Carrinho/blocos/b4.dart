import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gestao_de_caixa/FinalizarCompra/page5.dart';
import 'package:gestao_de_caixa/bancoSqlite/db.dart';
import 'package:gestao_de_caixa/widgets.dart';
import 'package:get/get.dart';

class b4 extends StatelessWidget {
  b4({super.key});
  Db_banco banco = Db_banco.instance;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var dados = await banco.Select_all(table: 'carrinho');
        double total = 0;
        int count = dados.length;
        if (count > 0) {
          for (int i = 0; count > i; i++) {
            double v = double.parse(dados[i]['valor']);
            double q = double.parse(dados[i]['qtds']);
            double totalproduto = v * q;
            total += totalproduto;
          }
          Get.offAll(() => FinalizarCompra(
                valorTotal: total,
              ));
        }
      },
      child: Container(
        width: 200,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xff5EEAB7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Texto(texto: 'Finalizar \ncompras'),
            Container(
                margin: EdgeInsets.only(left: 10),
                child:
                    Image(image: AssetImage('images/image 5.png'), width: 60))
          ],
        ),
      ),
    );
  }
}
