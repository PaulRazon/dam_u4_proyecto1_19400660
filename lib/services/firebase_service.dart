import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> consultarCoches() async{
  List coches =[];
  CollectionReference collectionVehiculos = db.collection('vehiculo');
  QuerySnapshot qvehiculos= await collectionVehiculos.get();
  qvehiculos.docs.forEach((documento) {
    final Map<String,dynamic> data = documento.data() as Map<String,dynamic>;
    final vehiculo={
      "uid": documento.id,
      "placa":data['placa'],
      "tipo":data['tipo'],
      "numeroserie":data['numeroserie'],
      "combustible":data['combustible'],
      "tanque":data['tanque'],
      "trabajador":data['trabajador'],
      "depto":data['depto'],
      "resguardadopor":data['resguardadopor']
    };
    coches.add(vehiculo);
  });
  await Future.delayed(const Duration(seconds: 5));
  return coches;
}
Future<void> insertarV(String placa,String tipo,String niv,String combustible,int tanque,String trabajador,String dpto,String resguardado) async{
  await db.collection("vehiculo").add({
    "placa":placa,
    "tipo":tipo,
    "numeroserie":niv,
    "combustible":combustible,
    "tanque":tanque,
    "trabajador":trabajador,
    "depto":dpto,
    "resguardadopor":resguardado
  });
}
Future<void> modificarV(String uid,String placa,String tipo,String niv,
    String combustible,int tanque,String trabajador,String dpto,String resguardado) async{
    await db.collection("vehiculo").doc(uid).set({
      "placa":placa,
      "tipo":tipo,
      "numeroserie":niv,
      "combustible":combustible,
      "tanque":tanque,
      "trabajador":trabajador,
      "depto":dpto,
      "resguardadopor":resguardado
    });
}

Future<void> deleteV(String uid)async{
  await db.collection("vehiculo").doc(uid).delete();
}



//para bitacora
Future<List> consultarBitacora() async{
  List bitacora =[];
  CollectionReference collectionBitacora = db.collection('bitacora');
  QuerySnapshot qbitacora= await collectionBitacora.get();
  qbitacora.docs.forEach((documento) {
    final Map<String,dynamic> data = documento.data() as Map<String,dynamic>;
    final bitacoras={
      "uid": documento.id,
      "evento":data['evento'],
      "fecha":data['fecha'],
      "fechaverificacion":data['fechaverificacion'],
      "placa":data['placa'],
      "verifico":data['verifico'],
      "recursos":data['recursos'],
    };
    bitacora.add(bitacoras);
  });

  await Future.delayed(const Duration(seconds: 5));
  return bitacora;
}

Future<List> consultarDpto(String dpto) async{
  List coches =[];
  var collectionVehiculos = db.collection('vehiculo').where('depto', isEqualTo: dpto);
  QuerySnapshot qvehiculos= await collectionVehiculos.get();
  qvehiculos.docs.forEach((documento) {
    final Map<String,dynamic> data = documento.data() as Map<String,dynamic>;
    final vehiculo={
      "uid": documento.id,
      "placa":data['placa'],
      "tipo":data['tipo'],
      "numeroserie":data['numeroserie'],
      "combustible":data['combustible'],
      "tanque":data['tanque'],
      "trabajador":data['trabajador'],
      "depto":data['depto'],
      "resguardadopor":data['resguardadopor']
    };
    coches.add(vehiculo);
  });
  await Future.delayed(const Duration(seconds: 5));
  return coches;
}

Future<List> consultarPlaca(String placa) async{
  List coches =[];
  var collectionVehiculos = db.collection('vehiculo').where('placa', isEqualTo: placa);
  QuerySnapshot qvehiculos= await collectionVehiculos.get();
  qvehiculos.docs.forEach((documento) {
    final Map<String,dynamic> data = documento.data() as Map<String,dynamic>;
    final vehiculo={
      "uid": documento.id,
      "placa":data['placa'],
      "tipo":data['tipo'],
      "numeroserie":data['numeroserie'],
      "combustible":data['combustible'],
      "tanque":data['tanque'],
      "trabajador":data['trabajador'],
      "depto":data['depto'],
      "resguardadopor":data['resguardadopor']
    };
    coches.add(vehiculo);
  });
  await Future.delayed(const Duration(seconds: 5));
  return coches;
}
Future<List> consultarBitacoraB(String fecha) async{
  List bitacora =[];
  var collectionBitacora = db.collection('bitacora').where('fecha', isEqualTo: fecha);
  QuerySnapshot qbitacora= await collectionBitacora.get();
  qbitacora.docs.forEach((documento) {
    final Map<String,dynamic> data = documento.data() as Map<String,dynamic>;
    final bitacoras={
      "uid": documento.id,
      "evento":data['evento'],
      "fecha":data['fecha'],
      "fechaverificacion":data['fechaverificacion'],
      "placa":data['placa'],
      "verifico":data['verifico'],
      "recursos":data['recursos'],
    };
    bitacora.add(bitacoras);
  });

  await Future.delayed(const Duration(seconds: 5));
  return bitacora;
}

Future<void> insertarB(String evento,String fecha,
    String fechav,String placa,String verifico,String recursos) async{
  await db.collection("bitacora").add({
    "evento":evento,
    "fecha":fecha,
    "fechaverificacion":fechav,
    "placa":placa,
    "verifico":verifico,
    "recursos":recursos,
  });
}
Future<void> modificarB(String uid,String evento,String fecha,String placa,String verifico,String fechav,String recursos) async{
  await db.collection("bitacora").doc(uid).set({
    "evento":evento,
    "fecha":fecha,
    "fechaverificacion":fechav,
    "placa":placa,
    "verifico":verifico,
    "recursos":recursos,
  });
}


