import 'dart:io';

import 'package:absentee/models/listing/listing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ListingService {
  final String apiKey = dotenv.env['CHATGPT_KEY'] ?? '';
  final collection = 'listings';
  final db = FirebaseFirestore.instance;

  Future<String> create(ListingModel model, String auctionId) async {
    final auctionRef = db.collection('auctions').doc(auctionId);

    // cast model.quantity to int?
    model.quantity = int.tryParse(model.quantity.toString()) ?? 0;
    print(model.toJson());

    return db
        .collection(collection)
        .add({...model.toJson(), 'uid': '', 'auctionRef': auctionRef}).then(
            (ref) => ref.id);
  }

  Future<ListingModel> read(String id) {
    final ref = db.collection(collection).doc(id);
    return ref.get().then(
        (value) => ListingModel.fromJson(value.data() as Map<String, dynamic>));
  }

  Future<void> update(ListingModel data, String id) async {
    final ref = db.collection(collection).doc(id);
    return ref.update(data.toJson());
  }

  Future<ListingModel> single(String id) {
    return db.collection(collection).doc(id).get().then((record) {
      return ListingModel.fromJson(
          {...record.data() as Map<String, dynamic>, 'uid': record.id});
    });
  }

  Stream<List<ListingModel>> streamListings(String auctionId) {
    final auctionRef = db.collection('auctions').doc(auctionId);
    print('auctionRef $auctionId');
    return db
        .collection('listings')
        .where('auctionRef', isEqualTo: auctionRef)
        .snapshots()
        .map((event) => event.docs.map((listing) {
              return ListingModel.fromJson(
                  {...listing.data(), 'uid': listing.id});
            }).toList());
  }

  void queueListingUpload(File data, String userId, String listingId) {
    print('queueing upload');
    db.collection('upload_queue').add({
      'file': data.path,
      'userId': userId,
      'listingId': listingId,
      'timestamp': DateTime.now()
    });
  }

  // Future<void> processUploadQueue() async {
  //   final queue = await db.collection('upload_queue').get();
  //   for (final item in queue.docs) {
  //     // upload image using cloudinary
  //     final bytes = await File(image.path).readAsBytes();
  //     final response = await cloudinary.upload(image, bytes, (count, total) {});

  //     final data = item.data();
  //     final file = File(data['file'] as String);
  //     final userId = data['userId'] as String;
  //     final listingId = data['listingId'] as String;
  //     final listingRef = db.collection('listings').doc(listingId);
  //     final auctionRef = db.collection('auctions').doc(listingId);
  //     final listing = ListingModel.fromJson({
  //       'name': file.path.split('/').last,
  //       'quantity': 1,
  //       'price': 0,
  //       'description': '',
  //       'image': '',
  //       'auctionRef': auctionRef
  //     });
  //     final ref = await db.collection('listings').add(listing.toJson());
  //     await listingRef.update({'uid': ref.id});
  //     await item.reference.delete();
  //   }
  // }
}
