import 'package:flutter/material.dart';
import '../task.dart';

class TaskScreen extends StatefulWidget {
  final DateTime date;

  TaskScreen({required this.date});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [];

  void addTask(String title) {
    if (title.isEmpty) return;

    setState(() {
      tasks.add(Task(title: title));
      sortTasks();
    });
  }

  void sortTasks() {
    tasks.sort((a, b) {
      if (a.isDone == b.isDone) {
        return a.title.compareTo(b.title);
      }
      return a.isDone ? 1 : -1;
    });
  }

  void showAddDialog() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Nova tarefa"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Digite a tarefa"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              addTask(controller.text);
              Navigator.pop(context);
            },
            child: Text("Adicionar"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String dateText =
        "${widget.date.day}/${widget.date.month}/${widget.date.year}";

    return Scaffold(
      appBar: AppBar(title: Text("Tarefas - $dateText")),

      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: tasks.isEmpty
            ? Center(child: Text("Nenhuma tarefa ainda 😄"))
            : ListView(
                children: tasks.map((task) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      leading: Checkbox(
                        value: task.isDone,
                        activeColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            task.isDone = value!;
                            sortTasks();
                          });
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            tasks.remove(task);
                          });
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }
}