import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/item.dart';
import 'add_page.dart';
import 'note_page.dart';

final List<int> ids = <int>[1, 2, 5];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _addNewId(int newId) {
    ids.add(newId);
  }

  void _deleteId(int idToDelete) {
    ids.remove(idToDelete);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Картинки')),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddResourcePage(onAdd: _addNewId),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: ids.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotePage(
                    id: ids[index],
                    onDelete: _deleteId,
                  ),
                ),
              );
            },
            child: ItemNote(inpid: ids[index]),
          );
        },
      ),
    );
  }
}