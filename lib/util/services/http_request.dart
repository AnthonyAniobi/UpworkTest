import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:test_upwork_bloc/models/album.dart';
import 'package:test_upwork_bloc/models/error_model.dart';

class HttpRequest {
  static Future<Either<ErrorModel, List<Album>>> getAlbums() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/photos');
      if (response.statusCode == 200) {
        return Right(Album.fromJson(response.data as List));
      } else {
        return Left(RequestError(message: '${response.statusCode} error'));
      }
    } catch (e) {
      return Left(RequestError(message: e.toString()));
    }
  }
}
