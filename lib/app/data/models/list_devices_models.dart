part of 'models.dart';

class ListDevicesModels {
  int? code;
  String? status;
  String? message;
  List<DataListDevices>? data;

  ListDevicesModels({this.code, this.status, this.message, this.data});

  ListDevicesModels.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataListDevices>[];
      json['data'].forEach((v) {
        data!.add(DataListDevices.fromJson(v));
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

class DataListDevices {
  int? id;
  String? name;
  bool? automatic;
  bool? heater;
  bool? blower;
  Dashboard? dashboard;

  DataListDevices(
      {this.id,
      this.name,
      this.automatic,
      this.heater,
      this.blower,
      this.dashboard});

  DataListDevices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    automatic = json['automatic'];
    heater = json['heater'];
    blower = json['blower'];
    dashboard = json['dashboard'] != null
        ? Dashboard.fromJson(json['dashboard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['automatic'] = automatic;
    data['heater'] = heater;
    data['blower'] = blower;
    if (dashboard != null) {
      data['dashboard'] = dashboard!.toJson();
    }
    return data;
  }
}

class Dashboard {
  String? temperature;
  String? humidity;
  String? ammonia;
  String? time;

  Dashboard({this.temperature, this.humidity, this.ammonia, this.time});

  Dashboard.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    humidity = json['humidity'];
    ammonia = json['ammonia'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['ammonia'] = ammonia;
    data['time'] = time;
    return data;
  }
}
