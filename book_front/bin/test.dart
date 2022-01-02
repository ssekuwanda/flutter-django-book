import 'dart:convert';

import 'package:http/http.dart' as http;

main() async {
  AuthService authService = AuthService();
  var response = await http
      .get(Uri.parse('http://127.0.0.1:8000/accounts/user/'), headers: {
    "Authorization": "Token 57f40c844271d557e306febe6e4db1f8ff384ff6"
  });
  print(jsonDecode(response.body));

  // RegistrationResponse? registrationResponse = await authService.registration(
  //     "wanda1", "Sseku2021", "Sseku2021", "douglasekuwanda1@gmail.com");
  // if (registrationResponse != null) {
  //   if (registrationResponse.email != null) {
  //     registrationResponse.email!.forEach((e) => print(e));
  //   }
  //   if (registrationResponse.username != null) {
  //     registrationResponse.username!.forEach((e) {
  //       print(e);
  //     });
  //   }
  //   if (registrationResponse.nonFieldErrors != null) {
  //     registrationResponse.nonFieldErrors!.forEach((e) {
  //       print(e);
  //     });
  //   }
  //   if (registrationResponse.password1 != null) {
  //     registrationResponse.password1!.forEach((e) {
  //       print(e);
  //     });
  //   }
  //   if (registrationResponse.key != null) {
  //     print(registrationResponse.key);
  //   }
  // }

  /// User Login

  // LoginResponse? loginResponse = await authService.login(
  //   "douglas",
  //   "Sseku2021",
  // );
  // if (loginResponse != null) {
  //   if (loginResponse.nonFieldErrors != null) {
  //     loginResponse.nonFieldErrors!.forEach((e) => print(e));
  //   }

  //   if (loginResponse.key != null) {
  //     print(loginResponse.key);
  //   }
  // }
}

class AuthService {
  final registrationUri = Uri.parse("http://127.0.0.1:8000/registration/");
  final loginUri = Uri.parse("http://127.0.0.1:8000/accounts/login/");

  Future<RegistrationResponse?> registration(
      String username, String password1, String password2, String email) async {
    var response = await http.post(registrationUri, body: {
      "username": username,
      "password1": password1,
      "password2": password2,
      "email": email,
    });
    return RegistrationResponse.fromJson(jsonDecode(response.body));
  }

  Future<LoginResponse?> login(
    String username,
    String password,
  ) async {
    var response = await http.post(loginUri, body: {
      "username": username,
      "password": password,
    });
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}

// token: {"key":"70a8a682ea7eeb209e64878a62c39c1d646b11e2"}
// {"username":["A user with that username already exists."],"email":["A user is already registered with this e-mail address."]}
// {"password1":["This password is too short. It must contain at least 8 characters.","This password is entirely numeric."]}
// {"non_field_errors":["The two password fields didn't match."]}

class RegistrationResponse {
  List<dynamic>? nonFieldErrors;
  List<dynamic>? username;
  List<dynamic>? email;
  List<dynamic>? password1;
  dynamic key;
  RegistrationResponse({
    this.nonFieldErrors,
    this.username,
    this.email,
    this.password1,
    this.key,
  });
  factory RegistrationResponse.fromJson(mapOfBody) => RegistrationResponse(
        nonFieldErrors: mapOfBody["non_field_errors"],
        username: mapOfBody["username"],
        email: mapOfBody["email"],
        password1: mapOfBody["password1"],
        key: mapOfBody["key"],
      );
}

class LoginResponse {
  List<dynamic>? nonFieldErrors;
  List<dynamic>? username;
  List<dynamic>? password;
  dynamic key;
  LoginResponse({
    this.nonFieldErrors,
    this.username,
    this.password,
    this.key,
  });

  factory LoginResponse.fromJson(mapOfBody) => LoginResponse(
        nonFieldErrors: mapOfBody["non_field_errors"],
        username: mapOfBody["username"],
        password: mapOfBody["password"],
        key: mapOfBody["key"],
      );
}
