import 'package:flutter/material.dart';

class AreaLogada extends StatelessWidget {
  const AreaLogada({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF9C3FE4),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF9C3FE4),
              ),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pushNamed(context, '/profilescreen');
              },
            ),
            ListTile(
              title: const Text('Criar Task'),
              onTap: () {
                Navigator.pushNamed(context, '/taskcreationscreen');
              },
            ),
            ListTile(
              title: const Text('Gerenciar Voluntários'),
              onTap: () {
                Navigator.pushNamed(context, '/gerenciarvoluntarios');
              },
            ),
              ListTile(
              title: const Text('Acompanhar Tasks'),
              onTap: () {
                Navigator.pushNamed(context, '/acompanhamentotask');
              },
            ),

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bem-vindo à Home!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  color: Colors.purple.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          index == 0
                              ? Icons.task_alt
                              : index == 1
                                  ? Icons.people
                                  : index == 2
                                      ? Icons.bar_chart
                                      : Icons.event_note,
                          size: 40,
                          color: Colors.purple.shade600,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          index == 0
                              ? 'Tarefas Pendentes'
                              : index == 1
                                  ? 'Voluntários'
                                  : index == 2
                                      ? 'Relatórios de Atividades'
                                      : 'Status das Tarefas',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          index == 0
                              ? '5 Tarefas'
                              : index == 1
                                  ? '10 Voluntários'
                                  : index == 2
                                      ? 'Ver Relatórios'
                                      : 'Tarefas em andamento',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
