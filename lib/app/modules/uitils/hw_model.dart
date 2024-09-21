import 'dart:convert';

class HWDateModel {
  int? id;
  String? title;
  int? dateTime;
  int? finishCount;
  int? createTime;
  String? finishItem;
  List<dynamic>? finishItems;

  HWDateModel(
      {this.id,
      this.title,
      this.dateTime,
      this.finishCount,
      this.createTime,
      this.finishItem});

  HWDateModel.fromJson(Map<String, dynamic> json) {
    id = json['date_id'];
    title = json['title'];
    dateTime = json['dateTime'];
    finishCount = json['finishCount'];
    createTime = json["createTime"];
    finishItem = json["finishItem"];

    finishItems = [];
    if (json["finishItem"] != null) {
      finishItems = jsonDecode(json["finishItem"]);
    }
  }
}

