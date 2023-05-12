import 'package:dam_u4_proyecto1_19400660/pages/bitacora.dart';
import 'package:dam_u4_proyecto1_19400660/pages/bitacoraadd.dart';
import 'package:dam_u4_proyecto1_19400660/pages/capturavehiculo.dart';
import 'package:dam_u4_proyecto1_19400660/pages/filtrarauto.dart';
import 'package:dam_u4_proyecto1_19400660/pages/filtrardpto.dart';
import 'package:dam_u4_proyecto1_19400660/pages/filtrarfecha.dart';
import 'package:dam_u4_proyecto1_19400660/pages/home.dart';
import 'package:dam_u4_proyecto1_19400660/pages/modificarb.dart';
import 'package:dam_u4_proyecto1_19400660/pages/modificarvehiculo.dart';
import 'package:dam_u4_proyecto1_19400660/paginacion.dart';
import 'package:flutter/material.dart';
//importaciones de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coches',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> const paginacion(),
        '/add':(context)=> const capturarvehiculo(),
        '/edit':(context)=>const modificarvehiculo(),
        '/addB':(context)=>const bitacotaadd(),
        '/editB':(context)=>const modificarb(),
        '/filtradoB':(context)=> const filtrarfecha(),
        '/filtradoP':(context)=> const filtrarauto(),
        '/filtradoD':(context)=> const filtrardpto()
      },
    );
  }
}