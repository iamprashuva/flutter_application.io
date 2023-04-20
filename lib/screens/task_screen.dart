import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.green,
          elevation: 0,
          title: Text(title),
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
                // fit: BoxFit.contain,or BoxFit.cover
                fit: BoxFit.cover,
              ),
            ],
          ),
        )));
  }
}
