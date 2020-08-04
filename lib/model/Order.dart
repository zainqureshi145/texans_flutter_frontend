class Order {
  String user;
  String menu;
  String quantity;
  String instructions;
  String orderDate;

  Order.fromJson(Map json)
      : user = json['user'],
        menu = json['menu'],
        quantity = json['quantity'],
        instructions = json['instructions'],
        orderDate = json['orderDate'];

  Map toJson() {
    return {
      'user': user,
      'menu': menu,
      'quantity': quantity,
      'instructions': instructions,
      'orderDate': orderDate
    };
  }
}
