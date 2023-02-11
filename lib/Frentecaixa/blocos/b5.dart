import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gestao_de_caixa/Frentecaixa/blocos/b6.dart';
import 'package:gestao_de_caixa/bancoSqlite/db.dart';
import 'package:gestao_de_caixa/widgets.dart';

class b5 extends StatefulWidget {
  b5({super.key, this.status = true, this.count = 0, this.dados});
  var dados;
  bool status;
  int count;

  @override
  State<b5> createState() => _b5State(count: count, dados: dados);
}

class _b5State extends State<b5> {
  _b5State({this.count = 0, this.dados});
  void initState() {
    super.initState();
    setState(() {});
  }

  var dados;
  int count;
  Db_banco banco = Db_banco.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.status
            ? Container(
                margin: EdgeInsets.only(top: 10),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () async {
                          var data_1 = null;
                          int temp1 = 0;
                          data_1 = await banco.Select_one(dados['nome'],
                              table: 'carrinho');
                          if (data_1.length > 0) {
                            temp1 = int.parse(data_1[0]['qtds']);
                            var t = int.parse(dados['qtds']) - temp1;
                            setState(() {
                              if (count >= 0 && t > count) count += 1;
                            });
                          } else {
                            setState(() {
                              if (count >= 0 &&
                                  int.parse(dados['qtds']) > count) count += 1;
                            });
                          }
                        },
                        child: btn_click('+')),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Color(0xff494949),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Texto(texto: '$count')),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            if (count != 0) count -= 1;
                          });
                        },
                        child: btn_click('-')),
                  ],
                ),
              )
            : None(),
        b6(
          dados: dados,
          count: count,
        ),
      ],
    );
  }
}

Container btn_click(texto) {
  return Container(
    width: 100,
    decoration: BoxDecoration(
        color: Color(0xffFC6D4D), borderRadius: BorderRadius.circular(20)),
    child: Center(child: Texto(texto: texto, fontsize: 30.0)),
  );
}
