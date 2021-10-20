import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groom_assignment/models/dataModel.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'helper/Cart.dart';

class CharacterTile extends StatefulWidget {
  CharacterModel character;
  CharacterTile({@required this.character,});

  @override
  _CharacterTileState createState() => _CharacterTileState();
}

class _CharacterTileState extends State<CharacterTile> {
  @override
  Widget build(BuildContext context) {
    return
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 10,
          //margin: EdgeInsets.only(bottom: 2),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: widget.character.image,
                  height: 350,),
              ),
              Text(widget.character.name,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20,),

            ],
          ),
        );

  }
}