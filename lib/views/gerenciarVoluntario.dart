import 'package:flutter/material.dart';

class GerenciarVoluntarios extends StatefulWidget {
  const GerenciarVoluntarios({super.key});

  @override
  State<GerenciarVoluntarios> createState() => _GerenciarVoluntariosState();
}

class _GerenciarVoluntariosState extends State<GerenciarVoluntarios> {
  // Lista mockada de voluntários
  List<Map<String, String>> voluntarios = [
    {
      'nome': 'Carlos Menezes',
      'idade': '28',
      'habilidades': 'Primeiros Socorros, Ensino',
      'profissao': 'Médico',
      'localizacao': 'São Paulo',
    },
    {
      'nome': 'Ana Costa',
      'idade': '35',
      'habilidades': 'Comunicação, Logística',
      'profissao': 'Advogada',
      'localizacao': 'Rio de Janeiro',
    },
  ];

  void _adicionarVoluntario(Map<String, String> novoVoluntario) {
    setState(() {
      voluntarios.add(novoVoluntario);
    });
  }

  void _editarVoluntario(int index, Map<String, String> voluntarioEditado) {
    setState(() {
      voluntarios[index] = voluntarioEditado;
    });
  }

  void _deletarVoluntario(int index) {
    setState(() {
      voluntarios.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Voluntários'),
        backgroundColor: const Color(0xFF9C3FE4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Ao clicar aqui, vai para a tela de criação de voluntário
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CriarVoluntario(onCriar: _adicionarVoluntario),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9C3FE4),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Cadastrar Novo Voluntário'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: voluntarios.length,
                itemBuilder: (context, index) {
                  var voluntario = voluntarios[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(voluntario['nome']!),
                      subtitle: Text('Idade: ${voluntario['idade']}\n'
                          'Habilidades: ${voluntario['habilidades']}\n'
                          'Profissão: ${voluntario['profissao']}\n'
                          'Localização: ${voluntario['localizacao']}'),
                      leading: const Icon(Icons.person, color: Color(0xFF9C3FE4)),
                      onTap: () {
                        // Ao clicar, podemos redirecionar para a edição de voluntário
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditarVoluntario(
                              voluntario: voluntario,
                              onEditar: (voluntarioEditado) => _editarVoluntario(index, voluntarioEditado),
                            ),
                          ),
                        );
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deletarVoluntario(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CriarVoluntario extends StatefulWidget {
  final Function(Map<String, String>) onCriar;

  const CriarVoluntario({super.key, required this.onCriar});

  @override
  State<CriarVoluntario> createState() => _CriarVoluntarioState();
}

class _CriarVoluntarioState extends State<CriarVoluntario> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Voluntário'),
        backgroundColor: const Color(0xFF9C3FE4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFFD1C4E9),
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 20),
              _buildTextField(nameController, 'Nome'),
              _buildTextField(ageController, 'Idade'),
              _buildTextField(skillsController, 'Habilidades'),
              _buildTextField(professionController, 'Profissão'),
              _buildTextField(locationController, 'Localização'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final novoVoluntario = {
                    'nome': nameController.text,
                    'idade': ageController.text,
                    'habilidades': skillsController.text,
                    'profissao': professionController.text,
                    'localizacao': locationController.text,
                  };
                  widget.onCriar(novoVoluntario);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C3FE4),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Cadastrar Voluntário'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class EditarVoluntario extends StatefulWidget {
  final Map<String, String> voluntario;
  final Function(Map<String, String>) onEditar;

  const EditarVoluntario({super.key, required this.voluntario, required this.onEditar});

  @override
  State<EditarVoluntario> createState() => _EditarVoluntarioState();
}

class _EditarVoluntarioState extends State<EditarVoluntario> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController skillsController;
  late TextEditingController professionController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.voluntario['nome']);
    ageController = TextEditingController(text: widget.voluntario['idade']);
    skillsController = TextEditingController(text: widget.voluntario['habilidades']);
    professionController = TextEditingController(text: widget.voluntario['profissao']);
    locationController = TextEditingController(text: widget.voluntario['localizacao']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Voluntário'),
        backgroundColor: const Color(0xFF9C3FE4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(nameController, 'Nome'),
              _buildTextField(ageController, 'Idade'),
              _buildTextField(skillsController, 'Habilidades'),
              _buildTextField(professionController, 'Profissão'),
              _buildTextField(locationController, 'Localização'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final voluntarioEditado = {
                    'nome': nameController.text,
                    'idade': ageController.text,
                    'habilidades': skillsController.text,
                    'profissao': professionController.text,
                    'localizacao': locationController.text,
                  };
                  widget.onEditar(voluntarioEditado);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C3FE4),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Salvar Alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
