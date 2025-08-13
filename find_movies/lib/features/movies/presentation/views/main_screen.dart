import 'package:find_movies/config/widgets/validator_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie.dart';
import '../bloc/movie_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingMoviesPage extends StatelessWidget {
  const TrendingMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CinePlus')),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          final state = context.watch<MovieBloc>().state;
          return ValidatorWidget(
            loading: false,
            stateType: StateType.success,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  // Sección 1: Destacados con switch
                  // _ContentSection(
                  //   title: 'Destacados de Hoy',
                  //   movies: state.series..shuffle(),
                  //   series: state.movies..shuffle(),
                  //   itemCount: 20,
                  // ),

                  const SizedBox(height: 24),

                  // Sección 2: Estrenos 2025 (solo películas)
                  _buildMovieSection(
                    title: 'Estrenos 2025',
                    movies:
                       []
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMovieSection({
    required String title,
    required List<Movie> movies,
    int? itemCount,
  }) {
    final displayedItems =
        itemCount != null && movies.length > itemCount
            ? movies.sublist(0, itemCount)
            : movies;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: displayedItems.length,
            itemBuilder: (context, index) {
              final movie = displayedItems[index];
              return _buildMovieItem(movie);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMovieItem(Movie movie) {
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  movie.posterPath != null
                      ? Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder:
                            (_, __, ___) => const Icon(Icons.broken_image),
                      )
                      : const Icon(Icons.movie, size: 50),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.title ?? 'Sin título',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _ContentSection extends StatefulWidget {
  final String title;
  final List<Movie> movies;
  final List<Movie> series;
  final int? itemCount;

  const _ContentSection({
    required this.title,
    required this.movies,
    required this.series,
    this.itemCount,
  });

  @override
  State<_ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<_ContentSection> {
  var _selectedContent = ContentType.movies;

  @override
  Widget build(BuildContext context) {
    final items =
        _selectedContent == ContentType.movies ? widget.movies : widget.series;

    final displayedItems =
        widget.itemCount != null && items.length > widget.itemCount!
            ? items.sublist(0, widget.itemCount!)
            : items;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              // Switch compacto
              _buildContentSwitch(),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: displayedItems.length,
            itemBuilder: (context, index) {
              final item = displayedItems[index];
              return _buildContentItem(item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContentSwitch() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSwitchOption('Películas', ContentType.movies),
          _buildSwitchOption('Series', ContentType.series),
        ],
      ),
    );
  }

  Widget _buildSwitchOption(String text, ContentType type) {
    final isSelected = _selectedContent == type;
    return GestureDetector(
      onTap: () => setState(() => _selectedContent = type),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildContentItem(dynamic item) {
    final isMovie = item is Movie;
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  item.posterPath != null
                      ? Image.network(
                        'https://image.tmdb.org/t/p/w500${item.posterPath}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder:
                            (_, __, ___) => const Icon(Icons.broken_image),
                      )
                      : Icon(isMovie ? Icons.movie : Icons.tv, size: 50),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isMovie ? item.title ?? 'Sin título' : item.name ?? 'Sin título',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

enum ContentType { movies, series }
