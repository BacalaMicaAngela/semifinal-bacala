import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final dynamic todo;
  const DetailPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos Data Information'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          rowItem("Title: ", widget.todo["title"]),
          rowItem("ID: ", widget.todo["id"]),
          rowItem("User ID: ", widget.todo["userId"]),
          rowItem("Completed: ", widget.todo["completed"]),
        ],

      ),
    );
  }

  Widget rowItem(String title, dynamic value) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(title),
        ),
        const SizedBox(width: 5),
        Text(value.toString())
      ],
    );
  }
}