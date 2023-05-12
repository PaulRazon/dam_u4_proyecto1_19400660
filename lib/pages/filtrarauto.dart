import 'package:dam_u4_proyecto1_19400660/services/firebase_service.dart';
import 'package:flutter/material.dart';

class filtrarauto extends StatefulWidget {
  const filtrarauto({Key? key}) : super(key: key);

  @override
  State<filtrarauto> createState() => _filtrarautoState();
}

class _filtrarautoState extends State<filtrarauto> {
  @override
  Widget build(BuildContext context) {
    final Map arguments=ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: Text("Filtrado"),centerTitle: true,),
      body: FutureBuilder(
        future: consultarPlaca(arguments['placa']),
        builder: (context,snapshot){
          if(snapshot.hasData){

            return ListView.builder(
                itemCount:snapshot.data?.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(snapshot.data?[index]['trabajador']),
                    subtitle: Text("NIV:"+snapshot.data?[index]['numeroserie']),
                    leading: Text("depto:"+snapshot.data?[index]['depto']),
                    trailing: Text(snapshot.data?[index]['placa']),
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
