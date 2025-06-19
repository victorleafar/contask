import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isButtonEnabled = false;
  bool _isTestMode = true; // Ativar ou desativar o modo de teste

  void _validateFields() {
    setState(() {
      _isButtonEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });

        String email = _emailController.text;
        String password = _passwordController.text;

        if (email == 'victormartinezrc@gmail.com' && password == 'Teste@123') {
          Navigator.pushReplacementNamed(context, '/arealogada');
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Erro'),
                content: const Text('Credenciais incorretas. Tente novamente.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateFields);
    _passwordController.addListener(_validateFields);

    if (_isTestMode) {
      _emailController.text = 'victormartinezrc@gmail.com';
      _passwordController.text = 'Teste@123';
      Future.delayed(const Duration(milliseconds: 500), () {
        _login();
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contask'),
        backgroundColor: const Color(0xFF9C3FE4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF9C3FE4)),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite seu email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Digite um email válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF9C3FE4)),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite sua senha';
                  } else if (value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _isButtonEnabled ? _login : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9C3FE4),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Entrar'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
