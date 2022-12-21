import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:semifinal_bacala/todo_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();

}
String baseURL = 'https://jsonplaceholder.typicode.com/todos';


class _HomePageState extends State<HomePage> {
  List getResponse = <dynamic>[];

  getTodo() async {
    var url = Uri.parse(baseURL);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        getResponse = jsonDecode(response.body) as List<dynamic>;
      });
    } else {
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodo();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: getResponse.length,
        itemBuilder: (context, index) {
          return  CheckboxListTile(
            title: Text('${getResponse[index]['title']}'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.blue,
            secondary: IconButton(
              onPressed: () async {
                var check = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(todo: getResponse[index])));
              },
              tooltip: 'View Data',
              icon:const Icon(Icons.arrow_forward_outlined, size: 20,),
              color: Colors.blue,
            ),

            value: getResponse[index]['completed'],
            onChanged: (bool? value) {
              setState(() {
                getResponse[index]['completed'] = value!;
              });
            },
          );

        },
      ),

    );
  }
}