import 'package:absentee/models/auction/auction.dart';
import 'package:absentee/screens/auctioneers/create-listing.dart';
import 'package:absentee/services/auction.service.dart';
import 'package:absentee/services/listing.service.dart';
import 'package:flutter/material.dart';

class ListingWidget extends StatefulWidget {
  const ListingWidget({super.key, required this.listingId});
  final String listingId;

  @override
  State<ListingWidget> createState() => _ListingWidgetState();
}

class _ListingWidgetState extends State<ListingWidget> {
  final listingService = ListingService();
  final auctionService = AuctionService();
  AuctionModel? auction;

  @override
  void initState() {
    super.initState();
    print('initState');

    initAuction();
    print('done initState');
  }

  initAuction() async {
    print('initAuction');
    await auctionService.single(widget.listingId).then((value) {
      setState(() {
        auction = value;
      });
      print('listings ${auction?.listings}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Dashboard")),
        body: auction != null
            ? SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    getAuctionDetails(),
                    Row(children: [
                      const Text('Listings'),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CreateListingWidget()));
                        },
                        child: const Icon(Icons.add),
                      )
                    ]),
                    StreamBuilder(
                        stream: listingService.streamListings(widget.listingId),
                        builder: (context, snapshot) {
                          print('stream finished ${snapshot.data}');
                          return Column(
                              children: snapshot.data?.map((e) {
                                    return Column(children: [
                                      Text(e.title),
                                      e.locked != null
                                          ? const Text('locked')
                                          : const Text('')
                                    ]);
                                  }).toList() ??
                                  []);
                        })
                  ]))
            : const CircularProgressIndicator());
  }

  @override
  void dispose() {
    super.dispose();
    print('deactivate');
  }

  Widget getAuctionDetails() {
    listingService
        .streamListings(auction!.documentId)
        .map((event) => print(event.length));
    return Text('Auction ${auction?.documentId}');
  }

  Stream streamListings() {
    print('streaming');
    return listingService
        .streamListings(auction!.documentId)
        .map((event) => event.map((doc) => Text(doc.title)));
  }

  List<Text>? getListing() {
    return auction?.listings!.map((listing) => Text(listing.title)).toList();
  }
}
