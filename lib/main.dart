import 'package:asynconf/pages/add_event_page.dart';
import 'package:asynconf/pages/even_page.dart';
import 'package:asynconf/pages/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //Sauvegarder le numero de la page actuelle surlaquelle on se trouve

  int _currentIndex = 0;

    //methode setCurrentIndex ou setCurrentPage pour mettre à jour ce numero de page
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: [//pour que le texte soit différent dans chaque page
            Text("Accueil"),
            Text("Liste des conferences"),
            Text("Formulaire"),
          ][_currentIndex],
        ),
        body: [ //changement de page
          HomePage(),
          EvenPage(),
          AddEventPage()
        ][_currentIndex],//numero de page de manière automatique
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setCurrentIndex(index),//onTap actualisation, si on clique sur une page que sa puisse passer
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          iconSize: 32,
          elevation: 10,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Planning',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Ajout',
            ),
          ],
        ),
      ),
    );
  }
}
