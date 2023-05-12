import 'package:flutter/material.dart';

// class EventPage extends StatelessWidget {
//   const EventPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Planning du salon"),
//       ),
//       body: Center(
//         child: ListView(
//           children: [
//             Card(
//             child: ListTile(
//               leading: Image.asset("assets/images/lior.jpg"),
//               title: Text('Lior Chamla(13h à 13h 30)'),
//               subtitle:
//                   Text('Le code Legacy'),
//               trailing: Icon(Icons.more_vert),
//             ),
//             ),
//             Card(
//             child: ListTile(
//               leading: Image.asset("assets/images/damien.jpg"),
//               title: Text('Dalien Cavallès (17h 30 à 18h)'),
//               subtitle:
//                   Text('Git blame --no-offense ?'),
//               trailing: Icon(Icons.info),
//             ),
//             ),
//             Card(
//             child: ListTile(
//               leading: Image.asset("assets/images/defendintelligence.jpg"),
//               title: Text('Defend intelligence (18h à 18h 30)'),
//               subtitle:
//                   Text('A la découverte des IA génératif'),
//               trailing: Icon(Icons.more_vert),
//             ),
//             ),

//           ],
//         )
//       ),
//     );
//   }
// }

class EvenPage extends StatefulWidget {
  const EvenPage({Key? key}) : super(key: key);

  @override
  State<EvenPage> createState() => _EvenPageState();
}

class _EvenPageState extends State<EvenPage> {
  final Events = [
    {
      "speaker": "Lior Chamla",
      "date": "13h à 13h 30",
      "subject": "Le code Legacy",
      "avatar": "lior"
    },
    {
      "speaker": "Damien Cavallaire",
      "date": "17h 30 à 18h",
      "subject": "Git blame --no-offense ?",
      "avatar": "damien"
    },
    {
      "speaker": "Defend intelligence",
      "date": "18h à 18h 30",
      "subject": "A la découverte des IA génératif",
      "avatar": "defendintelligence"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
          itemCount: Events.length,
          itemBuilder: (context, index) {
            final event = Events[index];
            //ou final avatar = event['avatar'];

            return Card(
              child: ListTile(
                leading: Image.asset("assets/images/${event["avatar"]}.jpg"),
                //ou leading:Image.asset("assets/images/$avatar.jpg")
                title: Text('${event["speaker"]} (${event["date"]})'),
                subtitle: Text('${event["subject"]}'),
                trailing: Icon(Icons.more_vert),
              ),
            );
          },
        ),
      );
  }
}



