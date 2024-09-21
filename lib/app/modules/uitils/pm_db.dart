import 'dart:convert';
import 'dart:math';
import 'package:health_water/app/modules/his_list/controllers/his_list_controller.dart';
import 'package:health_water/app/modules/home/controllers/home_controller.dart';
import 'package:health_water/app/modules/uitils/app_util.dart';
import 'package:health_water/app/modules/uitils/hw_model.dart';
import 'package:health_water/app/modules/uitils/local_manager.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';

class HWDBTool extends GetxService {
  late Database db;

  Future<HWDBTool> init() async {
    await initDB();
    return this;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Health_Drink.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createTable(db);
    });

    await _initailDatas();
  }

  Future<void> _initailDatas() async {
    final hasData = HWLocalTool.getBool("has_initail_datas") ?? false;
    if (hasData) {
      if (Get.isRegistered<HomeController>()) {
        Get.find<HomeController>().initailData();
      }
      return;
    }

    await Future.delayed(const Duration(milliseconds: 300));

    final count = 2 + Random().nextInt(3);

    for (var i = 0; i < count; i++) {
      final date =
          DateTime(2023, Random().nextInt(12) + 1, Random().nextInt(28) + 1);
      final newModel = HWDateModel();
      final millsecs = date.millisecondsSinceEpoch;
      newModel.title = HWAppTools.formatDateWithoutHour(dateTime: date);
      newModel.dateTime = millsecs;
      newModel.finishCount = Random().nextInt(5) + 1;
      newModel.createTime = millsecs;
      newModel.finishItem = jsonEncode([0, 1, 2, 3, 5]);

      await HWDBTool().insertPDateData(newModel);
    }

    await HWLocalTool.putBool("has_initail_datas", true);

    if (Get.isRegistered<HisListController>()) {
      Get.find<HisListController>().loadDatas();
    }
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().initailData();
    }
  }

  createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS  date_list (date_id INTEGER PRIMARY KEY AUTOINCREMENT , title TEXT  , dateTime INT, finishCount INT, createTime INT,finishItem TEXT, finishItems TEXT)');
  }

  insertPDateData(HWDateModel model) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Health_Drink.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.insert('date_list', {
      'title': model.title,
      'dateTime': model.dateTime,
      'finishCount': model.finishCount,
      'createTime': model.createTime,
      'finishItem': model.finishItem
    });
  }

  // insertDrinkModel(HWDrinkModel item) async {
  //   var databasesPath = await getDatabasesPath();
  //   String path = join(databasesPath, 'Health_Drink.db');
  //   db = await openDatabase(path,
  //       version: 1, onCreate: (Database db, int version) async {});

  //         int? dateID;
  // int? finished;
  // int? index;
  // int? createTime;
  //   await db.insert('drink_list', {
  //     'date_id': item.dateID,
  //     'finished': item.finished,
  //     'eventTime': item.eventTime,
  //     'index': item.index,
  //     'birth': item.birth,
  //     'photo': item.photo,
  //     "createTime": item.createTime,
  //   });
  // }

  update(HWDateModel model) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Health_Drink.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.update(
        'date_list',
        {
          'title': model.title,
          'dateTime': model.dateTime,
          'finishCount': model.finishCount,
          'createTime': model.createTime,
          'finishItem': jsonEncode(model.finishItems),
          "finishItems": jsonEncode(model.finishItems)
        },
        where: 'date_id = ?',
        whereArgs: [
          model.id,
        ]);
  }

  deletePet(int id) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Health_Drink.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    db.delete('date_list', where: 'date_id = ?', whereArgs: [id]);
  }

  clean() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Health_Drink.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.delete('date_list');
  }

  Future<List<HWDateModel>> getAllDatas({int? id}) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Health_Drink.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    if (id != null) {
      var result = await db.query('date_list',
          where: 'date_id = ?', whereArgs: [id], orderBy: 'date_id DESC');
      return result.map((e) => HWDateModel.fromJson(e)).toList();
    }
    var result = await db.query('date_list', orderBy: 'date_id DESC');
    return result.map((e) => HWDateModel.fromJson(e)).toList();
  }
}
