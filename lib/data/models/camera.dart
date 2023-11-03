import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';


part 'camera.g.dart';

@HiveType(typeId: 1)
class Camera {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? roverId;
  @HiveField(3)
  String? fullName;

  Camera({this.id, this.name, this.roverId, this.fullName});

  factory Camera.fromMap(Map<String, dynamic> data) => Camera(
        id: data['id'] as int?,
        name: data['name'] as String?,
        roverId: data['rover_id'] as int?,
        fullName: data['full_name'] as String?,
      );

  factory Camera.fromJson(String data) {
    return Camera.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
