import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_ui_kit/util/const.dart';
import 'package:restaurant_ui_kit/widgets/cart.dart';
import 'package:restaurant_ui_kit/util/db_helper.dart';
import 'package:restaurant_ui_kit/model/CartItems.dart';

// ignore: must_be_immutable
class AddToCart extends StatefulWidget {
  final String menuName;
  final String picture;
  final String description;
  List<String> dropDownList;
  List<String> priceList;
  String defaultValue;

  AddToCart(
      {this.menuName,
      this.description = 'Null',
      this.picture = 'assets/food/burger.png',
      this.dropDownList,
      this.priceList,
      this.defaultValue});

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final myController = TextEditingController();
  DatabaseHelper db = DatabaseHelper();
  CartItems cartItems = CartItems();
  int quantity = 1;
  //String defaultValue = '100g';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          widget.menuName,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(widget.picture),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              widget.description,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Choose Size',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                DropdownButton<String>(
                  value: widget.defaultValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  underline: Container(
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  items: widget.dropDownList.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      widget.defaultValue = newValue;
                    });
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (quantity == 1) {
                        print('Cannot Order Less than 1 item');
                      } else {
                        quantity--;
                      }
                    });
                  },
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.blueAccent),
                    child: Icon(
                      FontAwesomeIcons.minus,
                      size: 15.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Text(quantity.toString()),
                ),
                SizedBox(
                  width: 5.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.blueAccent),
                    child: Icon(
                      FontAwesomeIcons.plus,
                      size: 15.0,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 10.0, 0, 0),
                child: Text(
                  'Price',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 10.0, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    setPrice(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text('Kr'),
                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Container(
                  height: 2.0,
                  width: 55.0,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 15.0, 0, 0),
                child: Text(
                  'Grand Total = ${setPrice()} x $quantity',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 10.0, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      grandTotal().toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text('Kr'),
                  ],
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Container(
                  height: 2.0,
                  width: 60.0,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 100.0,
              width: double.infinity,
              //color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  controller: myController,
                  decoration: InputDecoration(
                      hintText: 'Instructions',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: FlatButton(
                color: kButtonColor,
                splashColor: Colors.white30,
                onPressed: () {
                  int price = grandTotal();
                  //List cartItems = [widget.menuName, quantity, price];
                  cartItems = CartItems(
                      itemName: widget.menuName,
                      itemQuantity: quantity,
                      itemPrice: grandTotal().toString(),
                      instructions: myController.text,
                      itemSize: widget.defaultValue,
                      itemPicture: widget.picture);
                  //db.saveData(cartItems),
                  db.insertToCart(cartItems);
                  db.getCartData();
                  //CartItems().databaseConnection(),
                  print('Go back to order more...');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(
                        //it is useless once the widget gets the data from db
                        menuName: widget.menuName,
                        defaultValue: widget.defaultValue,
                        quantity: quantity,
                        price: grandTotal().toString(),
                        picture: widget.picture,
                        //cartItems: cartItems,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 60.0,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String setPrice() {
    for (int x = 0; x < widget.dropDownList.length; x++) {
//      String price;
//      price = widget.dropDownList[x] = widget.priceList[x]; WTF???
//      return price;
      if (widget.defaultValue == widget.dropDownList[x]) {
        //print(x);
        return widget.priceList[x];
      }
    }
    return 'Error';
  }

  int grandTotal() {
    int value = int.parse(setPrice());
    return quantity * value;
  }
}
