import 'package:flutter/painting.dart';

class Note {
  final int? id;
  final String? name;
  final String? description;

  Note({this.id, this.name, this.description});

  Map<String, dynamic> toMap(){
    return{
      'name' : this.name,
      'description' : this.description,
    };
  }
}