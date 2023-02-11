import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/Carrinho/page4.dart';
import 'package:gestao_de_caixa/bancoSqlite/db.dart';
import 'package:gestao_de_caixa/widgets.dart';
import 'package:get/get.dart';

class b6 extends StatelessWidget {
  b6({super.key, this.dados, @required this.count});
  var dados;
  int? count;
  Db_banco banco = Db_banco.instance;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (dados?['nome'] != null && count != 0) {
          var data = await banco.Select_one(dados?['nome'], table: 'carrinho');
          if (data.length > 0) {
            var temp = data[0]['qtds'];
            var temp2 = count! + int.parse(temp);
            await banco.updateDados(
                table: 'carrinho',
                nome: dados?['nome'],
                desc: dados?['desc'],
                valor: dados?["valor"],
                qtds: '$temp2',
                op: dados?['nome']);
            Get.to(() => Page4());
          } else {
            await banco.Insert_produto(
                table: 'carrinho',
                nome: dados?['nome'],
                desc: dados?['desc'],
                valor: dados?["valor"],
                qtds: '$count');
            Get.to(() => Page4());
          }
          //==============================================
        } else {
          Get.offAll(() => Page4());
        }
      },
      child: Container(
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
            Texto(texto: 'Ir para o\ncarrinho'),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Image(
                image: AssetImage('images/image 5.png'),
                width: 60,
              ),
            )
          ],
        ),
      ),
    );
  }
}
