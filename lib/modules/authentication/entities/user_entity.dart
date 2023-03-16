// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';

// part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity {
  static const String tableName = 'user';
  static const String localId = '0';

  @HiveField(1) //Map representation of user login response
  final dynamic userData;

  @HiveField(2) //Map representation of user login response
  final String uuid;
  UserEntity({
    required this.userData,
    required this.uuid,
  });
}
