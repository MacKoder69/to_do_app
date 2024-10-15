import 'package:flutter/material.dart';
import 'package:to_do_app/komponente/to-do-item.dart';

class Pocetna extends StatefulWidget {
  Pocetna({super.key});

  @override
  State<Pocetna> createState() => _PocetnaState();
}

class _PocetnaState extends State<Pocetna> {
  final _controller = TextEditingController();
  List toDoList = [
    ['Napravi Flutter aplikaciju', true],
    ['Nemoj pošizit', false]
  ];

  void promjenaCheckboxa(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void dodajStavku() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void izbrisiStavku(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo aplikacija',
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return toDoItem(
            ime: toDoList[index][0],
            gotovo: toDoList[index][1],
            promjena: (value) => promjenaCheckboxa(index),
            izbrisi: (contex) => izbrisiStavku(index),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Dodaj novu stavku',
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: dodajStavku,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}