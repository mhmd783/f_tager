import 'package:hive/hive.dart';
part 'adapter.g.dart';
@HiveType(typeId: 0)
class prodect extends HiveObject {
  @HiveField(0)
  late String nameprodect;
  @HiveField(1)
  late String priceprodect;

  prodect({required this.nameprodect,required this.priceprodect}) ;
}
