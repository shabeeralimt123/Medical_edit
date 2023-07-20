import 'package:flutter/material.dart';
import 'package:medicin_app/componanats/constatnts.dart';
import 'package:medicin_app/componanats/medical_list_componant.dart';
import 'package:medicin_app/provider/meidcin_provider.dart';
import 'package:provider/provider.dart';

class MedicalList extends StatefulWidget {
  const MedicalList({super.key});

  @override
  State<MedicalList> createState() => _MedicalListState();
}

class _MedicalListState extends State<MedicalList> {
  void _updateQuantity(int index, int newQuantity) {
    final medicine = Provider.of<AddItemProvider>(context, listen: false)
        .itemList
        .getAt(index);
    medicine?.quantity = newQuantity;
    medicine?.save();
    setState(() {}); // Trigger rebuild to update the total
  }

  @override
  void initState() {
    super.initState();
    Provider.of<AddItemProvider>(context, listen: false).getAllMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text("Your  list"),
      ),
      body: Consumer<AddItemProvider>(builder: (context, snapshot, _) {
        return ListView.builder(
            itemCount: snapshot.itemList.length,
            itemBuilder: (context, index) {
              final medicine = snapshot.itemList.getAt(index)!;
              return MedicalCard(
                index: index,
                name: medicine.name,
                price: double.parse(medicine.price.toString()),
                quantity: int.parse(medicine.quantity.toString()),
                onQuantityChanged: (newQuantity) {
                  _updateQuantity(index, newQuantity);
                },
              );
            });
      }),
    );
  }
}
