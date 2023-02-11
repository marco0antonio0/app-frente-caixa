import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/Edicao/blocos/b4.dart';
import 'package:gestao_de_caixa/Estoque/page1.dart';
import 'package:gestao_de_caixa/bancoSqlite/db.dart';
import 'package:gestao_de_caixa/widgets.dart';
import 'package:get/get.dart';

final banco = Db_banco.instance;

class b2 extends StatefulWidget {
  b2({super.key, this.dados});
  var dados;

  @override
  State<b2> createState() => _b2State(this.dados);
}

class _b2State extends State<b2> {
  _b2State(this.dados);
  var dados;
  TextEditingController nome_controller = TextEditingController();
  TextEditingController detalhe_controller = TextEditingController();
  TextEditingController valor_controller = TextEditingController();
  TextEditingController qtds_controller = TextEditingController();
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    setState(() {
      nome_controller = TextEditingController(
          text: dados?['nome'] != null ? dados!['nome'] : '');

      detalhe_controller = TextEditingController(
          text: dados?['desc'] != null ? dados!['desc'] : '');

      valor_controller = TextEditingController(
          text: dados?['valor'] != null ? dados!['valor'] : '');

      qtds_controller = TextEditingController(
          text: dados?['qtds'] != null ? dados!['qtds'] : '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //=======================================================================
        WidgetTextInput(
          texto: 'nome do produto',
          controller: nome_controller,
        ),
        //=======================================================================
        WidgetTextInput(
          texto: 'detalhes',
          controller: detalhe_controller,
          linhas: 7,
        ),
        //=======================================================================
        WidgetTextInput(
          texto: 'Valor',
          controller: valor_controller,
        ),
        //=======================================================================
        WidgetTextInput(
          texto: 'qtds de produto',
          controller: qtds_controller,
        ),
        InkWell(
            onTap: () async {
              dados?['nome'] == null
                  ? await banco.Insert_produto(
                      nome: nome_controller.text,
                      desc: detalhe_controller.text,
                      valor: valor_controller.text,
                      qtds: qtds_controller.text,
                    )
                  : await banco.updateDados(
                      nome: nome_controller.text,
                      desc: detalhe_controller.text,
                      valor: valor_controller.text,
                      qtds: qtds_controller.text,
                      op: dados?['nome']);

              Get.offAll(() => Page1());
            },
            child: b4()),
      ],
    );
  }
}
