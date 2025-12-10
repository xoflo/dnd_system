import 'package:dndsystem/screens/classes/classScreen.dart';
import 'package:dndsystem/screens/items/itemScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DND System',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const MyHomePage(title: 'DND System Admin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Container(
          width: 200,
          child: Column(
            spacing: 10,

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ClassScreen()),
                );
              }, child: Text("Classes")),

              ElevatedButton(onPressed: () {}, child: Text("Origins")),

              ElevatedButton(onPressed: () {}, child: Text("Features")),

              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ItemScreen()),
                );
              }, child: Text("Items")),

              ElevatedButton(onPressed: () {}, child: Text("Skills")),


            ],
          ),
        ),
      ),
    );
  }
}
