class EndPoint {
  static String baseUrl = "https://smilestore20002000.000webhostapp.com/api/";
  // static String signIn = "user/signin";
  // static String signUp = "user/signup";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }

  static String login(String email, String password) {
    return "auth/login?email=$email&password=$password";
  }

  static String register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String adress,
      String phone,
      String emailverifiedat) {
    return "auth/register?name=$name&email=$email&password=$password&password_confirmation=$confirmPassword&address=$adress&phone=$phone&email_verified_at=$emailverifiedat";
  }
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
}
