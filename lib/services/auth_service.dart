import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyBNjGXf4q8OSARksF4v0JhE2UMP-Bgnpsw';

  Future<String?> createUser(
       String email, String password) async {
    final Map<String, dynamic> authData = {      
      'email': email,
      'password': password
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken,
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedRest = json.decode(resp.body);

    if (decodedRest.containsKey('idToken')) {
      //decodedRest['idToken']
      return null;
    }else{
        return decodedRest['error']['message'];
    }
  }

   Future<String?> login(
       String email, String password) async {
    final Map<String, dynamic> authData = {      
      'email': email,
      'password': password
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken,
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedRest = json.decode(resp.body);

    if (decodedRest.containsKey('idToken')) {
      //decodedRest['idToken']
      return null;
    }else{
        return decodedRest['error']['message'];
    }
  }
}