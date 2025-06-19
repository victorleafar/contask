import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Stack(
        children: [
          // Fundo com gradiente
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF9C3FE4), // Cor principal (roxo vibrante)
                  Color(0xFF713ABE), // Tom mais escuro para um efeito mais bonito
                ],
              ),
            ),
          ),
          // Conteúdo principal
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Ícone grande para reforçar identidade visual
                  const Icon(
                    Icons.volunteer_activism,
                    size: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  // Título principal com efeito elegante
                  Text(
                    'Bem-vindo ao Contask!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black26,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  // Descrição com melhor leitura
                  Text(
                    'Gerencie microtarefas e coordene voluntários para a recuperação de comunidades afetadas por crises.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // Botão estilizado
                  CustomButton(
                    text: 'Começar Agora',
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
