import 'package:dam_u4_proyecto1_19400660/services/firebase_service.dart';
import 'package:flutter/material.dart';

class modificarvehiculo extends StatefulWidget {
  const modificarvehiculo({Key? key}) : super(key: key);

  @override
  State<modificarvehiculo> createState() => _modificarvehiculoState();
}

class _modificarvehiculoState extends State<modificarvehiculo> {


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
    final Map arguments=ModalRoute.of(context)!.settings.arguments as Map;
    placacontroller.text = arguments['placa'];
    tipocontroller.text = arguments['tipo'];
    nivcontroller.text = arguments['numeroserie'];
    combustiblecontroller.text = arguments['combustible'];
    tanquecontroller.text = arguments['tanque'].toString();
    trabajadorcontroller.text = arguments['trabajador'];
    dptocontroller.text = arguments['depto'];
    resguardadocontroller.text = arguments['resguardadopor'];
    return Scaffold(
        appBar: AppBar(title: Text("Modificar Vehiculo"),centerTitle: true,),
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
                ElevatedButton(onPressed: () async{
                  await modificarV(arguments['uid'],placacontroller.text, tipocontroller.text, nivcontroller.text,
                      combustiblecontroller.text, int.parse(tanquecontroller.text), trabajadorcontroller.text, dptocontroller.text
                      , resguardadocontroller.text).then((_) => {
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
