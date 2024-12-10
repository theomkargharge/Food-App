import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:task/data/utils.dart';

class ApiClient {
  // Singleton instance
  static final ApiClient _singleton = ApiClient._internal();

  ApiClient._internal();

  // Factory constructor to return the singleton instance
  factory ApiClient() {
    return _singleton;
  }

  Future<dynamic> postRequest({
    required String endpoint,
    Map<String, dynamic>? body,
  }) async {
    try {
      final token = getToken();
      log('The token: $token');

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final Uri uri = Uri.parse(endpoint);
      log('The URI: $uri');

      final response = await http
          .post(
            uri,
            headers: headers,
            body: jsonEncode(body), // Converts body to JSON string
          )
          .timeout(const Duration(seconds: 15)); // Adds a timeout for safety

      log('The response: ${response.body}');
      return response;
    } on SocketException {
      showToast(
          mes:
              'Unable to connect , please check your internet connection.!'); // Optional: Return null or throw an exception based on your needs
    } on TimeoutException {
      showToast(
          mes:
              'Request time out , please try again later'); // Optional: Return null or throw an exception based on your needs
    } catch (e) {
      showToast(
          mes:
              'Server isn\'t responding, please try again later'); // Optional: Return null or throw an exception based on your needs
    }
  }

  String getToken() {
    return "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZWRhNWExODU0OTFhYWE0MmY5YzMyZjRhMTU5MDM1ODk4ZjZiMzMxNWUzZjJjNGRiZDA1N2IyNGE3NTAzMDc3NDBlMjFlYjZmNGE4Mjk0MGUiLCJpYXQiOjE3MDQ4MDA4OTAuODc5OTI1OTY2MjYyODE3MzgyODEyNSwibmJmIjoxNzA0ODAwODkwLjg3OTkyOTA2NTcwNDM0NTcwMzEyNSwiZXhwIjoxNzM2NDIzMjkwLjgzNDkxMjA2MTY5MTI4NDE3OTY4NzUsInN1YiI6IjI2NSIsInNjb3BlcyI6W119.CwDEjlHoRtOXdFcaO6KGGxV202AOA7MMtJVPtKzgLqzTFzUUnDLGBd7PNAtHO2--3YOathM9HOG8hYjY8wjktXZIoCGUR9GWIaEVUxLwFq927CrSf05NuqTBTrJcDeBOjXDvKcSBiJ2A994FC2IunPcdkaZ4jpoaWBIaWueYUbHviYSQuLec3tFcAMg4njrImAlaN9k-QKkHetpdrdbUEX1Wzq4X-1QwuOx7W3W2nbbxaoNgFX1gaabxi00ZO7h5MokGvtqy_gCkS9TYoM74VfxmTyAAczjttLcPqDNiAL_ZJdutDMezw32CZj8G8l8PUL46F_BuaxatZDBUZxeClZh4_0Wvo9GX4zqF2XvHdzZHnwdB414vNCl8itaGW9w7QWbdchPOglhnek32ZmkH0MIqeOBhnAyHo5_WbP0uLd_3qmz3w04nvTbTGV25-QebaxPAsVD0-7Za1sVpqB_FD6yEeliaEzdxl_8gA5IH59uowpfPYgUIjom8NVEASuYsAwb0q3f0jhNRfwg2zmXNenoDunh_dN9l2NRjI2gdZueSMwu6IJLQK46jpn01uG2iQ1xx-pFJAGe_bzSceLsho3dbtabym3tMqi0Ac02xUP9Mn50LdkFJGNVU9jiuHQfyjQirDtGUfya3aIvpJlCGx9Cx99s_4P89uDnOiXy3A1Q";
  }
}
