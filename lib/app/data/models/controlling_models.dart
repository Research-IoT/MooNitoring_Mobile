part of 'models.dart';

class ControllingModels {
  int? code;
  String? status;
  String? message;
  DataControlling? data;

  ControllingModels({this.code, this.status, this.message, this.data});

  ControllingModels.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataControlling.fromJson(json['data']) : null;
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

class DataControlling {
  int? id;
  bool? automatic;
  bool? heater;
  bool? blower;

  DataControlling({this.id, this.automatic, this.heater, this.blower});

  DataControlling.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    automatic = json['automatic'];
    heater = json['heater'];
    blower = json['blower'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['automatic'] = automatic;
    data['heater'] = heater;
    data['blower'] = blower;
    return data;
  }
}
