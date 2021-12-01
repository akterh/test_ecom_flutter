import 'dart:convert';

ProductMiniResponse productMiniResponseFromJson(String str) => ProductMiniResponse.fromJson(json.decode(str));

String productMiniResponseToJson(ProductMiniResponse data) => json.encode(data.toJson());

class ProductMiniResponse {
  ProductMiniResponse({
    this.products,
    this.success,
    this.status,
  });

  List<Product> products;
  bool success;
  int status;

  factory ProductMiniResponse.fromJson(Map<String, dynamic> json) => ProductMiniResponse(
    products: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(products.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class Product {
  Product({

    this.id,
    this.name,
    this.image,
    this.price,
    this.desc

  });


  String id;
  String name;
  String image;
  String price;
  String desc;



  factory Product.fromJson(Map<String, dynamic> json) => Product(

    id:json["id"].toString(),
    name: json["name"],
    image: json["image"],
    price: json["price"],
      desc: json['desc']

  );

  Map<String, dynamic> toJson() => {

    "id":id,
    "name": name,
    "image": image,
    "price": price,
    "desc" : desc
  };
}