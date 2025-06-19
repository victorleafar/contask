import '../models/volunteer_model.dart';
import '../services/storage_service.dart';

class VolunteerRepository {
  final StorageService _storage;
  final String _collectionName = 'volunteers';

  VolunteerRepository(this._storage);

  // Create a new volunteer
  Future<void> create(Volunteer volunteer) async {
    await _storage.save(_collectionName, volunteer.id, volunteer.toMap());
  }

  // Get all volunteers
  Future<List<Volunteer>> getAll() async {
    final volunteersMap = await _storage.getAll(_collectionName);
    return volunteersMap.entries
        .map((entry) => Volunteer.fromMap(entry.value))
        .toList();
  }

  // Update existing volunteer
  Future<void> update(Volunteer volunteer) async {
    await _storage.update(_collectionName, volunteer.id, volunteer.toMap());
  }

  // Delete volunteer
  Future<void> delete(String volunteerId) async {
    await _storage.delete(_collectionName, volunteerId);
  }

  // Get volunteer by ID 
  Future<Volunteer?> getById(String volunteerId) async {
    final volunteerMap = await _storage.get(_collectionName, volunteerId);
    if (volunteerMap != null) {
      return Volunteer.fromMap(volunteerMap);
    }
    return null;
  }
}