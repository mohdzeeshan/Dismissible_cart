import 'package:flutter/cupertino.dart';
import 'package:groom_assignment/models/dataModel.dart';

class Cart extends ChangeNotifier{
  List<CharacterModel> rightSwipedCharacters =[];
  List<CharacterModel> leftSwipedCharacters =[];

  void addToCart(CharacterModel character){
    rightSwipedCharacters.add(character);
    notifyListeners();
  }
  void removeFromCart(CharacterModel character){
    rightSwipedCharacters.remove(character);
    leftSwipedCharacters.remove(character);
    notifyListeners();
  }

  bool isCartEmpty(){
    if(rightSwipedCharacters.length==0)
      return true;
    else
      return false;
  }

  void addToLeftCart(CharacterModel character){
    leftSwipedCharacters.add(character);
    notifyListeners();
  }
}