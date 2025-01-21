import 'dart:io';

import 'package:absentee/models/listing/listing.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ListingService {
  final String apiKey = dotenv.env['CHATGPT_KEY'] ?? '';
  final collection = 'listings';
  final db = FirebaseFirestore.instance;

  Future<String> create(ListingModel model, String auctionId) async {
    print(apiKey);
    final openAI = OpenAI.instance.build(
        token: apiKey,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
        enableLog: true);
    final auctionRef = db.collection('auctions').doc(auctionId);
    final request = CompleteText(
        prompt: 'Can you create a paragraph about ${model.description}',
        model: Gpt3TurboInstruct(),
        maxTokens: 200);
    if (false) {
      final response = await openAI.onCompletion(request: request);
      print(response!.choices.last.text);
      model.description = response.choices.last.text;
    }

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

  Future<void> queueListingUpload(File data, String userId, String listingId) {
    return db.collection('upload_queue').add({
      'file': data.path,
      'userId': userId,
      'listingId': listingId,
      'timestamp': DateTime.now()
    });
  }
}
