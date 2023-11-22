import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/movie/models/movie_model.dart';

import '../models/movie_detail_model.dart';

abstract class MovieRepository {
  Future<Either<String, MovieResponseModel>> getDiscover({int page = 1});
  Future<Either<String, MovieResponseModel>> getTopRated({int page = 1});
  Future<Either<String, MovieResponseModel>> getNowPlaying({int page = 1});
  Future<Either<String, MovieDetailModel>> getDetail({required int id});
}
