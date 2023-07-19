import 'package:hive/hive.dart';

part 'medicin.g.dart';

@HiveType(typeId: 0)
class Medicine extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int quantity;
   @HiveField(2)
  late int price;

  Medicine(this.name, this.quantity,this.price);
}