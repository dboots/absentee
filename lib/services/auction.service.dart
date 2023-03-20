import 'package:absentee/models/listing/listing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:absentee/models/auction/auction.dart';
import 'package:absentee/services/firestore.service.dart';

class AuctionService {
  final String collection = 'auctions';
  final _firestoreService = FirestoreService.instance;
  final db = FirebaseFirestore.instance;

  Future create(auction, uid) async {
    final ref = db.collection(collection).doc();
    return db.collection(collection).add({...auction, 'userId': uid});
  }

  Stream<List<AuctionModel>> read(user) {
    return db
        .collection(collection)
        .where('userId', isEqualTo: user)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return AuctionModel.fromJson({...doc.data(), 'documentId': doc.id});
      }).toList();
    });
  }

  //Method to retrieve all todos item from the same user based on uid
  Future<AuctionModel> single(String id) {
    final ref = db.collection(collection).doc(id);
    return ref.get().then((auction) {
      return db
          .collection('listings')
          .where('auctionId', isEqualTo: ref)
          .get()
          .then((listings) {
        return AuctionModel.fromJson({
          ...auction.data() as Map<String, dynamic>,
          'documentId': auction.id,
          'listings': listings.docs.map((l) => ListingModel.fromJson(l.data())).toList()
        });
      });
    });
  }
}
