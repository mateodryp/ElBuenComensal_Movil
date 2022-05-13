import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://www.disfrutarosario.com/wp-content/uploads/2020/01/restaurant-939435_960_720.jpg',
  'https://ewscripps.brightspotcdn.com/dims4/default/53041b7/2147483647/strip/true/crop/1280x720+0+67/resize/1280x720!/quality/90/?url=http%3A%2F%2Fewscripps-brightspot.s3.amazonaws.com%2Fdc%2Fb0%2F4e8e861f414fb7124097b7e787b5%2Ffirst-and-last-a.jpeg',
  'https://www.cucinare.tv/wp-content/uploads/2019/04/Restaurant-1.jpg',
];

class CarouselImages extends StatelessWidget {
  const CarouselImages({
    Key? key,
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
              child: Center(child:Image.network(item, fit: BoxFit.cover, width: double.infinity,height: 270)),
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