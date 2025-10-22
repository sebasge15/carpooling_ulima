import 'package:flutter/material.dart';
import '../../domain/driver.dart';

class RegisterRideView extends StatelessWidget {
  const RegisterRideView({super.key});

  @override
  Widget build(BuildContext context) {
    final driver = ModalRoute.of(context)!.settings.arguments as Driver?;

    return Scaffold(
      appBar: AppBar(title: const Text('Registro para el viaje')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          driver == null
              ? 'Completa tus datos para registrarte.'
              : 'Registrarte con el conductor: ${driver.fullName} (${driver.universityCode})',
        ),
      ),
    );
  }
}
