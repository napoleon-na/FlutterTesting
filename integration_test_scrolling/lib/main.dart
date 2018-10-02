import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp(
  items: List<String>.generate(10000, (i) => "Item $i"),
));

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          key: Key('long_list'),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${items[index]}',
                key: Key('item_${index}_text'),
              ),
            );
          },
        ),
      ),
    );
  }
}