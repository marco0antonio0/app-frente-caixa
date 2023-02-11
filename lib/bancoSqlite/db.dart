import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db_banco {
  String? nome;
  String? desc;
  String? valor;
  String? qtds;
  Map? data;
  Map<String, dynamic> data_produto = Map();

  Map<String, dynamic> Produto_toMap({nome, desc, valor, produto, qtds}) {
    data_produto['nome'] = nome;
    data_produto['desc'] = desc;
    data_produto['valor'] = valor;
    data_produto['qtds'] = qtds;
    return data_produto;
  }

  List Tolist({nome, desc, valor, qtds, op = ''}) {
    if (op == '') {
      List listmap = [nome, desc, valor, qtds];
      return listmap;
    } else {
      List listmap = [nome, desc, valor, qtds, op];
      return listmap;
    }
  }

  //==============================================<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  //==============================================<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  //==============================================<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  // construtor
  Db_banco._();
  // instanciar contrutor
  static final Db_banco instance = Db_banco._();
  // instancia do banco
  static Database? _database;
  //==============================================
  //        analisar

  get database async {
    return _database;
  }

  Future<dynamic> Produto_database() async =>
      database == null ? await database : IniciarDatabase();
  //==============================================
  IniciarDatabase() async {
    return openDatabase(join(await getDatabasesPath(), 'datasss.db'),
        version: 1, onCreate: Criar_tabela);
  }

  Criar_tabela(db, versao) async {
    final query =
        "CREATE TABLE produto(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,nome TEXT,desc TEXT,valor TEXT,qtds TEXT);";
    await db.execute(query);
    final query1 =
        "CREATE TABLE carrinho(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,nome TEXT,desc TEXT,valor TEXT,qtds TEXT);";
    await db.execute(query1);
  }

  //==============================================<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  //==============================================<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  //==============================================<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  //==============================================
  //      CRUD SQLFLITE
  //==============================================
  //          Insert
  Future<int> Insert_produto({
    @required nome,
    @required desc,
    @required valor,
    @required qtds,
    table = 'produto',
  }) async {
    String query =
        'INSERT INTO $table(nome,desc,valor,qtds) VALUES("$nome","$desc","$valor","$qtds");';
    Database db = await Produto_database();
    int status = await db.rawInsert(query);
    return status;
  }

  Future<List<Map>> Select_all({table = 'produto'}) async {
    String query = 'SELECT * FROM $table';
    Database db = await Produto_database();
    List<Map> data_produto = await db.rawQuery(query);
    return data_produto;
  }

  Future<List<Map>> Select_one(nome, {table = 'produto'}) async {
    try {
      String query = 'SELECT * FROM $table WHERE nome = "$nome"';
      Database db = await Produto_database();
      List<Map> data_produto = await db.rawQuery(query);
      return data_produto;
    } catch (e) {
      List<Map> data_produto = [];
      return data_produto;
    }
  }

  updateDados({
    @required nome,
    @required desc,
    @required valor,
    @required qtds,
    op,
    table = 'produto',
  }) async {
    String query =
        'UPDATE $table SET nome = "$nome" ,desc = "$desc",valor = "$valor" , qtds = "$qtds" WHERE nome = "$op" ';
    Database db = await Produto_database();
    var d = db.rawUpdate(query);
    return d;
  }

  updateDados_id({
    @required nome,
    @required desc,
    @required valor,
    @required qtds,
    @required op,
    table = 'produto',
  }) async {
    String query =
        'UPDATE $table SET nome = "$nome" ,desc = "$desc",valor = "$valor" , qtds = "$qtds" WHERE id = $op ';
    Database db = await Produto_database();
    var d = db.rawUpdate(query);
    return d;
  }

  deleteproduto(nome, {table = 'produto'}) async {
    String query = 'SELECT * FROM $table';
    Database db = await Produto_database();
    var d = db.rawDelete('DELETE FROM $table WHERE nome = "$nome"');
    print(await d);
    return await d;
  }

  deleteproduto_id(id, {table = 'produto'}) async {
    String query = 'SELECT * FROM $table';
    Database db = await Produto_database();
    var d = db.rawDelete('DELETE FROM $table WHERE id = "$id"');
    print(await d);
    return await d;
  }

  deletetable({table}) async {
    Database db = await Produto_database();
    var d = db.rawDelete('DELETE FROM $table');
    print(await d);
    return await d;
  }
}
