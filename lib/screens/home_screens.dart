import 'package:peliculas_app_jany/providers/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app_jany/widgets/card_swiper.dart';
import 'package:peliculas_app_jany/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProviders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        CardSwiper(movies: moviesProvider.ondisplayMovies),
        MovieSlider(
          movies: moviesProvider.popularMovie,
          title: "Populares",
        )
      ])),
    );
  }
}
