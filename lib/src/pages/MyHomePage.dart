import 'package:demo_donation/src/pages/donorupdate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Blood Donation Ap"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 600),
        child: Center(
          child: FloatingActionButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => UpdateDonor())));
            },
            backgroundColor: Colors.red,
            child: Icon(
                Icons.add
            ),
          ),
        ),
      ),
    );
  }
}
