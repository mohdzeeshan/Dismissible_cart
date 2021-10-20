// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';


class CharacterModel {
  CharacterModel({

    this.name,
    this.image,
  });

  String name;
  String image;

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
    name: json["name"],
    image: json["image"],
  );

}

