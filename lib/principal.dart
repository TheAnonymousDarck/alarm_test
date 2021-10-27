//import 'package:alarm_test/background.dart';
import 'package:alarm_test/background.dart';
import 'package:alarm_test/data.dart';
import 'package:alarm_test/form.dart';
import 'package:alarm_test/main.dart';
import 'package:alarm_test/models/alarm_info.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [Fondo(), _Titulo(), _Cards()],
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key? key}) : super(key: key);

  String? get scheduledNotificationDateTime => null;

  get floatingActionButton => null;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    return SingleChildScrollView(
      child: Column(children: [
        //Fondo(),
        Container(
          //padding: EdgeInsets.all(32),
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('Mis Tareas',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text('$formattedDate',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 20),
                ],
              ),
              Expanded(child: Container()),
              //Icon(Icons.add_box_outlined, color: Colors.white, size: 40)//agreagar onpressed
              /*---FloatingActionButton(
                  //backgroundColor: Color.fromRGBO(255, 43, 29, 100),
                  backgroundColor: Color(0x00000000),
                  child: Icon(Icons.add_box_outlined, color: Colors.white, size:40),
                  onPressed: (){
                    /*Navigator.pop(context);*/
                    print('hola');
                    Navigator.push(context, route)
                  },
                )---*/
              _AgregarAlarma(),
            ],
          ),
        ),
      ]),
    );
  }
}

class _AgregarAlarma extends StatelessWidget {
  const _AgregarAlarma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Formulario(),
          ),
        )
      },
      color: Colors.white,
      iconSize: 40,
      icon: Icon(Icons.add_alarm),
    );
  }
}

class _Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),250 o 150
      padding: EdgeInsets.fromLTRB(20, 150, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _LvCards(),
          ),
        ],
      ),
    );
  }
}

class _LvCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: alarms.map((alarm) {
        return Container(
          margin: const EdgeInsets.only(bottom: 25),
          //padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
          //height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(255, 43, 29, 100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Titulo',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Switch(
                    onChanged: (bool value) {},
                    value: true,
                    activeColor: Colors.white,
                  ),
                ],
              ),
              Text('Descripción',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Color.fromRGBO(65, 29, 31, 100)),
                      child: Text('DateTime',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold))),
                  //Text('12:00 AM', style: TextStyle(color:Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
