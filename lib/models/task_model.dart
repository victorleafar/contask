class Task {
  final String id;
  String title;
  String description;
  DateTime dueDate;
  String status;
  String? assignedTo;
  DateTime createdAt;
  DateTime updatedAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.status = 'pending',
    this.assignedTo,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  // Validate task data
  void validate() {
    if (title.isEmpty) {
      throw ArgumentError('Title cannot be empty');
    }
    if (description.isEmpty) {
      throw ArgumentError('Description cannot be empty');
    }
    if (dueDate.isBefore(DateTime.now())) {
      throw ArgumentError('Due date cannot be in the past');
    }
  }

  // Convert Task to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'status': status,
      'assignedTo': assignedTo,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  // Create Task from Map
  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dueDate: DateTime.parse(map['dueDate']),
      status: map['status'],
      assignedTo: map['assignedTo'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  // Copy with method for updating task
  Task copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    String? status,
    String? assignedTo,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      assignedTo: assignedTo ?? this.assignedTo,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }
}