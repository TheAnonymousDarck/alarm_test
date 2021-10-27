import 'package:flutter/material.dart';

class Fondo extends StatelessWidget {
  const Fondo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_Caja()],
    );
  }
}

class _Caja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 150, //250 o 150
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(80),
              bottomLeft: Radius.circular(50),
              //bottomRight:
            ),
            color: Color.fromRGBO(
                255, 43, 29, 100), //color del contenedor mistareas
          )
          // color: Color.fromRGBO(50, 100, 150, 100)),
          ),
    );
  }
}
