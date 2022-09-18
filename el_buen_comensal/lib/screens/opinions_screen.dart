import 'package:el_buen_comensal/widgets/button_bar_home.dart';
import 'package:flutter/material.dart';

class OpinionsScreen extends StatelessWidget {
   
  const OpinionsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
         child: Text('OpinionsScreen'),
      ),
      bottomNavigationBar:ButtonBarHome(position: 3)
    );
  }
}