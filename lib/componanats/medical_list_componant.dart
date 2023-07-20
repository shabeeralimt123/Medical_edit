import 'package:flutter/material.dart';

class MedicalCard extends StatelessWidget {
  final int index;
  final String name;
  final double price;
  final int quantity;
  final Function(int quantity) onQuantityChanged;

  const MedicalCard(
      {super.key,
      required this.index,
      required this.name,
      required this.price,
      required this.quantity,
      required this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _quantityController =
        TextEditingController(text: '$quantity');
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  'Price: \₹ ${price}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 10),
                Text(
                  'Quantity: $quantity',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 5),
                // Container(
                //   width: 70,
                //   child: TextField(
                //     controller: _quantityController,

                //     keyboardType:
                //         TextInputType.number, // Set the keyboardType to number

                //     onChanged: (value) {
                //       int newQuantity = int.tryParse(value) ?? 0;
                //       onQuantityChanged(newQuantity);
                //     },
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  'Total: \₹ ${price * quantity}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 10),
                // Text(
                //   '(Editable)',
                //   style: TextStyle(fontSize: 12, color: Colors.grey),
                // ),
              ],
            ),
          ],
        ),
       
        onTap: () {},
      ),
    );
  }
}
