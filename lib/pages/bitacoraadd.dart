import 'package:dam_u4_proyecto1_19400660/services/firebase_service.dart';
import 'package:flutter/material.dart';

class bitacotaadd extends StatefulWidget {
  const bitacotaadd({Key? key}) : super(key: key);

  @override
  State<bitacotaadd> createState() => _bitacotaaddState();
}

class _bitacotaaddState extends State<bitacotaadd> {

  final placacontroller = TextEditingController();
  final fechacontroller = TextEditingController();
  final verificocontroller = TextEditingController();
  final fechaverificacioncontroller = TextEditingController();
  final eventocontroller = TextEditingController();
  final recursoscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Captura Bitacora"),centerTitle: true,),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30,0,30,70),
              child: Column(children: [
                TextField(controller:placacontroller,decoration: InputDecoration(
                  labelText: "Placa",
                ),style: TextStyle(fontSize:12 ),),
                TextField(controller:fechacontroller,decoration: InputDecoration(
                    labelText: "Fecha"
                ),style: TextStyle(fontSize: 12),),
                TextField(controller:verificocontroller,decoration: InputDecoration(
                    labelText: "¿Quien verifica?"
                ),style: TextStyle(fontSize: 12),),
                TextField(controller:fechaverificacioncontroller,decoration: InputDecoration(
                    labelText: "Fecha verificacion"
                ),style: TextStyle(fontSize: 12),),
                TextField(controller:eventocontroller,decoration: InputDecoration(
                    labelText: "Evento"
                ),style: TextStyle(fontSize: 12),),
                TextField(controller:recursoscontroller,decoration: InputDecoration(
                    labelText: "Recursos"
                ),style: TextStyle(fontSize: 12),),
                ElevatedButton(onPressed: ()async{
                  await insertarB(eventocontroller.text, fechacontroller.text, fechaverificacioncontroller.text,
                      placacontroller.text,verificocontroller.text,recursoscontroller.text).then((_){
                    Navigator.pop(context);
                  });

                }, child: Text("Guardar"))
              ],),
            )
          ],
        )
    );
  }
}
