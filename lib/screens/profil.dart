import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key, required this.prenom, required this.nom});

  final String prenom;
  final String nom;

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.prenom),
      ),
      body: SafeArea(
        child: FormBuilder(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: FormBuilderTextField(
                  name: "prenom",
                  decoration: const InputDecoration(
                    labelText: "Prenom",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange
                    ),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Entrer votre nom",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1,
                        style: BorderStyle.solid
                      )
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: FormBuilderRadioGroup(
                  name: "genre",
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                  ),
                  options: const [
                    FormBuilderFieldOption(
                      value: "homme",
                      child: Text("Homme"),
                    ),
                    FormBuilderFieldOption(
                      value: "femme",
                      child: Text("Femme"),
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: FormBuilderCheckbox(
                  name: "status",
                  title: Text("Rester connecter"),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: FormBuilderCheckboxGroup(
                  name: "status",
                  options: [
                    FormBuilderFieldOption(
                      value: "homme",
                      child: Text("Homme"),
                    ),
                    FormBuilderFieldOption(
                      value: "femme",
                      child: Text("Femme"),
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: FormBuilderDropdown(
                  name: "status",
                  decoration: InputDecoration(
                    labelText: "Votre ville",
                    border: OutlineInputBorder(

                    )
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text("Conakry"),
                      value: "conakry",
                    ),
                    DropdownMenuItem(
                      child: Text("Mamou"),
                      value: "mamou",
                    ),
                    DropdownMenuItem(
                      child: Text("Kindia"),
                      value: "kindia",
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: FormBuilderSwitch(
                  name: "status",
                  title: Text("Rester connecter"),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: FormBuilderDateTimePicker(
                  name: "date",
                  firstDate: DateTime.parse("2023-01-01"),
                  lastDate: DateTime.parse("2025-01-01"),
                  initialDate: DateTime.now(),
                  inputType: InputType.date,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}