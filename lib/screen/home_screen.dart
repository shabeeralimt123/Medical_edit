import 'package:flutter/material.dart';
import 'package:medicin_app/componanats/constatnts.dart';
import 'package:medicin_app/db/medicin.dart';
import 'package:medicin_app/provider/meidcin_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        title: Text('Medical List'),
      ),
      body: Consumer<AddItemProvider>(builder: (context, snapshot, _) {
        return ListView.builder(
          itemCount: snapshot.itemList.length,
          itemBuilder: (context, index) {
            final medicine = snapshot.itemList.getAt(index)!;
            return ListTile(
              title: Text(medicine.name),
              subtitle: Text('Quantity: ${medicine.quantity}'),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  snapshot.deleteMedicine(index);
                },
              ),
              onTap: () {
                _showEditDialog(context, medicine, index);
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          _showAddDialog(context);
        },
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Medicine'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Medicine Name'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'price'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                Provider.of<AddItemProvider>(context, listen: false)
                    .addMedicine(
                        nameController.text,
                        int.parse(quantityController.text),
                        int.parse(priceController.text));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, Medicine medicine, int index) {
    TextEditingController nameController =
        TextEditingController(text: medicine.name);
    TextEditingController quantityController =
        TextEditingController(text: medicine.quantity.toString());
    TextEditingController priceController =
        TextEditingController(text: medicine.price.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Medicine'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Medicine Name'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                Provider.of<AddItemProvider>(context, listen: false)
                    .updateMedicine(
                        index,
                        nameController.text,
                        int.parse(quantityController.text),
                        int.parse(priceController.text));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
