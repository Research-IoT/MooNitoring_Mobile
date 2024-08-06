import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../data/api/api.dart';
import '../../../data/api/failed.dart';

import '../../../data/models/models.dart';
import '../../../utils/utils.dart';

class HomeService {
  final Dio dio;

  HomeService(this.dio);

  Future<Either<Failed, ListDevicesModels>> getListDevices() async {
    try {
      String? token = await Utils.ensureToken();

      final response = await dio.getUri(
        Uri.https(Api.baseURL, Api.versionAPI + Api.listDevices),
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(response.statusCode);
      }

      debugPrint(response.data.toString());
      return Right(ListDevicesModels.fromJson(response.data));
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failed(e.toString()));
    }
  }

    Future<Either<Failed, LogoutModels>> logout() async {
    try {
      String? token = await Utils.ensureToken();

      final response = await dio.deleteUri(
        Uri.https(Api.baseURL, Api.versionAPI + Api.logout),
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      if (response.statusCode != 201) {
        throw Exception(response.statusCode);
      }

      debugPrint(response.data.toString());
      return Right(LogoutModels.fromJson(response.data));
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failed(e.toString()));
    }
  }
}
