import 'package:hive/hive.dart';

part 'adabteraddorder.g.dart';

@HiveType(typeId: 1)
class addorder extends HiveObject {
  @HiveField(0)
  late String nameclient;
  @HiveField(1)
  late String nameprodect;
  @HiveField(2)
  late int idclient;
  @HiveField(3)
  late int idprodect;
  @HiveField(4)
  late double amount;
  @HiveField(5)
  late double priceamount;
  @HiveField(6)
  late String time;
  @HiveField(7)
  late String date;
  addorder({
    required this.nameclient,
    required this.nameprodect,
    required this.idclient,
    required this.idprodect,
    required this.amount,
    required this.priceamount,
    required this.time,
    required this.date,
  });
}
