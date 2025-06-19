import 'package:flutter/material.dart';

class TaskOverviewScreen extends StatelessWidget {
  const TaskOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String title = args['title'];
    final String description = args['description'];
    final List<Map<String, dynamic>> microTasks = args['microTasks'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Task'),
        backgroundColor: const Color(0xFF9C3FE4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: microTasks.length,
                itemBuilder: (context, index) {
                  final microTask = microTasks[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        microTask['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(microTask['location']),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/atribuirtask');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C3FE4),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'Atribuir Voluntários',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
