import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/FrenteCaixa/blocos/b4.dart';
import 'package:gestao_de_caixa/Frentecaixa/blocos/b5.dart';
import 'package:gestao_de_caixa/Frentecaixa/blocos/b6.dart';
import 'package:gestao_de_caixa/bancoSqlite/db.dart';
import 'package:gestao_de_caixa/widgets.dart';

class b3 extends StatefulWidget {
  const b3({super.key});

  @override
  State<b3> createState() => _b3State();
}

TextEditingController controller = TextEditingController();

class _b3State extends State<b3> {
  @override
  void initState() {
    super.initState();
    setState(() {
      controller = TextEditingController(text: '');
    });
  }

  @override
  Widget build(BuildContext context) {
    Db_banco banco = Db_banco.instance;
    double largura = MediaQuery.of(context).size.width;

    return Column(
      children: [
        //======================================
        Container(
            height: 80,
            width: largura > 600 ? 500 : largura,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                onSubmitted: (Value) {
                  setState(() {});
                },
                controller: controller,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    fillColor: Color(0xff5D6067),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))))),
        //======================================
        FutureBuilder(
            future: banco.Select_one(controller.text),
            builder: (context, snapshot) {
              var state = snapshot.connectionState;
              if (state == ConnectionState.done) {
                var dados = null;
                dados = snapshot.data;
                print(dados);
                if (dados.length == 0) {
                  return Column(children: [
                    b4(status: false),
                    b5(status: false),
                  ]);
                } else {
                  int count = 0;
                  return Column(children: [
                    b4(status: true, dados: dados[0]),
                    b5(status: true, count: count, dados: dados[0])
                  ]);
                }
              }
              return None();
            }),
      ],
    );
  }
}

//===========================================
//===========================================
Expanded WidgetPesquisar(controller) {
  return Expanded(
    flex: 100,
    child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        child: TextField(
            controller: controller,
            cursorColor: Colors.white,
            decoration: InputDecoration(
                fillColor: Color(0xff5D6067),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))))),
  );
}

//===========================================
//===========================================
Expanded Btn_pesquisar(controller) {
  return Expanded(
    flex: 30,
    child: Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xffFC6D4D), borderRadius: BorderRadius.circular(20)),
      child: Container(
          margin: EdgeInsets.all(15),
          child: Image(image: AssetImage('images/image 4.png'))),
    ),
  );
}
