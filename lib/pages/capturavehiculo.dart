import 'package:dam_u4_proyecto1_19400660/services/firebase_service.dart';
import 'package:flutter/material.dart';

class capturarvehiculo extends StatefulWidget {


  const capturarvehiculo({Key? key}) : super(key: key);

  @override
  State<capturarvehiculo> createState() => _capturarvehiculoState();
}

class _capturarvehiculoState extends State<capturarvehiculo> {
  final placacontroller = TextEditingController();
  final tipocontroller = TextEditingController();
  final nivcontroller = TextEditingController();
  final combustiblecontroller = TextEditingController();
  final tanquecontroller = TextEditingController();
  final trabajadorcontroller = TextEditingController();
  final dptocontroller = TextEditingController();
  final resguardadocontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Captura Vehiculo"),centerTitle: true,),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30,0,30,70),
            child: Column(children: [
              TextField(controller:placacontroller,decoration: InputDecoration(
                labelText: "Placa",
              ),style: TextStyle(fontSize:12 ),),
              TextField(controller:tipocontroller,decoration: InputDecoration(
                  labelText: "Tipo Vehiculo"
              ),style: TextStyle(fontSize: 12),),
              TextField(controller:nivcontroller,decoration: InputDecoration(
                  labelText: "NIV"
              ),style: TextStyle(fontSize: 12),),
              TextField(controller:combustiblecontroller,decoration: InputDecoration(
                  labelText: "Combustible"
              ),style: TextStyle(fontSize: 12),),
              TextField(controller:tanquecontroller,decoration: InputDecoration(
                  labelText: "Tanque"
              ),style: TextStyle(fontSize: 12),),
              TextField(controller:trabajadorcontroller,decoration: InputDecoration(
                  labelText: "Trabajador"
              ),style: TextStyle(fontSize: 12),),
              TextField(controller:dptocontroller,decoration: InputDecoration(
                  labelText: "Depto"
              ),style: TextStyle(fontSize: 12),),
              TextField(controller:resguardadocontroller,decoration: InputDecoration(
                  labelText: "Resguardado por:"
              ),style: TextStyle(fontSize: 12),),
              ElevatedButton(onPressed: ()async{
                await insertarV(placacontroller.text, tipocontroller.text, nivcontroller.text,
                    combustiblecontroller.text, int.parse(tanquecontroller.text), trabajadorcontroller.text, dptocontroller.text
                    , resguardadocontroller.text).then((_){
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
