import 'package:dartz/dartz.dart';
import 'package:smile_shope/Features/login/data/models/login_model.dart';
import 'package:smile_shope/core/api/api_consumer.dart';
import 'package:smile_shope/core/api/end_ponits.dart';
import 'package:smile_shope/core/errors/exceptions.dart';

class LoginRepo {
  final ApiConsumer api;
  LoginRepo({required this.api});

  Future<Either<String, LoginModel>> login(
      String email, String password) async {
    try {
      final response = await api.post(
        EndPoint.login(email, password),
        queryParameters: {"email": email, "password": password},
      );
      print("The Email is $email and The Password is $password");
      // print("The Response Is : \n \n" '$response');
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
