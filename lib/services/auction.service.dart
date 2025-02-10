import 'package:absentee/models/listing/listing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:absentee/models/auction/auction.dart';

class AuctionService {
  final String collection = 'auctions';
  final db = FirebaseFirestore.instance;

  Future create(auction, uid) async {
    final ref = db.collection(collection).doc();
    return db.collection(collection).add({...auction, 'userId': uid});
  }

  Stream<List<AuctionModel?>> read(user) {
    print('user $user');
    return db
        .collection(collection)
        .where('userId', isEqualTo: user)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        try {
          final startDate =
              (doc.get('startDate') as Timestamp).toDate().toString();
          final endDate = (doc.get('endDate') as Timestamp).toDate().toString();
          final data = {
            ...doc.data(),
            'startDate': startDate,
            'endDate': endDate,
            'documentId': doc.id,
            'listings': [],
          };
          return AuctionModel.fromJson(data);
        } catch (e) {
          print(e);
        }
      }).toList();
    });
  }

  Future<AuctionModel> single(String id) {
    final ref = db.collection(collection).doc(id);
    return ref.get().then((auction) {
      return db
          .collection('listings')
          .where('auctionId', isEqualTo: ref)
          .get()
          .then((listings) {
        final startDate =
            (auction.get('startDate') as Timestamp).toDate().toString();
        final endDate =
            (auction.get('endDate') as Timestamp).toDate().toString();

        return AuctionModel.fromJson({
          ...auction.data() as Map<String, dynamic>,
          'startDate': startDate,
          'endDate': endDate,
          'documentId': auction.id,
          'listings':
              listings.docs.map((l) => ListingModel.fromJson(l.data())).toList()
        });
      });
    });
  }

  Future<AuctionModel> update(
      Map<String, dynamic> auctionData, String id) async {
    final docRef = db.collection(collection).doc(id);
    print(auctionData['startDate']);

    // Convert dates to Timestamps for Firestore
    // final startDate = DateTime.parse(auctionData['startDate']);
    // final endDate = DateTime.parse(auctionData['endDate']);
    final premium = double.parse(auctionData['premium']);

    final updateData = {
      ...auctionData,
      'premium': premium,
      'updatedAt': FieldValue.serverTimestamp(),
    };

    // Remove any fields that shouldn't be in the Firestore document
    updateData.remove('documentId');
    updateData.remove('listings');

    // Update the document
    await docRef.update(updateData);

    // Fetch and return the updated auction
    return single(id);
  }
}
