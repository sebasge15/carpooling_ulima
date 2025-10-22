// lib/feature/rides/domain/driver.dart
class Driver {
  final String id;
  final String fullName;
  final int age;
  final String universityCode; // ej: 20201234
  final String? photoUrl;
  final int seatsAvailable; // no-nulo

  const Driver({
    required this.id,
    required this.fullName,
    required this.age,
    required this.universityCode,
    this.photoUrl,
    this.seatsAvailable = 0, // 👈 default
  });
}
