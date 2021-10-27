import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormT extends StatefulWidget {
  FormT({Key? key}) : super(key: key);

  @override
  _FormTState createState() => _FormTState();
}

class _FormTState extends State<Form> {
  final _formState = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: guardarDatos,
      ),
      body: FormBuilder(
        key: _formState,
        child: ListView(
          children: [
            FormBuilderTextField(
              name: "nombre",
              decoration: InputDecoration(
                labelText: 'Nombre',
                hintText: 'ingrese un nombre',
              ),
            ),
          ],
        ),
      ),
    );
  }

  guardarDatos() async {
    bool validacion = _formState.currentState!.saveAndValidate();

    if (validacion) {
      print('save');
      final valores = _formState.currentState!.value;
      final nombre = valores['nombre'];
      print(nombre);
    }
  }
}
