import '../models/user_model.dart';
import '../services/storage_service.dart';

class UserRepository {
  final StorageService _storage;
  final String _collectionName = 'users';

  UserRepository(this._storage);

  // Create a new user
  Future<void> create(User user) async {
    try {
      user.validate();
      await _storage.save(_collectionName, user.id, user.toMap());
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  // Get all users
  Future<List<User>> getAll() async {
    try {
      final usersMap = await _storage.getAll(_collectionName);
      return usersMap.entries
          .map((entry) => User.fromMap(entry.value))
          .toList();
    } catch (e) {
      throw Exception('Failed to get users: $e');
    }
  }

  // Update existing user
  Future<void> update(User user) async {
    try {
      user.validate();
      await _storage.update(_collectionName, user.id, user.toMap());
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  // Delete user
  Future<void> delete(String userId) async {
    try {
      await _storage.delete(_collectionName, userId);
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }

  // Get user by ID
  Future<User?> getById(String userId) async {
    try {
      final userMap = await _storage.get(_collectionName, userId);
      if (userMap != null) {
        return User.fromMap(userMap);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }
}