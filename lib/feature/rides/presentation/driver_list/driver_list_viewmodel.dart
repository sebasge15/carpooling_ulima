import 'package:flutter/material.dart';

// 👇 corrige los paths (evita los // duplicados)
import '../../../../core/router/app_router.dart';
import '../../../rides/domain/driver.dart';

class DriverListViewModel extends ChangeNotifier {
  // 🔶 Dummy data para frontend (puedes cambiar nombres/fotos)
  final List<Driver> _drivers = const [
    Driver(
      id: 'd1',
      fullName: 'María Fernanda López',
      age: 22,
      universityCode: '20201234',
      photoUrl: 'https://i.pravatar.cc/150?img=47',
      seatsAvailable: 4, // si tu modelo lo pide, ya está cubierto
    ),
    Driver(
      id: 'd2',
      fullName: 'Juan Carlos Reyes',
      age: 24,
      universityCode: '20205678',
      photoUrl: 'https://i.pravatar.cc/150?img=12',
      seatsAvailable: 4,
    ),
    Driver(
      id: 'd3',
      fullName: 'Ana Lucía Torres',
      age: 21,
      universityCode: '20207890',
      photoUrl: 'https://i.pravatar.cc/150?img=32',
      seatsAvailable: 4,
    ),
  ];

  List<Driver> get drivers => List.unmodifiable(_drivers);

  // 👉 Ver Ruta
  void onTapVerRuta(BuildContext context, Driver d) {
    Navigator.pushNamed(context, AppRouter.driverRoute, arguments: d);
  }

  // 👉 Registrarme (frontend-only, hardcode seats = 4)
  Future<void> onTapRegistrarme(BuildContext context, Driver d) async {
    const int seats = 4;

    // 1) Confirmación
    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: const [
            Icon(Icons.event_seat),
            SizedBox(width: 8),
            Text('Confirmar registro'),
          ],
        ),
        content: Text(
          'Asientos disponibles: $seats\n\n'
              '¿Deseas registrarte en la ruta de ${d.fullName}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Confirmar registro'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    // 2) Éxito (verde)
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        final green = Colors.green.shade600;
        return AlertDialog(
          backgroundColor: Colors.green.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.check_circle, color: green),
              const SizedBox(width: 8),
              Text('¡Registro exitoso!', style: TextStyle(color: green)),
            ],
          ),
          content: Text(
            'Registro de ruta exitoso.',
            style: TextStyle(color: green),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text('OK', style: TextStyle(color: green)),
            ),
          ],
        );
      },
    );
  }
}
