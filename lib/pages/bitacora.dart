import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class bitacora extends StatefulWidget {
  const bitacora({Key? key}) : super(key: key);

  @override
  State<bitacora> createState() => _bitacoraState();
}

class _bitacoraState extends State<bitacora> {
  final fechacontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AÑADIR BITACORAS"),centerTitle: true,),
      body: ListView(children: [
        Column(children: [
          TextField(controller:fechacontroller,decoration: InputDecoration(
            labelText: "Filtrar fecha",
          ),),
          TextButton(onPressed: ()async{
            await Navigator.pushNamed(context, '/filtradoB',arguments: {"fecha":fechacontroller.text});
            setState(() {});
          },child: Icon(Icons.search)),


        ],),

        Container(height: 200,child: FutureBuilder(
          future: consultarBitacora(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount:snapshot.data?.length,
                  itemBuilder: (context,index){
                    return ListTile(

                        title: Text(snapshot.data?[index]['placa']),
                        subtitle: Text("Fecha:"+snapshot.data?[index]['fecha']),
                        leading: Text("Verificó:"+snapshot.data?[index]['verifico']),

                        onLongPress: (){

                        },
                        onTap: ()async{
                          await Navigator.pushNamed(context, '/editB',arguments:{
                            "uid":snapshot.data?[index]['uid'],
                            "evento":snapshot.data?[index]['evento'],
                            "fecha":snapshot.data?[index]['fecha'],
                            "fechaverificacion":snapshot.data?[index]['fechaverificacion'],
                            "placa":snapshot.data?[index]['placa'],
                            "verifico":snapshot.data?[index]['verifico'],
                            "recursos":snapshot.data?[index]['recursos'],
                          }
                          );
                          setState(() {});
                        }

                    );

                  });

            }else{
              return const Center(child: CircularProgressIndicator(),);
            }

          },
        ))
      ],

      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
      await Navigator.pushNamed(context, '/addB');
      setState(() {});
    },child: Icon(Icons.add),)

    );
  }

}
