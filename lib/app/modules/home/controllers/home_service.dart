import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../data/api/api.dart';
import '../../../data/api/failed.dart';

import '../../../data/models/models.dart';

class HomeService {
  final Dio dio;

  HomeService(this.dio);

  // Future<Either<Failed, DevicesDetail>> login(
  //   final email,
  //   final password,
  // ) async {
  //   try {
  //     final response = await dio.getUri(
  //       Uri.https(Api.baseURL, Api.versionAPI + Api.profile),
  //       options: Options(
  //         headers: {
  //           'Authorization':
  //               'Bearer 27|ob3PdLdWfNLqm0d6oiTQdwzcGLxZli5p0fIrCNOT6d36c1e7',
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );

  //     if (response.statusCode != 200) {
  //       throw Exception(response.statusCode);
  //     }

  //     debugPrint(response.data.toString());
  //     return Right(DevicesDetail.fromJson(response.data));
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return Left(Failed(e.toString()));
  //   }
  // }

  // Future<Either<Failed, null>> listKandang(
  //   final bearer,
  //   final userId,
  // ) async {
  //   try {
  //     final response = await dio.getUri(
  //       Uri.https(Api.baseURL, Api.versionAPI + Api.allDevices),
  //       options: Options(
  //         headers: {
  //           'Authorization': bearer,
  //           'user_id': userId,
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );

  //     if (response.statusCode != 200) {
  //       throw Exception(response.statusCode);
  //     }

  //     debugPrint(response.data.toString());
  //     return Right(DevicesList.fromJson(response.data));
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return Left(Failed(e.toString()));
  //   }
  // }
}
