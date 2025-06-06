import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wallpaper_app/core/env_service.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_response_model.dart';

class ExploreRemoteService {
  final _client = Dio(
    BaseOptions(
      baseUrl: 'https://api.pexels.com/',
      headers: {
        'Authorization': EnvService.apiKey,
      },
    ),
  );

  int page = 1;
  int perPage = 5;

  Future<Either<String, WallpaperResponseModel>> getWallpapers() async {
    try {
      final response = await _client.get(
        'v1/curated',
        queryParameters: {
          'page': page,
          'per_page': perPage,
        },
      );

      //Status Code
      // log(response.statusCode.toString());

      final result = WallpaperResponseModel.fromMap(response.data);
      return Right(result);
    } on DioException catch (e) {
      return Left(e.message ?? 'Something is wrong');
    }
  }

  void loadNextPage() async {
    page++;
    await getWallpapers();
  }
}
