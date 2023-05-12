import 'package:dam_u4_proyecto1_19400660/pages/bitacora.dart';
import 'package:dam_u4_proyecto1_19400660/pages/home.dart';
import 'package:flutter/material.dart';


class paginacion extends StatefulWidget {
  const paginacion({Key? key}) : super(key: key);

  @override
  State<paginacion> createState() => _paginacion();
}

class _paginacion extends State<paginacion> {
  int _indice =0;
  void cambiarIndex(int index){
    setState(() {
      _indice=index;
    });
  }
  List<Widget> _paginas=[
    home(),
    bitacora()
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Vehiculos"),
          BottomNavigationBarItem(icon: Icon(Icons.note_alt_outlined),label: "Bitacoras")
        ],
        currentIndex: _indice,
        backgroundColor: Colors.green,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.grey,
        onTap: cambiarIndex,
      ),
    );
  }
}
