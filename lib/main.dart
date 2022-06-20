import 'package:peliculas_app_jany/providers/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app_jany/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(appstate());

class appstate extends StatelessWidget {
  const appstate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieProviders(),
          lazy: false,
        )
      ],
      child: Myapp(),
    );
  }
} //para que se ejecute el archivo Myapp()

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //quitar etiqueta modo debug
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      //configurar rutas
      initialRoute:
          'home', //cuando tiene muchos archivos que ejecute por defecto el archivo home

      routes: {
        //especificar rutas
        'home': (_) => HomeScreens(), // ( _ ) ->resumido
        'detalles': (_) => DetallesScreens(),
      },
      //cambiar color appbar directamente
      theme: ThemeData.light()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.indigo)),
    );
  }
}
