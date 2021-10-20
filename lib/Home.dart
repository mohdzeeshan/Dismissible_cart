import 'package:flutter/material.dart';
import 'package:groom_assignment/LeftSwiped.dart';
import 'package:groom_assignment/helper/Cart.dart';
import 'package:groom_assignment/models/dataModel.dart';
import 'package:groom_assignment/views/CartScreen.dart';
import 'package:provider/provider.dart';

import 'CharacterTile.dart';
import 'helper/fetchApiData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CharacterModel> characters = [];
  bool _loading = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    FetchApiData data = FetchApiData();
    await data.getData();
    characters = data.fetchedData;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 8,
        leading: IconButton(icon: Icon(Icons.shopping_bag),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LeftCartScreen()));
          },
        ),
        title: Text("Groom Assignment"),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },),
        ],
      ),
      body: _loading
          ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) :
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            children: <Widget>[

              Container(
                padding: EdgeInsets.only(top: 10),
                child: ListView.builder(
                    itemCount: characters.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                          onDismissed: (direction){
                          call(direction, index);
                          },
                          child: CharacterTile(character: characters[index],));
                    }),
              )
            ],
          ),
        ),
      ),

    );
  }

  DismissDirectionCallback call(DismissDirection direction, @required index){
    switch (direction){
      case DismissDirection.endToStart:
        Provider.of<Cart>(context, listen: false).addToLeftCart(characters[index]);
        setState(() {
          characters.removeAt(index);
        });
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Added to Cart')));
        break;

      case DismissDirection.startToEnd:
        Provider.of<Cart>(context, listen: false).addToCart(characters[index]);
        setState(() {
          characters.removeAt(index);

        });
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Added to Cart')));

        break;
      case DismissDirection.vertical:
      // TODO: Handle this case.
        break;
      case DismissDirection.horizontal:
      // TODO: Handle this case.
        break;
      case DismissDirection.up:
      // TODO: Handle this case.
        break;
      case DismissDirection.down:
      // TODO: Handle this case.
        break;
      case DismissDirection.none:
      // TODO: Handle this case.
        break;
    }
  }
}
