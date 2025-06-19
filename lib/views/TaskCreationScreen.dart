import 'package:flutter/material.dart';

class TaskCreationScreen extends StatefulWidget {
  const TaskCreationScreen({super.key});

  @override
  State<TaskCreationScreen> createState() => _TaskCreationScreenState();
}

class _TaskCreationScreenState extends State<TaskCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();
  final List<Map<String, dynamic>> _microTasks = [];
  final ScrollController _scrollController = ScrollController();

  void _showMicroTaskDialog() {
    final Map<String, dynamic> newMicroTask = {
      'title': '',
      'location': '',
      'time': '',
      'availability': '',
      'skills': '',
      'taskType': '',
      'resources': ''
    };
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Título da Microtask'),
                  onChanged: (value) => newMicroTask['title'] = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Lugar'),
                  onChanged: (value) => newMicroTask['location'] = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Horário'),
                  onChanged: (value) => newMicroTask['time'] = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Disponibilidade'),
                  onChanged: (value) => newMicroTask['availability'] = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Habilidades Necessárias'),
                  onChanged: (value) => newMicroTask['skills'] = value,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Tipo de Tarefa'),
                  items: const [
                    DropdownMenuItem(value: 'Campo', child: Text('Campo')),
                    DropdownMenuItem(value: 'Online', child: Text('Online')),
                  ],
                  onChanged: (value) => newMicroTask['taskType'] = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Recursos Necessários'),
                  onChanged: (value) => newMicroTask['resources'] = value,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (newMicroTask['title'].isNotEmpty) {
                      setState(() {
                        _microTasks.add(newMicroTask);
                      });
                      Navigator.pop(context);
                      Future.delayed(const Duration(milliseconds: 300), () {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                        );
                      });
                    }
                  },
                  child: const Text('Adicionar Microtask'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/taskoverview', arguments: {
        'title': _taskNameController.text,
        'description': _taskDescriptionController.text,
        'microTasks': _microTasks,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Tarefa'),
        backgroundColor: const Color(0xFF9C3FE4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _taskNameController,
                decoration: const InputDecoration(labelText: 'Nome da tarefa'),
                validator: (value) => value == null || value.isEmpty ? 'Digite um nome para a tarefa' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _taskDescriptionController,
                decoration: const InputDecoration(labelText: 'Descrição da tarefa'),
                validator: (value) => value == null || value.isEmpty ? 'Digite uma descrição para a tarefa' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _showMicroTaskDialog,
                child: const Text('Adicionar Microtarefa'),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _microTasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(_microTasks[index]['title'] ?? 'Sem título'),
                        subtitle: Text('Local: ${_microTasks[index]['location']} - ${_microTasks[index]['time']}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _microTasks.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _saveTask,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C3FE4),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Salvar tarefa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
