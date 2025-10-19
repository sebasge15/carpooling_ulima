import 'package:flutter/material.dart';

class AppTheme {
  // 🎨 Paleta principal
  static const Color primary = Color(0xFFFF6A00); // Naranja principal
  static const Color bgSoft = Color(0xFFFEF5EC);  // Fondo suave beige

  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: primary),
      scaffoldBackgroundColor: bgSoft,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black87,
      ),

      // 🔶 Botón principal (elevado)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),

      // 🔲 Botón secundario (outlined)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          side: const BorderSide(color: primary, width: 1.6),
          minimumSize: const Size.fromHeight(48),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),

      // 🃏 Tarjetas (Cards)
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),





      // ✍️ Textos generales
      textTheme: base.textTheme.copyWith(
        headlineMedium: const TextStyle(
          fontWeight: FontWeight.w800,
          color: primary,
          fontSize: 28,
          letterSpacing: -0.5,
        ),
        titleMedium: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.black87,
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          color: Colors.black.withAlpha(191), // 75% opacity
          height: 1.35,
          fontSize: 15,
        ),
        bodySmall: TextStyle(
          color: Colors.black54,
          fontSize: 13,
        ),
      ),

      // Campos de texto
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primary, width: 1.6),
        ),
        labelStyle: TextStyle(color: Colors.grey.shade700),
        prefixIconColor: primary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
