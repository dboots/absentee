import 'package:absentee/models/auction/auction.dart';
import 'package:absentee/screens/auctioneers/create-listing.dart';
import 'package:absentee/services/auction.service.dart';
import 'package:absentee/services/listing.service.dart';
import 'package:flutter/material.dart';

class AuctionWidget extends StatefulWidget {
  const AuctionWidget({super.key, required this.auctionId});
  final String auctionId;

  @override
  State<AuctionWidget> createState() => _AuctionWidgetState();
}

class _AuctionWidgetState extends State<AuctionWidget> {
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
    await auctionService.single(widget.auctionId).then((value) {
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
                        stream: listingService.streamListings(widget.auctionId),
                        builder: (context, snapshot) {
                          print('stream finished ${snapshot.data}');
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: snapshot.data?.map((e) {
                                    return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(e.title),
                                          Text('Bid Incremement \$${e.bidIncrement}'),
                                          Text('Starting Price: \$${e.startPrice}'),
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
