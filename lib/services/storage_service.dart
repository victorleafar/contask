import 'dart:convert';
import 'dart:io';

class StorageService {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _getFile(String collection) async {
    final path = await _localPath;
    return File('$path/$collection.json');
  }

  // Save data
  Future<void> save(String collection, String id, Map<String, dynamic> data) async {
    final file = await _getFile(collection);
    Map<String, dynamic> contents = {};
    
    if (await file.exists()) {
      final jsonString = await file.readAsString();
      contents = json.decode(jsonString);
    }
    
    contents[id] = data;
    await file.writeAsString(json.encode(contents));
  }

  // Get all data from collection
  Future<Map<String, dynamic>> getAll(String collection) async {
    try {
      final file = await _getFile(collection);
      if (await file.exists()) {
        final jsonString = await file.readAsString();
        return json.decode(jsonString);
      }
      return {};
    } catch (e) {
      print('Error reading data: $e');
      return {};
    }
  }

  // Get specific item by ID
  Future<Map<String, dynamic>?> get(String collection, String id) async {
    final contents = await getAll(collection);
    return contents[id];
  }

  // Update specific item
  Future<void> update(String collection, String id, Map<String, dynamic> data) async {
    final contents = await getAll(collection);
    contents[id] = data;
    final file = await _getFile(collection);
    await file.writeAsString(json.encode(contents));
  }

  // Delete specific item
  Future<void> delete(String collection, String id) async {
    final contents = await getAll(collection);
    contents.remove(id);
    final file = await _getFile(collection);
    await file.writeAsString(json.encode(contents));
  }

  // Clear all data in a collection
  Future<void> clear(String collection) async {
    final file = await _getFile(collection);
    if (await file.exists()) {
      await file.delete();
    }
  }
  Future<Directory> getApplicationDocumentsDirectory() async {
    return await getApplicationDocumentsDirectory();
  }
  }