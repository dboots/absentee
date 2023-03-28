import 'package:absentee/models/auction/auction.dart';
import 'package:absentee/screens/auctioneers/create-listing.dart';
import 'package:absentee/screens/listing.dart';
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
    initAuction();
  }

  initAuction() async {
    await auctionService.single(widget.auctionId).then((value) {
      setState(() {
        auction = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Auction")),
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
                              builder: (context) => CreateListingWidget(
                                  auctionId: auction!.documentId)));
                        },
                        child: const Icon(Icons.add),
                      )
                    ]),
                    StreamBuilder(
                        stream: listingService.streamListings(widget.auctionId),
                        builder: (context, snapshot) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: snapshot.data?.map((listing) {
                                    return GestureDetector(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(listing.title),
                                            Text(
                                                'Bid Incremement \$${listing.bidIncrement}'),
                                            Text(
                                                'Starting Price: \$${listing.startPrice}'),
                                            listing.locked != null
                                                ? const Text('locked')
                                                : const Text('')
                                          ]),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ListingWidget(
                                                        listingId:
                                                            listing.uid)));
                                      },
                                    );
                                  }).toList() ??
                                  []);
                        })
                  ]))
            : const CircularProgressIndicator());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getAuctionDetails() {
    return Text('Auction ${auction?.documentId}');
  }
}
