class Volunteer {
  final String id;
  String name;
  String email;
  String phone;
  List<String> skills;
  bool isAvailable;
  DateTime createdAt;
  DateTime updatedAt;

  Volunteer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    List<String>? skills,
    this.isAvailable = true,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : skills = skills ?? [],
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  // Validate volunteer data
  void validate() {
    if (name.isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }
    if (email.isEmpty) {
      throw ArgumentError('Email cannot be empty');
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      throw ArgumentError('Invalid email format');
    }
    if (phone.isEmpty) {
      throw ArgumentError('Phone cannot be empty');
    }
    if (!RegExp(r'^\+?[\d\s-]+$').hasMatch(phone)) {
      throw ArgumentError('Invalid phone format');
    }
  }

  // Convert Volunteer to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'skills': skills,
      'isAvailable': isAvailable,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  // Create Volunteer from Map
  static Volunteer fromMap(Map<String, dynamic> map) {
    return Volunteer(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      skills: List<String>.from(map['skills']),
      isAvailable: map['isAvailable'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  // Copy with method for updating volunteer
  Volunteer copyWith({
    String? name,
    String? email,
    String? phone,
    List<String>? skills,
    bool? isAvailable,
  }) {
    return Volunteer(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      skills: skills ?? List.from(this.skills),
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }
}