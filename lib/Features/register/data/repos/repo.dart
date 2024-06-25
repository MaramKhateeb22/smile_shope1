import 'package:dartz/dartz.dart';
import 'package:smile_shope/Features/register/data/models/register_model.dart';
import 'package:smile_shope/core/api/api_consumer.dart';
import 'package:smile_shope/core/api/end_ponits.dart';
import 'package:smile_shope/core/errors/exceptions.dart';

class RegisterRepo {
  final ApiConsumer api;
  RegisterRepo({required this.api});

  Future<Either<String, RegisterModel>> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String adress,
      String phone,
      String emailverifiedat) async {
    try {
      final response = await api.post(
        EndPoint.register(name, email, password, confirmPassword, adress, phone,
            emailverifiedat),
        queryParameters: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
          'address': adress,
          'phone': phone,
          'email_verified_at': emailverifiedat
        },
      );
      print(
          "The Email is $email and The Password is $password and The Adressis $adress");
      // print("The Response Is : \n \n" '$response');
      return Right(RegisterModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
