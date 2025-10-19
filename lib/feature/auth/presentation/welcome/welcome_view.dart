import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'welcome_viewmodel.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WelcomeViewModel(),
      child: const _WelcomeScaffold(),
    );
  }
}

class _WelcomeScaffold extends StatelessWidget {
  const _WelcomeScaffold();

  @override
  Widget build(BuildContext context) {
    final vm = context.read<WelcomeViewModel>();
    final t = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, c) {
            final maxW = c.maxWidth;
            final cardW = maxW > 500 ? 420.0 : maxW * .9;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('UniCarpool', style: t.headlineMedium),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: cardW),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('¡Bienvenido!', style: t.titleMedium),
                              const SizedBox(height: 8),
                              Text(
                                'Conéctate con otros estudiantes y comparte tu viaje universitario.',
                                style: t.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              // Botón primario
                              ElevatedButton(
                                onPressed: () => vm.onTapLogin(context),
                                child: const Text('Iniciar sesión'),
                              ),
                              const SizedBox(height: 12),
                              // Botón secundario
                              OutlinedButton(
                                onPressed: () => vm.onTapRegister(context),
                                child: const Text('Registrarse'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '© 2025 UniCarpool. Todos los derechos reservados.',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
