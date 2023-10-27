import 'package:flutter/material.dart';
import 'package:lp_tools/age.dart';
import 'package:lp_tools/weather.dart';
import 'university_screen.dart';
import 'dictionary.dart';
import 'wordpress.dart';
import 'gender_by_name.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MainPage(),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Asigna la clave al Scaffold
      appBar: AppBar(
        title: const Text('LP_Tools'),
        centerTitle:true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.menu), // Icono del menú
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer(); // Abre el Drawer
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black54,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const Center (
              child: UserAccountsDrawerHeader(
              
              accountName: Text("Luis Pichardo"),
              accountEmail: Text("20211928@itla.edu.do"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/Me.png'),
              ),
              decoration: BoxDecoration(
              color: Color.fromARGB(255, 160, 142, 115), 
              ),
            ),
            ),
            ListTile(
              title: const Text('Acerca de', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white), ),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const AboutAppScreen()));
                
              },
            ),
            ListTile(
              title: const Text('Creditos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const CreditsAppScreen()));
              },
            ),
            ListTile(
              title: const Text('Contacto', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const HireAppScreen()));
              },
            ),
          ],
        ),
      ),
      body: Column(
          children: <Widget>[
            // Widget para mostrar el texto en la parte superior
            Container(
            width: 520,
            color: Colors.blueGrey,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(35.0),
            decoration: null,
            child: const Text(
              'Donde las herramientas y la creatividad se unen.',
              style: TextStyle(
                fontWeight: FontWeight.bold,  // Agregar negrita
                color: Colors.white,  // Cambiar el color del texto
                fontSize: 15,  // Tamaño del texto (ajusta según tus preferencias)
              ),
            ),
          ),
            // Widget para mostrar la imagen
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/BG_MainPage.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Widget para mostrar el botón con nombre e icono
            Container(
              width: 520,
              color: Colors.blueGrey,
              decoration: null,
              padding: const EdgeInsets.all(35.0), // Añade espaciado alrededor del botón
              child: ElevatedButton.icon(
                onPressed: () {
                  // Lógica cuando se presiona el botón
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => const CardOptions()));
                },
                icon: const Icon(Icons.input_outlined), // Icono del botón
                label: const Text('INICIAR'), // Texto del botón
              ),
            ),
          ],
        ),
    
    );
  }
}

//Pantalla de opciones de herramientas...
class CardOptions extends StatelessWidget {
  const CardOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tools Kit'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(40),
                  child: const Text(
                    'Selecciona una opción:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 10,
                          left: 35,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const GenderPredictionScreen()));
                          },
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.group_add_outlined, size: 80, color: Colors.blue),
                              Text('Genero', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 35,
                          left: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AgePredictionScreen()));
                          },
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.child_care_outlined, size: 80, color: Colors.green),
                              Text('Edad', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 10,
                          left: 35,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherScreen()));
                          },
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.wb_sunny_outlined, size: 80, color: Colors.orange),
                              Text('Clima', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 35,
                          left: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const WordPressNewsScreen()));
                          },
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.public, size: 80, color: Colors.purple),
                              Text('WordPress', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 10,
                          left: 35,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const UniversitiesScreen()));
                          },
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.school_outlined, size: 80, color: Colors.amber),
                              Text('University', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 35,
                          left: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ThesaurusScreen()));
                          },
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.book_online_outlined, size: 80, color: Colors.blue),
                              Text('Dictionary', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            top: 520,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  '"¡Herramientas para cada tarea en un solo lugar!"',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,),
                ),
                SizedBox(height: 20, width: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//Pantalla para la opcion "Acerca de" del menu...
class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de "LP_Tools"'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey, 
      body: Center(
        child: Container(
          height: 550,
          margin: const EdgeInsets.all(16), 
          padding: const EdgeInsets.all(16), 
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(8), 
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5, 
              ),
            ],
          ),
          child: const SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Acerca de la Aplicación',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 12),
                Text(
                  '¡Bienvenido a nuestra aplicación de herramientas! Esta aplicación es el resultado de una pasión por la tecnología y la creatividad.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Esta caja de herramientas virtual está diseñada para brindarte una amplia variedad de funciones útiles en un solo lugar. Desde la predicción de géneros y edades hasta información detallada sobre universidades, datos meteorológicos en tiempo real y las últimas noticias de WordPress, nuestra aplicación está diseñada para hacerte la vida más fácil y entretenida.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Cada característica ha sido cuidadosamente desarrollada para proporcionarte una experiencia de usuario sencilla y eficaz. Nuestra misión es ofrecer soluciones prácticas a tus necesidades cotidianas.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Estamos agradecidos por la oportunidad de desarrollar esta aplicación para ti. Agradecemos tu confianza y apoyo. Los créditos y agradecimientos se encuentran en la sección "Créditos" de la aplicación, donde mencionamos a quienes contribuyeron a hacer esto posible.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Gracias por ser parte de nuestra comunidad. ¡Esperamos que disfrutes usando esta aplicación tanto como nosotros disfrutamos creándola!',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Pantalla para la opcion "Creditos" del menu...
class CreditsAppScreen extends StatelessWidget {
  const CreditsAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creditos'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey, 
      body: Center(
        child: Container(
          height: 550,
          margin: const EdgeInsets.all(16), 
          padding: const EdgeInsets.all(16), 
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(8), 
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5, 
              ),
            ],
          ),
          child: const SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                SizedBox(height: 16),
                Text(
                  'Creditos',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'Desarrollador de la Aplicación:',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'Luis Pichardo',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'Luis Pichardo es el talentoso desarrollador detrás de esta aplicación. Su dedicación y habilidades han hecho posible que esta caja de herramientas virtual sea una realidad.',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                SizedBox(height: 15),
                Text(
                  'Idea y Documentación:',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 15),
                Text(
                  'Amadis Suarez',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 15),
                Text(
                  'Amadis Suarez contribuyó con la visión y la documentación inicial de esta aplicación. Su creatividad e ideas innovadoras han sido fundamentales para dar forma a esta herramienta multifuncional.',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                SizedBox(height: 15),
                Text(
                  'Agradecemos a Luis Pichardo y Amadis Suarez por su valiosa contribución para hacer de esta aplicación una realidad. Su pasión y esfuerzo son evidentes en cada función y detalle de esta aplicación.',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'Desarrollado por Luis Pichardo. Desde República Dominicana. ',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                Text(
                  'S.P.M 17-10-2023',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Pantalla para la opcion "Contacto" del menu...
class HireAppScreen extends StatelessWidget {
  const HireAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacto"'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey, 
      body: Center(
        child: Container(
          height: 550,
          width: 350,
          margin: const EdgeInsets.all(16), 
          padding: const EdgeInsets.all(16), 
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(8), 
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5, 
              ),
            ],
          ),
          child: const SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
              backgroundImage: AssetImage('assets/Me.png'), 
              radius: 80, 
            ),
            SizedBox(height: 20), 
            Text(
              'Luis Pichardo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Teléfono:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            SizedBox(height: 20),
            Text(
              '+1 809-878-0828',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              'Correo:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            SizedBox(height: 20),
            Text(
              '20211928@itla.edu.do',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'YouTube:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            SizedBox(height: 20),
            Text(
              '@code-geek',
              style: TextStyle(fontSize: 18,),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}