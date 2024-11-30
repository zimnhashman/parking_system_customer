class ParkingLot {
  final int id;
  final String location;
  final String status; // e.g., "occupied" or "available"

  ParkingLot({required this.id, required this.location, required this.status});

  factory ParkingLot.fromJson(Map<String, dynamic> json) {
    return ParkingLot(
      id: json['id'],
      location: json['location'],
      status: json['status'],
    );
  }
}
