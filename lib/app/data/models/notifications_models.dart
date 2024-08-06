part of 'models.dart';

class NotificationsModels {
  int? code;
  String? status;
  String? message;
  List<ListDataNotif>? data;

  NotificationsModels({this.code, this.status, this.message, this.data});

  NotificationsModels.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ListDataNotif>[];
      json['data'].forEach((v) {
        data!.add(ListDataNotif.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListDataNotif {
  int? id;
  String? title;
  String? description;
  String? date;
  String? time;

  ListDataNotif({this.id, this.title, this.description, this.date, this.time});

  ListDataNotif.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}
