import 'package:flutter/material.dart';

class ListModel {
  String? desc;
  var img;
  String? name;
  String? jop;
  ListModel({this.img, this.desc, this.jop, this.name});
}

List<ListModel> list = [
  ListModel(
    img: 'assets/images/image1.png',
    desc: 'Velit aut quia fugit et et. Dolorum ea voluptate vel tempore tenetur ipsa quae aut. Ipsum exercitationem iure minima enim corporis et voluptate.',
    jop: 'Chief Executive Officer',
    name: 'Walter White',
  ),
  ListModel(
    img: 'assets/images/image2.png',
    desc:
    'Quo esse repellendus quia id. Est eum et accusantium pariatur fugit nihil minima suscipit corporis. Voluptate sed quas reiciendis animi neque sapiente.',
    jop: 'Product Manager',
    name: 'Sarah Jhonson',
  ),
  ListModel(
    img: 'assets/images/image3.png',
    desc: 'Vero omnis enim consequatur. Voluptas consectetur unde qui molestiae deserunt. Voluptates enim aut architecto porro aspernatur molestiae modi.',
    jop: 'CTO',
    name: 'William Anderson',
  ),
  ListModel(
    img: 'assets/images/image4.png',
    desc: 'Rerum voluptate non adipisci animi distinctio et deserunt amet voluptas. Quia aut aliquid doloremque ut possimus ipsum officia.',
    jop: 'Accountant',
    name: 'Amanda Jepson',
  ),
];
