import 'package:flutter/material.dart';
import '../views/home_screen.dart';
import '../views/login_screen.dart';
import '../views/TaskCreationScreen.dart';
import '../views/TaskOverview.dart';
import '../views/areaLogada.dart';
import '../views/profile.dart';
import '../views/gerenciarVoluntario.dart';
import '../views/atribuirtask.dart';
import '../views/AcompanhamentoScreen.dart';
final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),  // Tela inicial
  '/login': (context) => const LoginScreen(),  // Tela de login
  '/taskcreationscreen': (context) => const TaskCreationScreen(),
  '/taskoverview': (context) => const TaskOverviewScreen(),
  '/arealogada': (context) => const AreaLogada(),
  '/profilescreen': (context) => const ProfileScreen(),
  '/gerenciarvoluntarios': (context) => const GerenciarVoluntarios(),
  '/atribuirtask': (context) => const AtribuicaoVoluntarios(),
  '/acompanhamentotask': (context) => const AcompanhamentoScreen(),
};
