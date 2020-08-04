import 'package:flutter/material.dart';
import 'package:restaurant_ui_kit/widgets/reusable_menu_card.dart';
import 'package:restaurant_ui_kit/screens/add_to_cart_screen.dart';

class BurgerMenu extends StatefulWidget {
  @override
  _BurgerMenuState createState() => _BurgerMenuState();
}

class _BurgerMenuState extends State<BurgerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Burgers",
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlatButton(
                onPressed: () => {
                  print('Hamburger Selected'),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddToCart(
                        menuName: 'Hamburger',
                        description: '',
                        dropDownList: ['100g', '160g', '190g', '250g', '500g'],
                        priceList: ['65', '89', '100', '125', '205'],
                        defaultValue: '100g',
                        picture: 'assets/burgers/hamburger.jpg',
                      ),
                    ),
                  ),
                },
                child: ReusableMenuCard(
                  menuItem: 'Hamburger',
                  description: '',
                  priceFrom: 'From 65kr',
                  image: 'assets/burgers/hamburger.jpg',
                ),
              ),
              Divider(),
              FlatButton(
                onPressed: () => {
                  print('Cheeseburger Selected'),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddToCart(
                        menuName: 'Cheeseburger',
                        description: '',
                        dropDownList: ['100g', '160g', '190g', '250g', '500g'],
                        priceList: ['75', '99', '109', '135', '215'],
                        defaultValue: '100g',
                        picture: 'assets/burgers/cheeseburger.jpg',
                      ),
                    ),
                  ),
                },
                child: ReusableMenuCard(
                  menuItem: 'Cheeseburger',
                  description: '',
                  priceFrom: 'From 75kr',
                  image: 'assets/burgers/cheeseburger.jpg',
                ),
              ),
              Divider(),
              FlatButton(
                onPressed: () => {
                  print('Cheeseburger Tallerken Selected'),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddToCart(
                        menuName: 'Cheeseburger Tallerken',
                        description: '* Med salat og chips',
                        dropDownList: ['100g', '160g', '190g', '250g', '500g'],
                        priceList: ['99', '125', '145', '159', '238'],
                        defaultValue: '100g',
                        picture: 'assets/burgers/cheeseburger-Platter.jpg',
                      ),
                    ),
                  ),
                },
                child: ReusableMenuCard(
                  menuItem: 'Cheeseburger Tallerken',
                  description: '* Med salat og chips',
                  priceFrom: 'From 99kr',
                  image: 'assets/burgers/cheeseburger-Platter.jpg',
                ),
              ),
              Divider(),
              FlatButton(
                onPressed: () => {
                  print('Mexican Burger Tallerken Selected'),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddToCart(
                        menuName: 'Mexican Burger Tallerken',
                        description: '* Med salat og chips',
                        dropDownList: ['100g', '160g', '190g', '250g', '500g'],
                        priceList: ['105', '125', '145', '155', '239'],
                        defaultValue: '100g',
                        picture: 'assets/burgers/mexicanburger-platter.jpg',
                      ),
                    ),
                  ),
                },
                child: ReusableMenuCard(
                  menuItem: 'Mexican Burger Tallerken',
                  description: '* Med salat og chips',
                  priceFrom: 'From 105kr',
                  image: 'assets/burgers/mexicanburger-platter.jpg',
                ),
              ),
              Divider(),
              FlatButton(
                  onPressed: () => {
                        print('Bacon Cheeseburger Selected'),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddToCart(
                              menuName: 'Bacon Cheeseburger',
                              description: '',
                              dropDownList: [
                                '100g',
                                '160g',
                                '190g',
                                '250g',
                                '500g'
                              ],
                              priceList: ['89', '109', '119', '145', '225'],
                              defaultValue: '100g',
                              picture: 'assets/burgers/bacon-cheeseburger.jpg',
                            ),
                          ),
                        ),
                      },
                  child: ReusableMenuCard(
                    menuItem: 'Bacon Cheeseburger',
                    description: '',
                    priceFrom: 'From 89kr',
                    image: 'assets/burgers/bacon-cheeseburger.jpg',
                  )),
              Divider(),
              FlatButton(
                  onPressed: () => {
                        print('Mexican Burger Selected'),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddToCart(
                              menuName: 'Mexican Burger',
                              description: '',
                              dropDownList: [
                                '100g',
                                '160g',
                                '190g',
                                '250g',
                                '500g'
                              ],
                              priceList: ['75', '95', '109', '155', '235'],
                              defaultValue: '100g',
                              picture: 'assets/burgers/mexicanburger.jpeg',
                            ),
                          ),
                        ),
                      },
                  child: ReusableMenuCard(
                    menuItem: 'Mexican Burger',
                    description: '',
                    priceFrom: 'From 75kr',
                    image: 'assets/burgers/mexicanburger.jpeg',
                  )),
              Divider(),
              FlatButton(
                  onPressed: () => {
                        print('Beef Burger Selected'),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddToCart(
                              menuName: 'Beef Burger',
                              description: '',
                              dropDownList: ['200g'],
                              priceList: ['155'],
                              defaultValue: '200g',
                              picture: 'assets/burgers/beefburger.jpg',
                            ),
                          ),
                        ),
                      },
                  child: ReusableMenuCard(
                    menuItem: 'Beef Burger',
                    description: '',
                    priceFrom: 'From 155kr',
                    image: 'assets/burgers/beefburger.jpg',
                  )),
              Divider(),
              FlatButton(
                  onPressed: () => {
                        print('Lovstek Selected'),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddToCart(
                              menuName: 'Løvstek i Brød',
                              description: '',
                              dropDownList: ['Enkel', 'Dobbel'],
                              priceList: ['99', '149'],
                              defaultValue: 'Enkel',
                              picture: 'assets/burgers/lovstek.jpg',
                            ),
                          ),
                        ),
                      },
                  child: ReusableMenuCard(
                    menuItem: 'Løvstek i Brød',
                    description: '',
                    priceFrom: 'From 90kr',
                    image: 'assets/burgers/lovstek.jpg',
                  )),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
