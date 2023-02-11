import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/Carrinho/page4.dart';
import 'package:gestao_de_caixa/Edicao/page3.dart';
import 'package:gestao_de_caixa/Estoque/page1.dart';
import 'package:gestao_de_caixa/FinalizarCompra/page5.dart';
import 'package:get/get.dart';

import 'FrenteCaixa/page2.dart';
/* 
void main() {
  runApp(DevicePreview(builder: (_) => HomeInicio()));
}

class HomeInicio extends StatefulWidget {
  const HomeInicio({super.key});

  @override
  State<HomeInicio> createState() => _HomeInicioState();
}

class _HomeInicioState extends State<HomeInicio> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      home: Page1(),
    );
  }
} */

void main() {
  runApp(GetMaterialApp(
    home: Page1(),
  ));
}
