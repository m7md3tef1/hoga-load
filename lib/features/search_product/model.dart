class Product{

  String? img;
  String? product;
  String? type;
  double? price;
  String? buy;

  Product({ required this.img,required this.product,required this.type,required this.price, required this.buy});


}


List<Product> productList=[
  Product(img: 'assets/images/Ellipse 46.png', product: 'Looking Glass (Back-side)', type: 'Sell', price: 1.200, buy: 'Accessories'),
  Product(img: 'assets/images/Ellipse 47.png', product: 'Truck', type: 'Sell', price: 1.500, buy: 'Parts'),
  Product(img: 'assets/images/Ellipse 47.png', product: 'Truck', type: 'Sell', price: 1.200, buy: 'Parts'),

];

List<String>titleProductList=[
  'Buy/Sell','Product','Type','Price',''

];

