import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = "belum ada input";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIALOG'),
      ),
      body: Center(
        child: Text(data),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('CONFIRM'),
                content: Text('are you sure to delete this item?'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        data = "false";
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'No',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        data = "true";
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Yes',
                    ),
                  ),
                ],
              );
            },
          ).then(
            (value) {
              return value;
            },
          );
        },
        child: const Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
