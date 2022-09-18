import 'package:el_buen_comensal/widgets/button_bar_home.dart';
import 'package:flutter/material.dart';

class HaveToGoScreen extends StatelessWidget {
   
  const HaveToGoScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('HaveToGoScreen'),
      ),
      bottomNavigationBar:ButtonBarHome(position: 1) 
    );
  }
}