import 'package:el_buen_comensal/widgets/button_bar_home.dart';
import 'package:el_buen_comensal/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class Comments extends StatelessWidget {
   
  const Comments({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarSimple(title: "Comentarios",),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (_, int index) => CommentsList()  )
            )
          
        ]
      ),
      bottomNavigationBar:ButtonBarHome(position: 2) 
    );
  }
}

class CommentsList extends StatelessWidget {
  const CommentsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical:  10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Restaurante de super restaurantes", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Row(
            
            children: [
              Icon(Icons.star, color: AppTheme.primary_yellow , size: 25,),
              Icon(Icons.star, color: AppTheme.primary_yellow , size: 25,),
              Icon(Icons.star, color: AppTheme.primary_yellow , size: 25,),
              Icon(Icons.star, color: AppTheme.primary_yellow , size: 25,),
              Icon(Icons.star, color: AppTheme.primary_yellow , size: 25,),
              SizedBox(width: 10),
              Text("5", style: TextStyle(fontSize: 20)),
              SizedBox(width: 10),
            ],
          ),
          Text("Is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", style: TextStyle(fontSize: 12, fontWeight:FontWeight.w300 )),
          SizedBox(height: 10),
          Container(height: 1, color: AppTheme.dark_gray,)
        ]),
    );
  }
}