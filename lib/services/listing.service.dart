import 'package:absentee/models/listing/listing.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListingService {
  final collection = 'listings';
  final db = FirebaseFirestore.instance;

  Future<String> create(ListingModel model, String auctionId) async {
    final auctionRef = db.collection('auctions').doc(auctionId);
    return db.collection(collection).add(
        {...model.toJson(), 'auctionRef': auctionRef}).then((ref) => ref.id);
  }

  Future<ListingModel> read(String id) {
    final ref = db.collection(collection).doc(id);
    return ref.get().then(
        (value) => ListingModel.fromJson(value.data() as Map<String, dynamic>));
  }

  Stream<List<ListingModel>> streamListings(String auctionId) {
    final auctionRef = db.collection('auctions').doc(auctionId);
    return db
        .collection('listings')
        .where('auctionRef', isEqualTo: auctionRef)
        .snapshots()
        .map((event) => event.docs.map((listing) {
              return ListingModel.fromJson(listing.data());
            }).toList());
  }

  Future<void> queueListingUpload(XFile data, String userId, String listingId) {
    return db.collection('upload_queue').add({
      'file': data.path,
      'userId': userId,
      'listingId': listingId,
      'timestamp': DateTime.now()
    });
  }
}
