import "dart:io";

void main() {
  var todos = <String>[];

  print("Simple TODO List app");
  print("Commands");
  print("========");
  print("""
Add <todo item> - Adds a todo item to the list
Remove <index> - Removes a todo item at the index
List - show the todo list
Update <index> <todo item> - Updates a todo item at the index
""");

  while (true) {
    stdout.write("Enter command : ");
    String? command = stdin.readLineSync();
    if (command != null) {
      if (!["Add", "Remove", "Update", "List"].contains(command)) {
        print("Unknow Command !");
        break;
      }

      switch (command) {
        case "Add":
          stdout.write("Enter task name to add :");
          String? taskName = stdin.readLineSync();

          if (taskName == null) {
            throw Exception("No Task Name but required");
          }

          todos.add(taskName);
          print("Task $taskName has successfully added to TODO List");
        case "Remove":
          stdout.write("Enter task name to remove :");
          String? taskName = stdin.readLineSync();
          todos.removeWhere((element) => element == taskName);
          print("Successfully remove $taskName from TODO List");
        case "Update":
          stdout.write("Enter task name to update :");
          String? taskName = stdin.readLineSync();
          if (taskName == null) {
            print("Cannot update Task because task name is null");
            break;
          }

          int selectedTaskIdx = todos.indexOf(taskName);

          if (selectedTaskIdx == -1) {
            print("Task $taskName not found!");
            break;
          }

          stdout.write("Enter new task name :");
          String? newTaskName = stdin.readLineSync();

          if (newTaskName == null) {
            print("Cannot update Task because doesn't has new task name");
            break;
          }

          todos[selectedTaskIdx] = newTaskName;
          print("Update $taskName to $newTaskName successfully");
        case "List":
          int todoLength = todos.length;
          print("-- TODO LIST ($todoLength) --");
          for (var todo in todos) {
            print(todo);
          }
      }
    }
  }
}
