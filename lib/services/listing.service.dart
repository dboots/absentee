import 'package:absentee/models/listing/listing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:absentee/services/firestore.service.dart';

class ListingService {
  final collection = 'listings';
  final _firestoreService = FirestoreService.instance;
  final db = FirebaseFirestore.instance;

  Future create(Map<String, Object> data, String uid) async {
    final ref = db.collection(collection).doc();
    return db.collection(collection).add({...data, 'userId': uid});
  }

  //Method to retrieve all todos item from the same user based on uid
  Future<ListingModel> read(String id) {
    print('read listing $id');
    final ref = db.collection(collection).doc(id);
    return ref.get().then(
        (value) => ListingModel.fromJson(value.data() as Map<String, dynamic>));
  }

  Stream<List<ListingModel>> streamListings(String auctionId) {
    final auctionRef = db.collection(collection).doc(auctionId);
    return db
        .collection('listings')
        //.where('auction', isEqualTo: auctionRef)
        .snapshots()
        .map((event) => event.docs.map((listing) {
              return ListingModel.fromJson(listing.data());
            }).toList());
  }
}
