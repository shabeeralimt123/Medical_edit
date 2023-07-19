import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medicin_app/db/medicin.dart';

class AddItemProvider extends ChangeNotifier {
  Box<Medicine>? _itemList;

  Box<Medicine> get itemList => _itemList!;

  addMedicine(String name, int quantity, int price) {
    final medicineBox = Hive.box<Medicine>('medicineBox');
    _itemList = medicineBox;
    _itemList!.add(Medicine(name, quantity, price));
    notifyListeners();
  }

  getAllMedicines() {
    final medicineBox = Hive.box<Medicine>('medicineBox');
    _itemList = medicineBox;
    notifyListeners();
  }

  updateMedicine(int index, String name, int quantity, int price) {
    final medicineBox = Hive.box<Medicine>('medicineBox');
    final medicine = medicineBox.getAt(index);
    medicine!.name = name;
    medicine.quantity = quantity;
    medicine.price = price;
    medicine.save();
    notifyListeners();
  }

  deleteMedicine(int index) {
    final medicineBox = Hive.box<Medicine>('medicineBox');
    medicineBox.deleteAt(index);
    notifyListeners();
  }
}
