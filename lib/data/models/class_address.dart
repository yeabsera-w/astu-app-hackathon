import 'package:hive/hive.dart';

part "class_address.g.dart";

@HiveType(typeId: 3)
class ClassAddress {
  ClassAddress({required this.blocNumber, required this.roomNumber});
  @HiveField(0)
  int blocNumber;
  @HiveField(1)
  int roomNumber;
}
