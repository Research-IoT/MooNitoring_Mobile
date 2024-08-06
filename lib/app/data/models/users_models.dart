part of 'models.dart';

class UsersModels {
  int? code;
  String? status;
  String? message;
  DataUsers? data;

  UsersModels({this.code, this.status, this.message, this.data});

  UsersModels.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataUsers.fromJson(json['data']) : null;
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

class DataUsers {
  int? id;
  String? name;
  String? role;
  String? noHp;
  String? alamat;
  String? token;
  Users? users;

  DataUsers({
    this.id,
    this.name,
    this.role,
    this.noHp,
    this.alamat,
    this.token,
    this.users,
  });

  DataUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    noHp = json['no_hp'];
    alamat = json['alamat'];
    token = json['token'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    data['no_hp'] = noHp;
    data['alamat'] = alamat;
    data['token'] = token;
    if (users != null) {
      data['users'] = users!.toJson();
    }
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? role;
  String? noHp;
  String? alamat;

  Users({this.id, this.name, this.role, this.noHp, this.alamat});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    noHp = json['no_hp'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    data['no_hp'] = noHp;
    data['alamat'] = alamat;
    return data;
  }
}
