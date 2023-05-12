import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final placacontroller = TextEditingController();
  final dptocontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Servicio de Vehiculos"),centerTitle: true,),
      body: ListView(
        children: [
          Column(children: [
            TextField(controller:placacontroller,decoration: InputDecoration(
              labelText: "Filtrar Placa",
            ),),
            TextButton(onPressed: ()async{
              await Navigator.pushNamed(context, '/filtradoP',arguments: {"placa":placacontroller.text});
              setState(() {});
            }, child: Icon(Icons.search)),
            TextField(controller:dptocontroller,decoration: InputDecoration(
              labelText: "Filtrar dpto",
            ),),
            TextButton(onPressed: ()async{
              await Navigator.pushNamed(context, '/filtradoD',arguments: {"depto":dptocontroller.text});
              setState(() {});
            },child: Icon(Icons.search)),
          ],),
          Container(height: 200,child: FutureBuilder(
            future: consultarCoches(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount:snapshot.data?.length,
                    itemBuilder: (context,index){
                      return Dismissible(
                          onDismissed: (direction)async{
                            await deleteV(snapshot.data?[index]['uid']);
                            setState(() {
                              snapshot.data?.removeAt(index);
                            });
                          },
                          confirmDismiss: (direction) async{
                            bool result= false;
                            result = await showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: Text("¿Desea Borrar Vehiculo ${snapshot.data?[index]['placa']}?"),
                                actions: [
                                  TextButton(onPressed: (){
                                    return Navigator.pop(context,true);
                                  }, child: Text("SI")),
                                  TextButton(onPressed: (){
                                    return Navigator.pop(context,false);
                                  }, child: Text("NO",style: TextStyle(color: Colors.red),)),
                                ],
                              );
                            });
                            return true;
                          },
                          background: Container(
                              child: Icon(Icons.delete),
                              color: Colors.red
                          ),
                          direction: DismissDirection.startToEnd,
                          key: Key(snapshot.data?[index]['uid'])
                          ,
                          child:  ListTile(
                              title: Text(snapshot.data?[index]['trabajador']),
                              subtitle: Text("NIV:"+snapshot.data?[index]['numeroserie']),
                              leading: Text("depto:"+snapshot.data?[index]['depto']),
                              trailing: Text(snapshot.data?[index]['placa']),
                              onLongPress: (){

                              },
                              onTap: ()async{
                                await Navigator.pushNamed(context, '/edit',arguments:{
                                  "uid":snapshot.data?[index]['uid'],
                                  "placa":snapshot.data?[index]['placa'],
                                  "tipo":snapshot.data?[index]['tipo'],
                                  "numeroserie":snapshot.data?[index]['numeroserie'],
                                  "combustible":snapshot.data?[index]['combustible'],
                                  "tanque":snapshot.data?[index]['tanque'],
                                  "trabajador":snapshot.data?[index]['trabajador'],
                                  "depto":snapshot.data?[index]['depto'],
                                  "resguardadopor":snapshot.data?[index]['resguardadopor']
                                }
                                );
                                setState(() {});
                              }

                          ));


                    });

              }else{
                return const Center(child: CircularProgressIndicator(),);
              }

            },
          )),

        ],
      ),

     floatingActionButton: FloatingActionButton(onPressed: ()async{
        await Navigator.pushNamed(context, '/add');
        setState(() {});
    },child: Icon(Icons.add),),

    );
  }
}
