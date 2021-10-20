import 'package:flutter/material.dart';
import 'package:groom_assignment/helper/Cart.dart';
import 'package:provider/provider.dart';

import 'CartTile.dart';
class LeftCartScreen extends StatefulWidget {
  @override
  _LeftCartScreenState createState() => _LeftCartScreenState();
}

class _LeftCartScreenState extends State<LeftCartScreen> {
  Cart c = new Cart();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          elevation: 8,
          title: Text("Your Cart"),
        ),
        body: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: Provider.of<Cart>(context).leftSwipedCharacters.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CartTile(
                    character: Provider.of<Cart>(context).leftSwipedCharacters[index],
                  );
                }),


          ),
        ),
      );
  }
}
