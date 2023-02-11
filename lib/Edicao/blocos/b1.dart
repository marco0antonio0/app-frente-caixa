import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/Estoque/page1.dart';
import 'package:gestao_de_caixa/widgets.dart';
import 'package:get/get.dart';
import 'package:gestao_de_caixa/bancoSqlite/db.dart';

final banco = Db_banco.instance;

class b1 extends StatelessWidget {
  b1({super.key, this.dados});
  var dados;

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 100,
      //color: Colors.red,
      child: Row(
        children: [
          Spacer(flex: 20),
          Texto(texto: 'Edição de\nProduto', fontsize: 30.0),
          Spacer(flex: 100),
          dados?['nome'] != null
              ? InkWell(
                  onTap: () async {
                    await banco.deleteproduto(dados?['nome']);
                    Get.offAll(() => Page1());
                  },
                  child: Container(
                      width: 60,
                      height: 60,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff494949),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.5))),
                      child: Image(image: AssetImage('images/image 6.png'))))
              : None(),
          dados?['nome'] != null ? Spacer(flex: 20) : None(),
        ],
      ),
    );
  }
}
