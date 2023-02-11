import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gestao_de_caixa/Estoque/page1.dart';
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
        List dados = await banco.Select_all(table: 'carrinho');
        int count = dados.length;
        for (int i = 0; count > i; i++) {
          var id = dados[i]['id'];
          var nome = dados[i]['nome'];
          var desc = dados[i]['desc'];
          var valor = dados[i]['valor'];
          var qtds = dados[i]['qtds'];

          List dados2 = await banco.Select_one(nome);
          var q1 = int.parse(dados[i]['qtds']);
          var q2 = int.parse(dados2[0]['qtds']);

          String qtds2 = '${q2 - q1}';
          print('qtds: => $qtds2');
          int d = await banco.updateDados(
              nome: nome,
              desc: desc,
              valor: valor,
              qtds: qtds2,
              op: nome,
              table: 'produto');
          print('d :   $d');
        }
        banco.deletetable(table: 'carrinho');
        Get.offAll(() => Page1());
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
