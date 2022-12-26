import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

import 'screens/homepage.dart';
import 'screens/mycart.dart';

void main()
{
  runApp(MyApp());
}

/*void main() => runApp(
  DevicePreview(
    enabled: true,
    builder: (context) => MyApp(), // Wrap your app
  ),
);*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>MyData(),
      builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Grocery-store",
      theme: ThemeData.light(),
      home:HomePage(),
    )
    );
  }
}
