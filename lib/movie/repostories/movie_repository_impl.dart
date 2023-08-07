import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/movie/models/movie_model.dart';
import 'package:flutter_application_1/movie/repostories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Dio _dio;

  MovieRepositoryImpl(this._dio);
  @override
  Future<Either<String, MovieResponseModel>> getDiscover({int page = 1}) async {
    try {
      final result = await _dio.get(
        '/discover/movie',
        queryParameters: {'page': page},
      );
      if (result.statusCode == 200 && result.data != null) {
        final model = MovieResponseModel.fromJson(result.data);
        return Right(model);
      }
      return Left('Error get discover movies');
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(e.response.toString());
      }
      return Left('Another error on get discover movies');
    }
  }
}
