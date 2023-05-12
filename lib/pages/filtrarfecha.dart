import 'package:dam_u4_proyecto1_19400660/services/firebase_service.dart';
import 'package:flutter/material.dart';

class filtrarfecha extends StatefulWidget {
  const filtrarfecha({Key? key}) : super(key: key);

  @override
  State<filtrarfecha> createState() => _filtrarfechaState();
}

class _filtrarfechaState extends State<filtrarfecha> {
  @override
  Widget build(BuildContext context) {
    final Map arguments=ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: Text("Filtrado"),centerTitle: true,),
      body: FutureBuilder(
        future: consultarBitacoraB(arguments['fecha']),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount:snapshot.data?.length,
                itemBuilder: (context,index){
                  return ListTile(
                      title: Text(snapshot.data?[index]['placa']),
                      subtitle: Text("Fecha:"+snapshot.data?[index]['fecha']),
                      leading: Text("Verificó:"+snapshot.data?[index]['verifico']),
                        );

                      });
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }

        },
      ),
    );
  }
}
