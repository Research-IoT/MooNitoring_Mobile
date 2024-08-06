import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../data/api/api.dart';
import '../../../data/api/failed.dart';
import '../../../data/models/models.dart';

class NotificationsService {
  final Dio dio;

  NotificationsService(this.dio);

  Future<Either<Failed, NotificationsModels>> getListNotif(
    final token,
  ) async {
    try {
      final response = await dio.getUri(
        Uri.https(Api.baseURL, Api.versionAPI + Api.listNotif),
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(response.statusCode);
      }

      return Right(NotificationsModels.fromJson(response.data));
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failed(e.toString()));
    }
  }
}
