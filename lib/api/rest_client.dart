import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/product.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: "https://fakestoreapi.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/products")
  Future<List<Product>> getProducts();
}
