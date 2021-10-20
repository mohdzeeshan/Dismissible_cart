import 'package:groom_assignment/models/dataModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'helper/Cart.dart';
class CartTile extends StatelessWidget {
  Cart c = new Cart();
  CharacterModel character;
  CartTile({@required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [

          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: character.image,),
              ),
            ),
          ),
          SizedBox(width: 20),
          Text(
            character.name,
            style: TextStyle(color: Colors.black, fontSize: 16),
            maxLines: 2,
          ),
          IconButton(icon: Icon(Icons.delete), onPressed: (){
            Provider.of<Cart>(context, listen: false).removeFromCart(character);
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text("Success"),
                content: Text("Removed"),
              );
            });
          }),
        ],
      ),
    );
  }
}
