import 'package:el_buen_comensal/widgets/button_bar_home.dart';
import 'package:flutter/material.dart';

class LoveItScreen extends StatelessWidget {
   
  const LoveItScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('LoveItScreen'),
      ),
      bottomNavigationBar:ButtonBarHome(position: 2) 
    );
  }
}