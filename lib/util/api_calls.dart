import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://10.0.2.2:5000/api";

class API {
  static Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }

  static Future getLoggedInUser() {
    var url = baseUrl + "/auth";
    return http.get(url);
  }

  static Future registerUser() {
    var url = baseUrl + "/users";
    return http.post(url);
  }

  static Future login() {
    var url = baseUrl + "/auth";
    return http.post(url);
  }

  static Future getMenu() {
    var url = baseUrl + "/menu";
    return http.get(url);
  }

  static Future addMenuItem() {
    var url = baseUrl + "/menu";
    return http.post(url);
  }

  static Future modifyMenuItem() {
    var url = baseUrl + "/menu";
    return http.put(url);
  }

  static Future deleteMenuItem() {
    var url = baseUrl + "/menu";
    return http.delete(url);
  }

  static Future getUserOrders() {
    var url = baseUrl + "/order";
    return http.get(url);
  }

  static Future getAdminOrders() {
    var url = baseUrl + "/order/admin";
    return http.get(url);
  }

  static Future createOrder() {
    var url = baseUrl + "/order";
    return http.post(url);
  }

  static Future deleteOrder() {
    var url = baseUrl + "/order";
    return http.delete(url);
  }
}
