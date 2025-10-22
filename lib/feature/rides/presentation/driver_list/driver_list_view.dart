import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'driver_list_viewmodel.dart';
import '../../../rides/domain/driver.dart';

class DriverListView extends StatelessWidget {
  const DriverListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DriverListViewModel>(
      create: (context) => DriverListViewModel(),
      child: const _DriverListBody(),
    );
  }
}

class _DriverListBody extends StatelessWidget {
  const _DriverListBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DriverListViewModel>();
    final items = vm.drivers;

    return Scaffold(
      appBar: AppBar(title: const Text('Conductores disponibles')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🧩 Banner de depuración (para ver cuántos items hay)
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.black12,
              child: Text(
                'Cantidad: ${items.length}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            // 🔽 Lista de conductores
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                child: items.isEmpty
                    ? const Center(
                  child: Text('No hay conductores por ahora'),
                )
                    : ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final d = items[index];
                    return _DriverCard(
                      driver: d,
                      onVerRuta: () => vm.onTapVerRuta(context, d),
                      onRegistrarme: () =>
                          vm.onTapRegistrarme(context, d),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DriverCard extends StatelessWidget {
  final Driver driver;
  final VoidCallback onVerRuta;
  final VoidCallback onRegistrarme;

  const _DriverCard({
    required this.driver,
    required this.onVerRuta,
    required this.onRegistrarme,
  });

  @override
  Widget build(BuildContext context) {
    final hasPhoto = driver.photoUrl != null && driver.photoUrl!.isNotEmpty;

    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👤 Avatar seguro (no lanza excepciones si falla la imagen)
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey[200],
              backgroundImage:
              hasPhoto ? NetworkImage(driver.photoUrl!) : null,
              onBackgroundImageError: (_, __) {},
              child: !hasPhoto
                  ? const Icon(Icons.person, size: 30, color: Colors.grey)
                  : null,
            ),
            const SizedBox(width: 16),

            // 📋 Información del conductor
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    driver.fullName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 2),
                  Text('Edad: ${driver.age}'),
                  Text('Código: ${driver.universityCode}'),
                ],
              ),
            ),

            // 🧭 Botones
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(90, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: onVerRuta,
                  child: const Text('Ver Ruta'),
                ),
                const SizedBox(height: 6),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(90, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: onRegistrarme,
                  child: const Text('Registrarme'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
