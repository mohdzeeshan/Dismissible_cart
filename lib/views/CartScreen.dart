import 'package:flutter/material.dart';
import 'package:groom_assignment/helper/Cart.dart';
import 'package:provider/provider.dart';

import '../CartTile.dart';
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cart c = new Cart();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          elevation: 8,
          title: Text("Left Swiped Cart"),
        ),
        body: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: Provider.of<Cart>(context).rightSwipedCharacters.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CartTile(
                    character: Provider.of<Cart>(context).rightSwipedCharacters[index],
                  );
                }),
          ),
        ),
      );
  }
}
