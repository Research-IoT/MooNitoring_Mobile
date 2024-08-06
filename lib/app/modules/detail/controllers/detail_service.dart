import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../utils/utils.dart';
import '../../../data/api/api.dart';
import '../../../data/api/failed.dart';
import '../../../data/models/models.dart';

class DetailService {
  final Dio dio;

  DetailService(this.dio);

  Future<Either<Failed, DashboardModels>> dashboard(
    final idDevices,
  ) async {
    try {
      final token = await Utils.ensureToken();

      final response = await dio.getUri(
        Uri.https(Api.baseURL, Api.versionAPI + Api.dashboard),
        options: Options(
          headers: {
            'Authorization': token,
            'device_id': idDevices,
          },
        ),
      );

      debugPrint(response.data.toString());

      if (response.statusCode != 200) {
        throw Exception(response.statusCode);
      }

      debugPrint(response.data.toString());
      return Right(DashboardModels.fromJson(response.data));
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failed(e.toString()));
    }
  }

  Future<Either<Failed, ControllingModels>> infoControl(
    final idDevices,
  ) async {
    try {
      final token = await Utils.ensureToken();

      final response = await dio.getUri(
        Uri.https(Api.baseURL, Api.versionAPI + Api.infoControl),
        options: Options(
          headers: {
            'Authorization': token,
            'device_id': idDevices,
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(response.statusCode);
      }

      debugPrint(response.data.toString());
      return Right(ControllingModels.fromJson(response.data));
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failed(e.toString()));
    }
  }

  Future<Either<Failed, ControllingModels>> changeControl(
    final idDevices,
    final automatic,
    final blower,
    final heater,
  ) async {
    try {
      final token = await Utils.ensureToken();

      FormData formData = FormData.fromMap({
        'id': idDevices,
        'automatic': automatic,
        'blower': blower,
        'heater': heater,
      });

      debugPrint(formData.fields.toString());

      final response = await dio.postUri(
        Uri.https(Api.baseURL, Api.versionAPI + Api.changeControl),
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
        data: formData,
      );

      if (response.statusCode != 201) {
        throw Exception(response.statusCode);
      }

      debugPrint(response.data.toString());
      return Right(ControllingModels.fromJson(response.data));
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failed(e.toString()));
    }
  }
}
