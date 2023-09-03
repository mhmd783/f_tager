import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:tager/adabteraddorder.dart';
import 'package:tager/adapter.dart';

import 'package:tager/oprator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:tager/providerconsumer/Cart.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Directory dir = await getApplicationDocumentsDirectory();
  // await Hive.initFlutter(dir.path);
  // Hive.registerAdapter(adabterAdapter());

  // await Hive.openBox<adabter>("boxdata");

  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  //adapter
  Hive.registerAdapter(prodectAdapter());
  Hive.registerAdapter(addorderAdapter());
  //
  await Hive.openBox("nameclients");
  await Hive.openBox<prodect>("prodect");
  await Hive.openBox<addorder>("addorder1");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return cart();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: Color.fromARGB(255, 51, 243, 125))),
        routes: {
          "oprator": (context) => oprator(),
        },
        home: oprator(),
      ),
    );
  }
}
