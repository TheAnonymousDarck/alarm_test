import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Crear Nueva Tarea'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          _inputTarea(),
          SizedBox(
            height: 20,
          ),
          _inputFecha(),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              _inputHoraInicio(),
              SizedBox(height: 20, width: 5),
              _inputHoraFinal(),
              SizedBox(height: 20, width: 0),
            ],
          ),
          _inputDescripcion(),
          SizedBox(
            height: 40,
          ),
          _botonCrearTarea(),
        ],
      ),
    );
  }
}

Widget _inputTarea() {
  return TextField(
    autofocus: false,
    textCapitalization: TextCapitalization.words,
    decoration: InputDecoration(
        labelText: 'Nombre de la tarea',
        icon: Icon(Icons.create_outlined, color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    onChanged: (valor) {},
  );
}

Widget _inputFecha() {
  return TextField(
    autofocus: false,
    textCapitalization: TextCapitalization.words,
    decoration: InputDecoration(
        icon: Icon(Icons.date_range_outlined, color: Colors.white),
        labelText: 'Fecha',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    onChanged: (valor) {},
  );
}

Widget _inputHoraInicio() {
  DateTime _alarmTime;
  String _alarmTimeString = DateFormat('HH:mm').format(DateTime.now());
  ;
  return StatefulBuilder(
    builder: (context, setModalState) {
      return Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              'Hora de Inicio',
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(255, 43, 29, 100)),
            ),
            FlatButton(
              onPressed: () async {
                var selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (selectedTime != null) {
                  final now = DateTime.now();
                  var selectedDateTime = DateTime(now.year, now.month, now.day,
                      selectedTime.hour, selectedTime.minute);
                  _alarmTime = selectedDateTime;
                  setModalState(() {
                    _alarmTimeString =
                        DateFormat('HH:mm').format(selectedDateTime);
                  });
                }
              },
              child: Text(
                _alarmTimeString,
                style: TextStyle(fontSize: 32),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _inputHoraFinal() {
  DateTime _alarmTime;
  String _alarmTimeString = DateFormat('HH:mm').format(DateTime.now());
  ;
  return StatefulBuilder(
    builder: (context, setModalState) {
      return Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              'Hora de Fin',
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(255, 43, 29, 100)),
            ),
            FlatButton(
              onPressed: () async {
                var selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (selectedTime != null) {
                  final now = DateTime.now();
                  var selectedDateTime = DateTime(now.year, now.month, now.day,
                      selectedTime.hour, selectedTime.minute);
                  _alarmTime = selectedDateTime;
                  setModalState(() {
                    _alarmTimeString =
                        DateFormat('HH:mm').format(selectedDateTime);
                  });
                }
              },
              child: Text(
                _alarmTimeString,
                style: TextStyle(fontSize: 32),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _inputDescripcion() {
  return TextField(
    autofocus: false,
    textCapitalization: TextCapitalization.words,
    decoration: InputDecoration(
        icon: Icon(Icons.create_outlined, color: Colors.white),
        labelText: 'Descripción',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    onChanged: (valor) {},
  );
}

Widget _botonCrearTarea() {
  return ElevatedButton(
      onPressed: () {
        //final Notifications noti = new Notifications();
        //noti.init();
        //noti.showNotification();
      },
      child: Text('Crear Tarea'),
      style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(255, 43, 29, 100),
          //fixedSize: const Size(50,20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          textStyle: TextStyle(fontSize: 20)));
}
