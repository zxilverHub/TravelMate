class Destination {
  final int id;
  final String name;
  final int distance;

  Destination({required this.id, required this.name, required this.distance});

  // Factory constructor to parse from JSON
  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'],
      name: json['name'],
      distance: json['distance'],
    );
  }
}
