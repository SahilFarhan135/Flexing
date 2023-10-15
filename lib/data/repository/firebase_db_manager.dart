import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDBManager {
  late DatabaseReference _database;

  FirebaseDBManager() {
    // Initialize Firebase
    Firebase.initializeApp();
    // Get a reference to the database
    _database = FirebaseDatabase.instance.reference();
  }

  // Get all data from a specific node
  Future<Map<String, dynamic>> getAllData(String node) async {
    DatabaseEvent event = await _database.child(node).once();
    Map<String, dynamic> values = {};

    if (event.snapshot.value != null) {
      if (event.snapshot.value is List) {
        var currentValue = event.snapshot.value as List<dynamic>;
        currentValue.forEach((value) {
          if (value == null) return;
          values[value] = value;
        });
      } else if (event.snapshot.value is Map) {
        var currentValue = event.snapshot.value as Map<dynamic, dynamic>;
        currentValue.forEach((key, value) {
          values[key] = value;
        });
      }
    }
    return values;
  }

  Future<dynamic> getSingleData(String node) async {
    DatabaseEvent event = await _database.child(node).once();
    return event.snapshot.value;
  }

  // Add data to a specific node
  Future<void> addData(String node, dynamic data) async {
    await _database.child(node).push().set(data);
  }

  // Update data at a specific node
  Future<void> updateData(String node, String key, dynamic newData) async {
    await _database.child(node).child(key).set(newData);
  }

  // Delete data at a specific node
  Future<void> deleteData(String node, String key) async {
    await _database.child(node).child(key).remove();
  }
}
