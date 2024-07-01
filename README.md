# flutter_application_18

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Widget Dialog

Dialog merupakan confirm yang merupakan sebuah alert pada flutter. showDialog merupakan sebuah fungsi untuk memanggil Dialog Widget jika di panggil Dialog tersebut akan berada di bagian paling atas sebuah layar. fungsi showDialog membutuhkan sebuah context dan builder sebagai required named argument. dimana pada builder membutuhkan sebuah fungsi yang mengembalikan sebuah widget AlertDialog.

```dart
showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('CONFIRM'),
              );
            },
          );
```

pada widget AlertDialog terdapat beberapa properti atau name argument yang bisa memodifikasi sebuah alert.

- title : membutuhkan Widget visible yang digunakan untuk menandai dialog
- content : membutuhkan widget visible yang digunakan untuk mendeskripsikan dialog
- actions : membutuhkan list of widget yang akan digunakan untuk membuat tampilan pada dialog dan fungsi - fungsi button agar interactive.

show dialog sendiri merupakan Future yang dapat melakukan fungsi .then

```dart
shiwDialog().then((value) => print(value))
```

untuk membuang sebuah lapisan yang menutupi tampilan layar dapat menggunakan

- Navigator.of(contex).pop() : digunakan untuk membuang lapisan terluar dari layar tampilan.

```dart
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

```

