import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [];

class CarouselImages extends StatelessWidget {

  final List<String> imgList;
  
  const CarouselImages({
    Key? key, required this.imgList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 250,
        child: CarouselSlider(
          options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 1,
          ),
          items: imgList.map((item) => 
            Container(
              child: Center(child:Image.network("http://144.22.197.146:8000" +item, fit: BoxFit.cover, width: double.infinity,height: 270)),
            )
          ).toList(),
      ),
      decoration:BoxDecoration(
        border: null,
        color: Colors.black.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 2), 
            // changes position of shadow
          ),
        ],
      ), 
    );
  }
}