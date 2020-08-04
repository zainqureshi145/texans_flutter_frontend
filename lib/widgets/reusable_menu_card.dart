import 'package:flutter/material.dart';
import 'package:restaurant_ui_kit/util/const.dart';

// ignore: must_be_immutable
class ReusableMenuCard extends StatefulWidget {
  final String menuItem;
  final String description;
  final String priceFrom;
  final String image;
  //List<String> dropDownList;
  //String defaultValue;

  ReusableMenuCard({
    this.menuItem,
    this.description,
    this.priceFrom,
    this.image,
    //this.dropDownList,
    //this.defaultValue = '100g'
  });
  @override
  _ReusableMenuCardState createState() => _ReusableMenuCardState();
}

class _ReusableMenuCardState extends State<ReusableMenuCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Container(
            height: 100.0,
            width: 120.0,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.menuItem,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                widget.description,
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Container(
                height: 30.0,
                width: 110.0,
                decoration: BoxDecoration(
                    color: kButtonColor,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Center(
                  child: Text(
                    widget.priceFrom,
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
