import 'package:flutter/material.dart';
import 'package:flutter_firebase/core/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores para os campos de email e senha.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  // Simulação de login para este exemplo.
  // Em uma implementação real, aqui você invocaria seu AuthService.
  void _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // Simula uma operação de login com delay.
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      // Exemplo: se os campos estiverem vazios, exibe um erro.
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        _errorMessage = 'Por favor, informe email e senha.';
      } else {
        // Para efeitos de exemplo, definindo erro fixo.
        _errorMessage = 'Falha na autenticação. Verifique suas credenciais.';
      }
    });

    // Se o login for bem-sucedido, você pode redirecionar para outra tela.
    // Ex: Navigator.pushReplacementNamed(context, '/posts');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Faça seu login',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _isLoading ? null : _login,
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
