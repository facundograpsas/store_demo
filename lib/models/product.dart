import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? title;
  num? price;
  String? category;
  Map<String, double>? rating;
  String? description;
  String? image;

  Product(
      {this.id,
      this.title,
      this.price,
      this.category,
      this.rating,
      this.description,
      this.image});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
