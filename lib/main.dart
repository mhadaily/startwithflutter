import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Workshop',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({
    this.title,
  });

  final bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50.0),
        // condition ? whatisTrue : whatisFlase;
        child: isDark
            ? AmazingWidget(
                title: title,
              )
            : NewWidget(),
      ),
    );
  }
}

class AmazingWidget extends StatelessWidget {
  final String title;

  AmazingWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 40.0),
            ),
            Text(title),
            Text(title),
          ],
        ),
        Text(title),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  final List<String> names = ['Majid', 'Anikait'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          subtitle: Text('Name'),
          title: Text(
            names[index],
            style: TextStyle(color: Colors.amber),
          ),
        );
      },
    );
  }
}
