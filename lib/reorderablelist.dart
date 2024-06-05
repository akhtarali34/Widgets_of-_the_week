import 'package:flutter/material.dart';

class ReorderablelistPage extends StatefulWidget {
  const ReorderablelistPage({super.key});

  @override
  State<ReorderablelistPage> createState() => _ReorderablelistPageState();
}

class _ReorderablelistPageState extends State<ReorderablelistPage> {
  final List<String> _fruitsList = ["mango", "banana", "dates", "grapes"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reordreable List"),
      ),
      body: ReorderableListView.builder(
          itemBuilder: (context, index) {
            return Card(
              key: ValueKey(_fruitsList[index]),
              child: ListTile(
                title: Text(_fruitsList[index]),
              ),
            );
          },
          itemCount: _fruitsList.length,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final String item = _fruitsList.removeAt(oldIndex);
              _fruitsList.insert(newIndex, item);
            });
          }),
    );
  }
}
