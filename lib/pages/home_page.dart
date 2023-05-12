import 'package:asynconf/pages/even_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/logo.svg",
            color: Colors.blue,
          ),
          Text(
            'Asynconf 2022',
            style: TextStyle(fontSize: 42, fontFamily: 'Poppins'),
          ),
          Text(
            "Salon virtuel de l'informatique.Du 27 au 29 octobre 2022",
            style: TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          //Si on ajoute pas d'icone
          // ElevatedButton(
          //   style: ButtonStyle(
          //     padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
          //     backgroundColor: MaterialStatePropertyAll(Colors.green),
          //   ),
          //   onPressed: ()=>print("click btn"),
          //   child: Text("Afficher le panning",
          //   style: TextStyle(
          //     fontSize: 20),
          //     ),
          //   ),
          
          // ElevatedButton.icon(//Par si je veux ajouter une icone
          //   style: ButtonStyle(
          //     padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
          //     backgroundColor: MaterialStatePropertyAll(Colors.green),
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       PageRouteBuilder(
          //         pageBuilder: (_, __, ___) => EvenPage(),
          //       ),
          //     );
          //   },
          //   label: Text(
          //     "Afficher le panning",
          //     style: TextStyle(fontSize: 20),
          //   ),
          //   icon: Icon(Icons.calendar_month),
          // ),
        ],
      ),
    );
  }
}
