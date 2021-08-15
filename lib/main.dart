import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String output = "";
  func() async {
    var url = Uri.http("13.232.105.84", "/cgi-bin/a.py", {"x": cmd});
    var o = await http.get(url);
    //print(o.body);
    setState(() {
      output = o.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("LINUX"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
                onChanged: (value) {
                  cmd = value;
                },
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter any command",
                )),
            TextButton(
              onPressed: func,
              child: Text("Submit"),
            ),
            Container(child: Text("$output"))
          ],
        ),
      ),
    );
  }
}
