import 'package:flutter/material.dart';


class Empty extends StatefulWidget {
  const Empty({super.key});

  @override
  State<Empty> createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  @override
  Widget build(BuildContext context) {
    return  Center(
    child: Text("No data is in here"),

    );
  }
}