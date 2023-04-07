import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          title: Text("Single screen"),
          actions: [
            Icon(Icons.more_vert),
            Icon(Icons.home),
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              // Image.network()
              Image.asset(
                "assets/image/photo.png",
                width: MediaQuery.of(context).size.width,
                height: 100,
                // fit: BoxFit.contain,
                fit: BoxFit.cover,
              ),
            ],
          ),
        )));
  }
}
