import 'dart:math';
import 'package:flutter/material.dart';

class Atribuicao {
  final String microtarefa;
  final String voluntario;

  Atribuicao({required this.microtarefa, required this.voluntario});
}

class AtribuicaoVoluntarios extends StatefulWidget {
  const AtribuicaoVoluntarios({super.key});

  @override
  _AtribuicaoVoluntariosState createState() => _AtribuicaoVoluntariosState();
}

class _AtribuicaoVoluntariosState extends State<AtribuicaoVoluntarios> {
  final List<String> microtarefas = ['Microtarefa 1', 'Microtarefa 2', 'Microtarefa 3', 'Microtarefa 4'];
  final List<String> voluntarios = [
    'Voluntário 1', 'Voluntário 2', 'Voluntário 3', 'Voluntário 4',
    'Voluntário 5', 'Voluntário 6', 'Voluntário 7', 'Voluntário 8',
    'Voluntário 9', 'Voluntário 10', 'Voluntário 11', 'Voluntário 12',
    // ... e assim por diante, até 100 voluntários
  ];

  List<Atribuicao> atribuicoes = [];
  bool atribuido = false; // Controla a exibição do botão OK

  // Função para atribuição aleatória
  void atribuirVoluntarios() {
    setState(() {
      atribuicoes.clear();
      final random = Random();

      // Embaralha a lista de voluntários para uma atribuição aleatória
      voluntarios.shuffle(random);

      // Atribui aleatoriamente os voluntários às microtarefas
      for (int i = 0; i < microtarefas.length; i++) {
        String voluntario = voluntarios[i % voluntarios.length]; // Garante que todos os voluntários sejam usados
        atribuicoes.add(Atribuicao(microtarefa: microtarefas[i], voluntario: voluntario));
      }

      atribuido = true; // Marca que a atribuição foi realizada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atribuição de Voluntários'),
        backgroundColor: const Color(0xFF9C3FE4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Atribua Voluntários às Microtarefas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: atribuirVoluntarios,
              child: const Text('Atribuir Voluntários Aleatoriamente'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9C3FE4),
              ),
            ),
            const SizedBox(height: 20),
            if (atribuicoes.isNotEmpty)
              const Text(
                'Atribuições Realizadas:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 10),
            if (atribuicoes.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                itemCount: atribuicoes.length,
                itemBuilder: (context, index) {
                  final atribuicao = atribuicoes[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(atribuicao.microtarefa),
                      subtitle: Text('Atribuído a: ${atribuicao.voluntario}'),
                      trailing: const Icon(Icons.check_circle, color: Colors.green),
                    ),
                  );
                },
              ),
            const SizedBox(height: 20),
            // Botão OK só será mostrado após a atribuição
            if (atribuido)
              ElevatedButton(
                onPressed: () {
                  // Navega para a tela de Área Logada
                  Navigator.pushReplacementNamed(context, '/arealogada');
                },
                child: const Text('OK - Voltar à Área Logada'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C3FE4),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
