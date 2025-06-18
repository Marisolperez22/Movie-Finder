import 'dart:convert';
import '../models/user.dart';
import '../models/product.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:reto_pragma_2/models/carts.dart';

class ApiService {
  
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<Either<String, List<Product>>> getProducts() async {

    try {
      final response = await http.get(Uri.parse('$baseUrl/products'));
      if (response.statusCode == 200) {

        final List data = jsonDecode(response.body);
        final products = data.map((e) => Product.fromJson(e)).toList();
        return Right(products);
      } else {
        return Left('Error ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

Future<Either<String, List<Carts>>> getCarts() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/carts'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      final carts = data.map((e) => Carts.fromJson(e)).toList();
      return Right(carts);
    } else {
      return Left('Error ${response.statusCode}');
    }
  } catch (e) {
    return Left('Error: $e');
  }
}


  Future<Either<String, List<User>>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users'));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        final users = data.map((e) => User.fromJson(e)).toList();
        return Right(users);
      } else {
        return Left('Error ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
