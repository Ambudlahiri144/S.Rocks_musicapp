import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/service_model.dart';

class ServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ServiceModel>> getServices() async {
    try {
      final snapshot = await _firestore.collection('services').get();
      return snapshot.docs.map((doc) => ServiceModel.fromFirestore(doc.data())).toList();
    } catch (e) {
      // Handle errors appropriately in a real app
      print(e);
      return [];
    }
  }
}