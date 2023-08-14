import 'package:flutter/material.dart';
import 'package:flutter_application_1/movie/models/movie_model.dart';
import 'image_widget.dart';

class ItemMovieWidget extends Container {
  final MovieModel movie;

  final double heightBackdrop;
  final double widthBackdrop;
  final double widthPoster;
  final double heightPoster;

  ItemMovieWidget({
    required this.movie,
    required this.heightBackdrop,
    required this.widthBackdrop,
    required this.widthPoster,
    required this.heightPoster,
    super.key,
  });

  @override
  Clip get clipBehavior => Clip.hardEdge;

  @override
  Decoration? get decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      );

  @override
  Widget? get child => Stack(
        children: [
          ImageNetworkWidget(
            imageSrc: '${movie.backdropPath}',
            height: heightBackdrop,
            width: widthBackdrop,
          ),
          Container(
            height: heightBackdrop,
            width: widthBackdrop,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black87,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageNetworkWidget(
                  imageSrc: '${movie.posterPath}',
                  height: heightPoster,
                  width: widthPoster,
                  radius: 10,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    Text(
                      '${movie.voteAverage} (${movie.voteCount})',
                      style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
