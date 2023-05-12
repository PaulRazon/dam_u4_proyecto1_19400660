import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class modificarb extends StatefulWidget {
  const modificarb({Key? key}) : super(key: key);

  @override
  State<modificarb> createState() => _modificarbState();
}

class _modificarbState extends State<modificarb> {

  final verificocontroller = TextEditingController();
  final fechaverificacioncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map arguments=ModalRoute.of(context)!.settings.arguments as Map;
    verificocontroller.text = arguments['verifico'];
    fechaverificacioncontroller.text = arguments['fechaverificacion'];

    return Scaffold(
        appBar: AppBar(title: Text("Modificar Vehiculo"),centerTitle: true,),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30,0,30,70),
              child: Column(children: [
                TextField(controller:verificocontroller,decoration: InputDecoration(
                    labelText: "Verifico"
                ),style: TextStyle(fontSize: 12),),
                TextField(controller:fechaverificacioncontroller,decoration: InputDecoration(
                    labelText: "Fecha verificacion"
                ),style: TextStyle(fontSize: 12),),
                ElevatedButton(onPressed: () async{
                  await modificarB(arguments['uid'],arguments['evento'],arguments['fecha'],arguments['placa'],verificocontroller.text, fechaverificacioncontroller.text
                    ,arguments['recursos'])
                      .then((_) => {
                    Navigator.pop(context)
                  });
                },

                    child: Text("Actualizar"))
              ],),
            )
          ],
        )

    );
  }
}
