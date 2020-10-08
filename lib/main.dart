import 'package:flutter/material.dart';
import 'package:flutter_provide_pack/models/weight.dart';
import 'package:provider/provider.dart';
import 'screens/weight_page.dart';
import 'states/weight_state.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MultiProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WeightPage(),
    ),providers: [
      ChangeNotifierProvider(create:(context)=> WeightState()),
      ],
      );
  }
}
