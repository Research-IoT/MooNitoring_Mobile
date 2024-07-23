import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../data/api/api.dart';
import '../../../data/api/failed.dart';
import '../../../data/models/models.dart';

class LoginServices {
  final Dio dio;

  LoginServices(this.dio);

  Future<Either<Failed, UsersModels>> login(
    final noHp,
    final password,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'no_hp': noHp,
        'password': password,
      });

      final response = await dio.postUri(
        Uri.https(Api.baseURL, Api.versionAPI + Api.login),
        data: formData,
      );

      if (response.statusCode != 200) {
        throw Exception(response.statusCode);
      }

      debugPrint(response.data.toString());
      return Right(UsersModels.fromJson(response.data));
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failed(e.toString()));
    }
  }
}
