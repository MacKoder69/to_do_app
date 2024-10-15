import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class toDoItem extends StatelessWidget {
  const toDoItem({
    super.key,
    required this.ime,
    required this.gotovo,
    required this.promjena,
    required this.izbrisi,
  });

  final String ime;
  final bool gotovo;
  final Function(bool?)? promjena;
  final Function(BuildContext)? izbrisi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: izbrisi,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Checkbox(
                value: gotovo,
                onChanged: promjena,
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: const BorderSide(
                  color: Colors.white,
                ),
              ),
              Text(
                ime,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: gotovo
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}