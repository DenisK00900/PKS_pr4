import 'package:flutter/material.dart';

class AddResourcePage extends StatelessWidget {
  final Function(int) onAdd;

  const AddResourcePage({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final TextEditingController imagePathController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Добавить ресурс")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: imagePathController,
              decoration: const InputDecoration(
                labelText: 'Введите ID ресурса',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final String input = imagePathController.text;
                if (input.isNotEmpty) {
                  final int? id = int.tryParse(input);
                  if (id != null) {
                    onAdd(id);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Неккоретный ввод")),
                    );
                  }
                }
              },
              child: const Text("Добавить ресурс"),
            ),
          ],
        ),
      ),
    );
  }
}