import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/task_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _formData = TextEditingController();
  String textValue = "";
  //this list will contain all the todos
  List todoList = [];

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);

    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  "Good Afternoon!!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    date.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextFormField(
                    controller: _formData,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(),
                      hintText: "Enter a item",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //textValue = _formData.text;
                    // MAP
                    todoList.add({
                      "task": _formData.text,
                      "icon": Icons.task,
                      "checked": false,
                    });
                    _formData.text = "";
                    print(_formData.text);
                    setState(() {});
                  },
                  child: Text("Add"),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    var item = todoList[index];
                    return Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                              value: item['checked'],
                              onChanged: (value) {
                                for (var i = 0; i < todoList.length; i++) {
                                  if (todoList[i] == item) {
                                    //   print(todoList[i]);
                                    setState(() {
                                      todoList[i]['checked'] =
                                          !todoList[i]['checked'];
                                    });
                                  }
                                }
                              }),
                          GestureDetector(
                              onTap: () {
                                print("tap");
                                Get.to(
                                  TaskScreen(
                                    title: item['task'],
                                  ),
                                  transition: Transition.zoom,
                                );
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (_) => TaskScreen
                                //     (),
                                //   ),
                                // );
                              },
                              child: Text(item['task'])),
                          Icon(item['icon']),
                        ],
                      ),
                    );
                  },
                )
                // if (textValue != "")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
