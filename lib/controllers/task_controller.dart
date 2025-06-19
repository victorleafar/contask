import '../models/task_model.dart';
import '../repositories/task_repository.dart';

class TaskController {
  final TaskRepository _repository;

  TaskController(this._repository);

  // Create a new task
  Future<bool> createTask(Task task) async {
    try {
      await _repository.create(task);
      return true;
    } catch (e) {
      print('Error creating task: $e');
      return false;
    }
  }

  // Get all tasks
  Future<List<Task>> getAllTasks() async {
    try {
      return await _repository.getAll();
    } catch (e) {
      print('Error getting tasks: $e');
      return [];
    }
  }

  // Update existing task
  Future<bool> updateTask(Task task) async {
    try {
      await _repository.update(task);
      return true;
    } catch (e) {
      print('Error updating task: $e');
      return false;
    }
  }

  // Delete task
  Future<bool> deleteTask(String taskId) async {
    try {
      await _repository.delete(taskId);
      return true;
    } catch (e) {
      print('Error deleting task: $e');
      return false;
    }
  }

  // Get task by ID
  Future<Task?> getTaskById(String taskId) async {
    try {
      return await _repository.getById(taskId);
    } catch (e) {
      print('Error getting task by ID: $e');
      return null;
    }
  }
}