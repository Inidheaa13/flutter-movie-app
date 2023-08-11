import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_constant.dart';
import 'package:flutter_application_1/movie/pages/movie_page.dart';
import 'package:flutter_application_1/movie/providers/movie_get_discover_provider.dart';
import 'package:flutter_application_1/movie/providers/movie_get_top_rated_provider.dart';
import 'package:flutter_application_1/movie/repostories/movie_repository.dart';
import 'package:flutter_application_1/movie/repostories/movie_repository_impl.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final dioOptions = BaseOptions(
    baseUrl: AppConstant.baseUrl,
    queryParameters: {'api_key': AppConstant.apiKey},
  );

  final Dio dio = Dio(dioOptions);
  final MovieRepository movieRepository = MovieRepositoryImpl(dio);

  runApp(App(movieRepository: movieRepository));
  FlutterNativeSplash.remove();
}

class App extends StatelessWidget {
  const App({super.key, required this.movieRepository});

  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieGetDiscoverProvider(movieRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => MovieGetTopRatedProvider(movieRepository),
        ),
      ],
      child: MaterialApp(
        title: 'MOVIEW',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MoviePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
