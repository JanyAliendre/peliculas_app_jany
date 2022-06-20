import 'package:peliculas_app_jany/models/movie.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;

  const MovieSlider({Key? key, required this.movies, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 260,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              // if(this.widget.title !=null)

              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(this.title!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 5),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (_, int index) => _MoviePoster(movies[index])))
          ],
        ));
  }
}

class _MoviePoster extends StatelessWidget {
  // _ para que sea privada
  final Movie movie;

  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130, //establecer tamanos de cards
        height: 190,
        // color: Colors.green,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          //column recibe una lista de widgrts
          children: [
            GestureDetector(
              // GestureDetector al seleccionar una imagen lleva a otra pantalla
              onTap: () => Navigator.pushNamed(context, 'detalles',
                  arguments: movie), // ontap permite hacer la navegacion
              child: ClipRRect(
                //forma donde se colocara las imagenes
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //detalles
            SizedBox(
              height: 5,
            ), //separar el texto de la imagen del
            Text(
              movie.title,
              maxLines: 2, //para que aparezca el texto en 2 lineas
              overflow: TextOverflow
                  .ellipsis, // overflow.. coloca puntos suspensivos que indica que hay mas contenido
              textAlign: TextAlign.center, //centrar texto
            ),
          ],
        ));
  }
}
