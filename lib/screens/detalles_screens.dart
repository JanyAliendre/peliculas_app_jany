import 'package:peliculas_app_jany/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app_jany/widgets/casting_cards.dart';

class DetallesScreens extends StatelessWidget {
  const DetallesScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
      //cuando se trabaja con mucho contenido usar CustomScrollView
      slivers: [
        //cuando tiene cprchete recibe una lista de elementos
        _CustomAppBar(movie),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(movie), //mostrara la imagen poster y titulo
          _Overview(movie),
          _Overview(movie),
          _Overview(movie),
          _Overview(movie),
          _Overview(movie), //llamar clase texto
          CastingCards(movie.id),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //permite efecto de scrool cambia efecto desaparece la imagen
      backgroundColor: Colors.indigo,
      expandedHeight: 200, //tamano del appbar
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: Text(
            movie.title,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullbackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {
    //crear variable
    final textTheme = Theme.of(context).textTheme;
    final Size = MediaQuery.of(context).size;
    return Container(
        //diseñar poster titulo
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          //para que contenido se pocicione al costado
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                //ctrl + '.' -> envolver dentro de row
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            //llamar a widget column para que muestre contenido uno abajo del otro
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Size.width - 190),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, //posicion
                children: [
                  Text(
                    movie.title,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    movie.originalTitle,
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    //valoraciones
                    children: [
                      Icon(
                        Icons.star_outline,
                        size: 15,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${movie.voteAverage}',
                        style: Theme.of(context).textTheme.caption,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(movie.overview),
    );
  }
}
