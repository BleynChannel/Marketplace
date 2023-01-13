import 'package:marketplace/domain/repository/product_repository.dart';
import 'package:marketplace/domain/repository/user_repository.dart';

//? Есть ли подключение к интернету?
const debugIsNetwork = true;

final userRepository = UserRepository();
final productRepository = ProductRepository();

//TODO: Поменять на Profile
String? user;
