import 'package:el_buen_comensal/theme/app_theme.dart';
import 'package:el_buen_comensal/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarHome(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LineSeparator(),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  RestaurantSlider(),
                  SizedBox(height: 20),
                  RestaurantSlider(),
                  SizedBox(height: 20),
                  RestaurantSlider(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:ButtonBarHome() ,
      
    );
  }
}



class LineSeparator extends StatelessWidget {
  const LineSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 1,
      
      decoration: BoxDecoration(
        border: null,
        color: Colors.black.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2), 
            // changes position of shadow
          ),
        ],
      ),
    );
  }
}