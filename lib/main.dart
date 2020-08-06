import 'package:flutter/material.dart';
import 'binaryTreeViewer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Árbol Binario',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => BinaryTreeViewerScreen(),
      },
    );
  }
}