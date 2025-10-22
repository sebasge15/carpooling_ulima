// lib/feature/rides/presentation/driver_route/driver_route_view.dart
import 'package:flutter/material.dart';

class DriverRouteView extends StatelessWidget {
  const DriverRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ruta del conductor')),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: _SimpleMap(),
        ),
      ),
    );
  }
}

class _SimpleMap extends StatelessWidget {
  const _SimpleMap();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // 👇 pinta ENCIMA del child
      foregroundPainter: _RoutePainter(),
      child: Container(
        width: double.infinity,
        height: 400,
        color: Colors.grey.shade200, // fondo tipo mapa
      ),
    );
  }
}

class _RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Ruta (naranja)
    final paintRoute = Paint()
      ..color = const Color(0xFFFF6A00)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final start = Offset(size.width * 0.2, size.height * 0.2);
    final end   = Offset(size.width * 0.8, size.height * 0.8);

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..quadraticBezierTo(
        size.width * 0.5, size.height * 0.4, end.dx, end.dy,
      );
    canvas.drawPath(path, paintRoute);

    // Punto A: “edificio”
    final paintBuilding = Paint()..color = const Color(0xFFE05A00);
    const buildingSize = 28.0;
    final buildingRect = Rect.fromCenter(center: start, width: buildingSize, height: buildingSize);
    canvas.drawRect(buildingRect, paintBuilding);

    // Ventanas del edificio
    final window = Paint()..color = Colors.white;
    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 2; c++) {
        canvas.drawRect(
          Rect.fromLTWH(
            buildingRect.left + 6 + c * 8,
            buildingRect.top  + 6 + r * 8,
            4, 4,
          ),
          window,
        );
      }
    }

    // Punto B: círculo
    final paintCircle = Paint()..color = const Color(0xFFFF8A33);
    canvas.drawCircle(end, 10, paintCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
