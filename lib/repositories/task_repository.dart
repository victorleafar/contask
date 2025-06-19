import '../models/task_model.dart';
import '../services/storage_service.dart';

class TaskRepository {
  final StorageService _storage;
  final String _collectionName = 'tasks';

  TaskRepository(this._storage);

  // Create a new task
  Future<void> create(Task task) async {
    await _storage.save(_collectionName, task.id, task.toMap());
  }

  // Get all tasks
  Future<List<Task>> getAll() async {
    final tasksMap = await _storage.getAll(_collectionName);
    return tasksMap.entries
        .map((entry) => Task.fromMap(entry.value))
        .toList();
  }

  // Update existing task
  Future<void> update(Task task) async {
    await _storage.update(_collectionName, task.id, task.toMap());
  }

  // Delete task
  Future<void> delete(String taskId) async {
    await _storage.delete(_collectionName, taskId);
  }

  // Get task by ID
  Future<Task?> getById(String taskId) async {
    final taskMap = await _storage.get(_collectionName, taskId);
    if (taskMap != null) {
      return Task.fromMap(taskMap);
    }
    return null;
  }
}