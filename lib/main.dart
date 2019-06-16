import 'package:flutter/material.dart';
import 'package:scope_model/scope/scope_donate.dart';
import 'package:scope_model/ui/home.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());
ScopeDonate donate = ScopeDonate();
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ScopedModel<ScopeDonate>(
        model: donate,
          child: Home()),
    );
  }
}
