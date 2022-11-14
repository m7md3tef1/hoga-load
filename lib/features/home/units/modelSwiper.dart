import 'package:flutter/material.dart';

class SwiperModel {
  String? text;
  var img;
  String? nameImage;
  String? jop;
  SwiperModel({this.img, this.text, this.jop, this.nameImage});
}

List<SwiperModel> swiperList = [
  SwiperModel(
    img: 'assets/images/1.jpg',
    text: 'Looking Glass (Back-side)',
    jop: 'Ceo & Founder ',
    nameImage: 'Saul Goodman',
  ),
  SwiperModel(
    img: 'assets/images/3.jpg',
    text:
        'Hegaload is very easy to use and to find trucks that can cover loads',
    jop: 'Accountant',
    nameImage: 'Sara Wilsson',
  ),
  SwiperModel(
    img: 'assets/images/4.jpg',
    text: 'I was skeptical in the beginning due to cost but Hegaload is worth EVERY penny.',
    jop: 'Store Owner',
    nameImage: 'jena Karlis',
  ),
  SwiperModel(
    img: 'assets/images/2.jpg',
    text: 'Hegaload is very easy to use and to find trucks that can cover loads',
    jop: 'Manager',
    nameImage: 'Matt Brandon',
  ),
  SwiperModel(
    img: 'assets/images/5.jpg',
    text: 'There’s nothing better for finding a truck for your load!!!!',
    jop: 'Entrepreneur',
    nameImage: 'John Larson',
  ),
];
