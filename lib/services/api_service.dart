import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/parking_lot.dart';

class ApiService {
  final String baseUrl = 'http://your-server-url'; // Update with your server URL

  Future<List<ParkingLot>> fetchParkingLots() async {
    final response = await http.get(Uri.parse('$baseUrl/parking-lots'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((lot) => ParkingLot.fromJson(lot)).toList();
    } else {
      throw Exception('Failed to load parking lots');
    }
  }
}
