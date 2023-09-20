// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(GetMaterialApp(
    home: HomePage(),
  ));
}

class MyController extends GetxController {
  var contador = 0.obs;

  void incrementarContador() {
    contador++;
    update();
  }

   void resetarContador() {
    contador.value = 0;
    update(); // Notifica a interface do usuário sobre a mudança na variável 'contador'.
  }
}

class HomePage extends StatelessWidget{
  final MyController controller = Get.put(MyController());
  
  HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Página Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              'Contagem: ${controller.contador}',
              style: TextStyle(fontSize: 24),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                controller.incrementarContador();
              }, 
              child: Text('Incrementar'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.resetarContador(); // Vamos criar esta função em seguida.
              },
              child: Text('Resetar Contador'),
            ),
          ],
        ),
      ),
    );
  }
}



