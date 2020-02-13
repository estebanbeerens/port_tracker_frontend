import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// Function for HTTP request
Future<String> requestLogin(String url, Map jsonMap) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(jsonMap)));
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  return reply;
}

Future<String> getDeviceJson(String url) async {
  final response = await http.get(url);
  return response.body;
}