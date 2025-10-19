import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Accede a tu cuenta UniCarpool', style: t.titleMedium),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Correo universitario',
                prefixIcon: Icon(Icons.school),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}
