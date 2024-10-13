import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  final int id;
  final Function(int) onDelete;

  const NotePage({super.key, required this.id, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    String imagePath = "pics/ava$id.png"; 

    return Scaffold(
      appBar: AppBar(
        title: Text("Изображение $id"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Удалить ресурс"),
                    content: const Text("Вы уверены, что хотите удалить этот ресурс?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          
                          Navigator.of(context).pop();
                        },
                        child: const Text("Отмена"),
                      ),
                      TextButton(
                        onPressed: () {
                         
                          onDelete(id);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop(); 
                        },
                        child: const Text("Удалить"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(child: Image.asset(imagePath)),
    );
  }
}