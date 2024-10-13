import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/note_page.dart';
import 'package:flutter_application_1/pages/add_page.dart';

class ItemNote extends StatelessWidget {
    final int inpid;

  const ItemNote({super.key, required this.inpid});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: const Color.fromARGB(255, 131, 195, 255), borderRadius: BorderRadius.circular(32)),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,

          child: Column(
            children: [
              const Center(child: Text("Картинка $inpid")),

              //Center(child: Image.asset("pics/ava1.png")),
              
              TextButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => NotePage(id: inpid)),);}, child: Text("Открыть полностью"))
            ],
          ),
        ),
      );
  }
}