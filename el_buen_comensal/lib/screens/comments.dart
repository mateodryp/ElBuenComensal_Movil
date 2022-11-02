import 'package:el_buen_comensal/providers/comments_provider.dart';
import 'package:el_buen_comensal/widgets/button_bar_home.dart';
import 'package:el_buen_comensal/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Comments.dart';
import '../theme/app_theme.dart';

class Comments extends StatelessWidget {
   
  const Comments({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final comments_provider = Provider.of<CommentsProvider>(context);

    return  Scaffold(
      appBar: AppBarSimple(title: "Comentarios",),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(height: 1, color: AppTheme.dark_gray,),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: comments_provider.prueba.length,
              itemBuilder: (_, int index) => CommentsList(comment: comments_provider.prueba[index])  )
            )
          
        ]
      ),
      bottomNavigationBar:ButtonBarHome(position: 2) 
    );
  }
}

class CommentsList extends StatelessWidget {

  final Comment comment;

  const CommentsList({
    Key? key, required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical:  10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          SizedBox(height: 10),
          Row(
            
            children: [
              Icon(Icons.star, color: comment.punctuation >= 1 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable, size: 25, ),
            Icon(Icons.star, color: comment.punctuation >= 2 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable, size: 25, ),
            Icon(Icons.star, color: comment.punctuation >= 3 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable, size: 25, ),
            Icon(Icons.star, color: comment.punctuation >= 4 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable, size: 25, ),
            Icon(Icons.star, color: comment.punctuation == 5 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable, size: 25, ),
              SizedBox(width: 10),
              Text("5", style: TextStyle(fontSize: 20)),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 15),
          Text(comment.comment, style: TextStyle(fontSize: 12, fontWeight:FontWeight.w300 )),
          SizedBox(height: 15),
          Container(height: 1, color: AppTheme.dark_gray,)
        ]),
    );
  } 
}