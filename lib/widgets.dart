import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/Carrinho/blocos/b1.dart';
import 'package:gestao_de_caixa/Carrinho/page4.dart';
import 'package:gestao_de_caixa/Edicao/page3.dart';
import 'package:gestao_de_caixa/Frentecaixa/page2.dart';
import 'package:gestao_de_caixa/bancoSqlite/db.dart';
import 'package:get/get.dart';

//=====================================================================
//              Widget gerais
//=====================================================================
Text Texto({texto = '', fontsize = 20.0, cor = Colors.white}) {
  return Text(texto, style: TextStyle(fontSize: fontsize, color: cor));
}

Align Texto2(
    {texto = '',
    fontsize = 20.0,
    cor = Colors.white,
    alinhamento = Alignment.centerLeft}) {
  return Align(
      alignment: alinhamento,
      child: Text(texto, style: TextStyle(fontSize: fontsize, color: cor)));
}

Container None() => Container();

//=====================================================================
//              Widget Produto
//=====================================================================
class WidgetProduto extends StatelessWidget {
  WidgetProduto({super.key, this.dados});
  var dados;

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double largura_widget = (MediaQuery.of(context).size.width) - 10 - 20;

    if (dados?['nome'] == null) {
      dados['nome'] = 'Nome produto';
      dados['desc'] =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer id elementum sem. Nam convallis ligula vel maximus tincidunt. Proin malesuada at tellus eu';
      dados['valor'] = 'xx.xx';
      dados['qtds'] = '';
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: largura_widget,
      decoration: BoxDecoration(
          color: Color(0xff494949).withOpacity(0.8),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(width: largura_widget * 0.3, color: Colors.red),
          Container(
            width: largura > 450 ? largura_widget * 0.7 : largura_widget * 0.5,

            //color: Colors.green,
            child: Column(
              children: [
                //===================================================
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 5),
                    child: Texto(texto: dados['nome'], fontsize: 25.0)),
                //===================================================
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Texto(
                      texto: 'Detalhes: ' + dados['desc'], fontsize: 18.0),
                ),
                //===================================================
                Row(
                  children: [
                    Texto(texto: 'R\$: ' + dados['valor'], fontsize: 25.0),
                    SizedBox(width: 15),
                    Texto(texto: 'Qtds:  ' + dados['qtds'], fontsize: 25.0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//=====================================================================
//              Widget Produto -------------- 2
//=====================================================================
Db_banco Banco = Db_banco.instance;

class WidgetProduto2 extends StatefulWidget {
  WidgetProduto2({super.key, this.index, this.dados, this.qtds = 0});
  int qtds;
  int? index;
  var dados;

  @override
  State<WidgetProduto2> createState() =>
      _WidgetProduto2State(this.dados, this.qtds);
}

class _WidgetProduto2State extends State<WidgetProduto2> {
  _WidgetProduto2State(this.dados, this.v1);
  var dados;
  int v1;
  bool status = true;
  @override
  Widget build(BuildContext context) {
    double largura_widget = (MediaQuery.of(context).size.width) - 10 - 20;
    double largura = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: largura_widget,
      decoration: BoxDecoration(
          color: Color(0xff494949).withOpacity(0.8),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(width: largura_widget * 0.3, color: Colors.red),
          Container(
            width: largura > 450 ? largura_widget * 0.7 : largura_widget * 0.5,
            //color: Colors.green,
            child: Column(
              children: [
                //===================================================
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 5),
                    child: Texto(texto: dados?['nome'], fontsize: 25.0)),
                //===================================================
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Texto(
                      texto: 'Detalhes: ' + dados?['desc']!, fontsize: 18.0),
                ),
                //===================================================
                Row(children: [
                  Container(
                      alignment: Alignment.bottomLeft,
                      child: Texto(
                          texto: 'R\$: ' + dados?['valor']!, fontsize: 25.0)),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Texto(texto: 'Qtds:  ' + '$v1', fontsize: 25.0)),
                ]),
                Row(children: [
                  Spacer(flex: 20),
                  //===================================
                  //      BTN +
                  InkWell(
                    onTap: () async {
                      var data_1 = null;
                      int temp1 = 0;
                      data_1 = await banco.Select_one(dados['nome'],
                          table: 'produto');
                      setState(() {
                        if (data_1.length > 0) {
                          temp1 = int.parse(data_1[0]['qtds']);
                          if (temp1 > v1) {
                            v1 += 1;
                          }
                        }
                      });
                      banco.updateDados_id(
                          op: dados['id'],
                          table: 'carrinho',
                          nome: dados?['nome'],
                          desc: dados?['desc'],
                          valor: dados?['valor'],
                          qtds: '$v1');
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.3),
                          shape: BoxShape.circle),
                      child: Center(child: Texto(texto: '+', fontsize: 22.0)),
                    ),
                  ),
                  Spacer(flex: 20),
                  //===================================
                  //      BTN -
                  InkWell(
                    onTap: () {
                      setState(() {
                        v1 != 0 ? v1 -= 1 : 0;
                        if (v1 == 0) {
                          banco.deleteproduto(dados['nome'], table: 'carrinho');
                          Get.off(Page2());
                          Get.off(Page4());
                        }
                      });

                      banco.updateDados_id(
                          op: dados['id'],
                          table: 'carrinho',
                          nome: dados?['nome'],
                          desc: dados?['desc'],
                          valor: dados?['valor'],
                          qtds: '$v1');
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          shape: BoxShape.circle),
                      child: Center(child: Texto(texto: '-', fontsize: 30.0)),
                    ),
                  ),
                  Spacer(flex: 100),
                ]),
                Container(
                  height: 5,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Buttom_Personalizado extends StatelessWidget {
  Buttom_Personalizado(
      {super.key,
      this.largura_btn = 200,
      this.altura_btn = 50,
      this.status = true,
      this.texto = ''});
  double? largura_btn;
  double? altura_btn;
  bool status;
  Color? cor;
  String? texto;
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;

    return Container(
      width: largura_btn,
      height: altura_btn,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(50),
          color: status ? Color(0xffFC6D4D) : Color(0xff494949)),
      child: Center(child: Texto(texto: texto, fontsize: 17.0)),
    );
  }
}

class WidgetTextInput extends StatelessWidget {
  WidgetTextInput(
      {super.key,
      this.texto = '',
      this.controller,
      this.linhas = 1,
      this.tipoDeTeclado = TextInputType.text});
  var tipoDeTeclado;
  String? texto;

  int? linhas;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment(-0.8, 0),
            child: Texto(texto: texto)),
        Container(
          width: largura - 30,
          child: TextField(
            keyboardType: tipoDeTeclado,
            controller: controller,
            maxLines: linhas,
            decoration: InputDecoration(
                hintText: 'Digite',
                filled: true,
                fillColor: Color(0xff5D6067),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
        )
      ],
    );
  }
}
