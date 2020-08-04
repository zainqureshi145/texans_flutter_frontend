import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_ui_kit/util/const.dart';
import 'package:restaurant_ui_kit/widgets/cart.dart';

class AddToCartBeefBurger extends StatefulWidget {
  final String menuName;
  final String picture;
  final String description;

  AddToCartBeefBurger(
      {this.menuName,
      this.description = 'Null',
      this.picture = 'assets/food/burger.png'});

  @override
  _AddToCartBeefBurgerState createState() => _AddToCartBeefBurgerState();
}

class _AddToCartBeefBurgerState extends State<AddToCartBeefBurger> {
  String defaultValue = '200g';
  int quantity = 1;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  //offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              image: DecorationImage(
                image: AssetImage(widget.picture),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            widget.description,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            height: 50.0,
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
                width: 30.0,
              ),
              DropdownButton<String>(
                value: defaultValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                items: <String>['200g'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  //defaultValue = newValue;
                  setState(() {
                    defaultValue = newValue;
                    //int itemPrice = setPrice();
                  });
                },
              ),
              SizedBox(
                width: 50.0,
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
            height: 50.0,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: FlatButton(
              color: kButtonColor,
              splashColor: Colors.white30,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cart(
                              menuName: widget.menuName,
                              defaultValue: defaultValue,
                              quantity: quantity,
                            )));
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
    );
  }

  String setPrice() {
    if (defaultValue == '200g') {
      return '155';
    }
    return 'Error';
  }

  int grandTotal() {
    int value = int.parse(setPrice());
    return quantity * value;
  }
}
