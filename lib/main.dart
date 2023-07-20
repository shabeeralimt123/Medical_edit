import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medicin_app/db/medicin.dart';
import 'package:medicin_app/provider/bottom_nav_provider.dart';
import 'package:medicin_app/provider/meidcin_provider.dart';
import 'package:medicin_app/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
 await Hive.initFlutter();
  Hive.registerAdapter(MedicineAdapter());
  //  await Hive.deleteBoxFromDisk('medicineBox');
  await Hive.openBox<Medicine>('medicineBox');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AddItemProvider(),
        ),
         ChangeNotifierProvider(
          create: (_) => BottomNavProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Medicin App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splash(),
      ),
    );
  }
}
