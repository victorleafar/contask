import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserController {
  final UserRepository _repository;

  UserController(this._repository);

  // Create new user
  Future<bool> createUser(User user) async {
    try {
      await _repository.create(user);
      return true;
    } catch (e) {
      print('Error creating user: $e');
      return false;
    }
  }

  // Get all users
  Future<List<User>> getAllUsers() async {
    try {
      return await _repository.getAll();
    } catch (e) {
      print('Error getting users: $e');
      return [];
    }
  }

  // Update existing user
  Future<bool> updateUser(User user) async {
    try {
      await _repository.update(user);
      return true;
    } catch (e) {
      print('Error updating user: $e');
      return false;
    }
  }

  // Delete user
  Future<bool> deleteUser(String userId) async {
    try {
      await _repository.delete(userId);
      return true;
    } catch (e) {
      print('Error deleting user: $e');
      return false;
    }
  }

  // Get user by ID
  Future<User?> getUserById(String userId) async {
    try {
      return await _repository.getById(userId);
    } catch (e) {
      print('Error getting user by ID: $e');
      return null;
    }
  }
}