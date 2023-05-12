import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key, key}) : super(key: Key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formkey = GlobalKey<FormState>();
  //Récupérations
  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();
  String selectedConfType = 'talk';
  DateTime selectedConfDate = DateTime.now();

  //Pour libérer n peu de mémoire
  @override
  void dispose() {
    super.dispose();

    confNameController.dispose();
    speakerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom Conference',
                  hintText: 'Entrer le nom de la conférence',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tu dois completer ce texte";
                  }
                  return null;
                },
                controller: confNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom du Speaker',
                  hintText: 'Entrer le nom du speaker',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tu dois completer ce texte";
                  }
                  return null;
                },
                controller: speakerNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: DropdownButtonFormField(
                  items: [
                    DropdownMenuItem(value: 'talk', child: Text("Talk show")),
                    DropdownMenuItem(value: 'demo', child: Text("Demo code")),
                    DropdownMenuItem(value: 'partner', child: Text("Partner")),
                  ],
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  value: selectedConfType,
                  onChanged: (value) {
                    setState(() {
                      selectedConfType = value!;
                    });
                  }),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'Choisir une date',
                ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) =>
                    (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  setState(() {
                    selectedConfDate = value;
                  });
                },
              ),
            ),
            SizedBox(
              width:
                  double.infinity, //pour qu'il prend le max de place possible
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      //Pour récupérer le contenu des champs
                      final confName = confNameController.text;
                      final speakerName = speakerNameController.text;

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Envoi en cours...")));
                      FocusScope.of(context).requestFocus(
                          FocusNode()); //Permet d'enlever le clavier quand on envoi
                      //Affichage en console
                      print("Ajout de la conf $confName par le speaker $speakerName");
                      print("Type de conference $selectedConfType");
                      print("Date de la conf $selectedConfDate");
                    }
                  },
                  child: Text("Envoyer")),
            )
          ],
        ),
      ),
    );
  }
}
