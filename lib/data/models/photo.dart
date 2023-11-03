import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

import 'camera.dart';
part 'photo.g.dart';

@HiveType(typeId: 0)
class Photo {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? sol;
  @HiveField(2)
  Camera? camera;
  @HiveField(3)
  String? imgSrc;
  @HiveField(4)
  String? earthDate;

  Photo({
    this.id,
    this.sol,
    this.camera,
    this.imgSrc,
    this.earthDate,
  });

  factory Photo.fromMap(Map<String, dynamic> data) => Photo(
        id: data['id'] as int?,
        sol: data['sol'] as int?,
        camera: data['camera'] == null
            ? null
            : Camera.fromMap(data['camera'] as Map<String, dynamic>),
        imgSrc: data['img_src'] as String?,
        earthDate: data['earth_date'] as String?,
      );



  factory Photo.fromJson(String data) {
    return Photo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  static DateTime _dateFromString(String date) => DateTime.parse(date);
}
