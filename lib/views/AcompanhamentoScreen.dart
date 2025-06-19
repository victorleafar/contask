import 'package:flutter/material.dart';

class AcompanhamentoScreen extends StatefulWidget {
  const AcompanhamentoScreen({super.key});

  @override
  _AcompanhamentoScreenState createState() => _AcompanhamentoScreenState();
}

class _AcompanhamentoScreenState extends State<AcompanhamentoScreen> {
  // Lista de tarefas principais e suas microtarefas
  final List<Map<String, dynamic>> _tarefas = [
    {
      'title': 'Tarefa Principal 1',
      'microtarefas': [
        {
          'title': 'Microtarefa 1',
          'status': 'Aguardando',
          'responsavel': 'João',
          'progresso': 0.2
        },
        {
          'title': 'Microtarefa 2',
          'status': 'Em progresso',
          'responsavel': 'Maria',
          'progresso': 0.5
        }
      ]
    },
    {
      'title': 'Tarefa Principal 2',
      'microtarefas': [
        {
          'title': 'Microtarefa 3',
          'status': 'Concluída',
          'responsavel': 'Carlos',
          'progresso': 1.0
        },
        {
          'title': 'Microtarefa 4',
          'status': 'Aguardando',
          'responsavel': 'Ana',
          'progresso': 0.0
        }
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acompanhamento das Microtarefas'),
        backgroundColor: const Color(0xFF9C3FE4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _tarefas.length,
          itemBuilder: (context, tarefaIndex) {
            final tarefa = _tarefas[tarefaIndex];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.purple.shade100,
              child: ExpansionTile(
                title: Text(
                  tarefa['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                children: [
                  // Lista de microtarefas dentro da tarefa principal
                  for (var i = 0; i < tarefa['microtarefas'].length; i++)
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text(
                          tarefa['microtarefas'][i]['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Responsável: ${tarefa['microtarefas'][i]['responsavel']}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              'Status: ${tarefa['microtarefas'][i]['status']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: tarefa['microtarefas'][i]['progresso'],
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
