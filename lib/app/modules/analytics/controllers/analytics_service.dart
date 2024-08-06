import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../utils/utils.dart';
import '../../../data/api/api.dart';
import '../../../data/api/failed.dart';
import '../../../data/models/models.dart';

class AnalyticsServices {
  final Dio dio;

  AnalyticsServices(this.dio);

  Future<Either<Failed, DataSensorsModels>> getDay(
    String day,
    String month,
    String year,
  ) async {
    try {
      final token = await Utils.ensureToken();

      final response = await dio.getUri(
        Uri.https(
            'moonitoring.riset-d3rpla.com', Api.versionAPI + Api.dataByDay),
        options: Options(
          headers: {
            'Authorization': token,
            'day': day,
            'month': month,
            'year': year,
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(response.statusCode);
      }

      debugPrint(response.data.toString());
      return Right(DataSensorsModels.fromJson(response.data));
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failed(e.toString()));
    }
  }

    Future<Either<Failed, DataSensorsModels>> getWeek(
    String startDate,
    String endDate,
    String month,
    String year,
  ) async {
    try {
      final token = await Utils.ensureToken();

      final response = await dio.getUri(
        Uri.https(
            'moonitoring.riset-d3rpla.com', Api.versionAPI + Api.dataByMonth),
        options: Options(
          headers: {
            'Authorization': token,
            'dayStart': startDate,
            'dayEnd': endDate,
            'month': month,
            'year': year,
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(response.statusCode);
      }

      debugPrint(response.data.toString());
      return Right(DataSensorsModels.fromJson(response.data));
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failed(e.toString()));
    }
  }

    Future<Either<Failed, DataSensorsModels>> getMonth(
    String month,
    String year,
  ) async {
    try {
      final token = await Utils.ensureToken();

      final response = await dio.getUri(
        Uri.https(
            'moonitoring.riset-d3rpla.com', Api.versionAPI + Api.dataByMonth),
        options: Options(
          headers: {
            'Authorization': token,
            'month': month,
            'year': year,
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(response.statusCode);
      }

      debugPrint(response.data.toString());
      return Right(DataSensorsModels.fromJson(response.data));
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failed(e.toString()));
    }
  }
}
