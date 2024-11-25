// import 'package:http/http.dart' as http;
// import 'package:movie_app/core/error/exceptions.dart';
// import 'dart:convert';

// import 'api_constants.dart';

// class ApiClient {
//   final http.Client client;

//   ApiClient(this.client);

//   Future<dynamic> get(String path, {Map<String, dynamic>? params}) async {
//     final url = Uri.https(ApiConstants.baseUrl, path, params);
//     final response = await client.get(url);
//     return _handleResponse(response);
//   }

//   dynamic _handleResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         return json.decode(response.body);
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 401:
//       case 403:
//         throw UnauthorisedException(response.body.toString());
//       case 500:
//       default:
//         throw FetchDataException(
//             'Error occurred while communicating with server');
//     }
//   }
// }

// class BadRequestException extends AppException {
//   BadRequestException(super.message);
// }

// class UnauthorisedException extends AppException {
//   UnauthorisedException(super.message);
// }

// class FetchDataException extends AppException {
//   FetchDataException(super.message);
// }
