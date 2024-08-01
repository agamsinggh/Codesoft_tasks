import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

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
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 162, 161, 164),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                checkColor: const Color.fromARGB(255, 255, 250, 250),
                activeColor: const Color.fromARGB(255, 4, 4, 4),
                side: const BorderSide(
                  color: Color.fromARGB(255, 4, 4, 4),
                ),
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: const Color.fromARGB(255, 9, 9, 9),
                  fontSize: 20,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: const Color.fromARGB(255, 15, 14, 14),
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
