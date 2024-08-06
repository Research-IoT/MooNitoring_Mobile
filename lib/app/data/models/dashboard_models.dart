part of 'models.dart';

class DashboardModels {
  int? code;
  String? status;
  String? message;
  DataDashboard? data;

  DashboardModels({this.code, this.status, this.message, this.data});

  DashboardModels.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataDashboard.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataDashboard {
  int? id;
  String? devicesId;
  String? temperature;
  String? humidity;
  String? ammonia;
  String? time;

  DataDashboard(
      {this.id,
      this.devicesId,
      this.temperature,
      this.humidity,
      this.ammonia,
      this.time});

  DataDashboard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    devicesId = json['devices_id'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    ammonia = json['ammonia'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['devices_id'] = devicesId;
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['ammonia'] = ammonia;
    data['time'] = time;
    return data;
  }
}
