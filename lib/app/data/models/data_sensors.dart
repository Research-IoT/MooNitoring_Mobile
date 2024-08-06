part of 'models.dart';

class DataSensorsModels {
  int? code;
  String? status;
  String? message;
  List<DataSensors>? data;

  DataSensorsModels({this.code, this.status, this.message, this.data});

  DataSensorsModels.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataSensors>[];
      json['data'].forEach((v) {
        data!.add(DataSensors.fromJson(v));
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

class DataSensors {
  int? id;
  String? devicesId;
  String? year;
  String? month;
  String? day;
  String? timestamp;
  String? temperature;
  String? humidity;
  String? ammonia;

  DataSensors(
      {this.id,
      this.devicesId,
      this.year,
      this.month,
      this.day,
      this.timestamp,
      this.temperature,
      this.humidity,
      this.ammonia});

  DataSensors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    devicesId = json['devices_id'];
    year = json['year'];
    month = json['month'];
    day = json['day'];
    timestamp = json['timestamp'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    ammonia = json['ammonia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['devices_id'] = devicesId;
    data['year'] = year;
    data['month'] = month;
    data['day'] = day;
    data['timestamp'] = timestamp;
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['ammonia'] = ammonia;
    return data;
  }
}
