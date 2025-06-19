import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController =
      TextEditingController(text: 'Victor Martinez');
  final TextEditingController roleController =
      TextEditingController(text: 'Gestor');
  final TextEditingController volunteersController =
      TextEditingController(text: '150');
  final TextEditingController projectsController =
      TextEditingController(text: '12');
  final TextEditingController communitiesController =
      TextEditingController(text: '8');

  final List<Map<String, String>> activities = [
    {'title': 'Distribuição de Alimentos', 'date': '15 de Fevereiro, 2025'},
    {'title': 'Reconstrução de Casas', 'date': '10 de Fevereiro, 2025'},
    {'title': 'Mutirão de Limpeza', 'date': '5 de Fevereiro, 2025'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Gestor'),
        backgroundColor: const Color(0xFF9C3FE4), // Cor personalizada
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ícone Mockado no lugar da Imagem
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFD1C4E9), // Lilás claro para combinar
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 10),
            _buildEditableField(nameController, 'Nome'),
            _buildEditableField(roleController, 'Cargo'),
            const SizedBox(height: 20),

            // Estatísticas Editáveis
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatField(volunteersController, 'Voluntários'),
                _buildStatField(projectsController, 'Projetos Ativos'),
                _buildStatField(communitiesController, 'Comunidades Apoiadas'),
              ],
            ),

            const SizedBox(height: 30),

            // Atividades Recentes
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Atividades Recentes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return _ActivityTile(
                    title: activities[index]['title']!,
                    date: activities[index]['date']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: label,
      ),
    );
  }

  Widget _buildStatField(TextEditingController controller, String label) {
    return Column(
      children: [
        SizedBox(
          width: 60,
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}

class _ActivityTile extends StatelessWidget {
  final String title;
  final String date;

  const _ActivityTile({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date),
        leading: const Icon(Icons.volunteer_activism, color: Color(0xFF9C3FE4)),
      ),
    );
  }
}
