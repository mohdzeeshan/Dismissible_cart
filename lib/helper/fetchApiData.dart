import 'dart:convert';

import 'package:groom_assignment/models/dataModel.dart';
import 'package:http/http.dart' as http;

// Future getPosts(String url) async {
//   var response = await http.get(Uri.parse(url));
//   var jsonData = jsonDecode(response.body);
//   return jsonData;
// }


class FetchApiData{
  List<CharacterModel> fetchedData = [];


   Future<void> getData()async{
     String url =
         "https://rickandmortyapi.com/api/character/";
     var response = await http.get(Uri.parse(url));
     var jsonData = jsonDecode(response.body);
     jsonData["results"].forEach((element){
       CharacterModel characterModel = CharacterModel.fromJson(element);
       fetchedData.add(characterModel);
     });

   }
}