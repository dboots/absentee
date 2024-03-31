import 'package:absentee/models/auction/auction.dart';
import 'package:absentee/screens/auctioneers/create-listing.dart';
import 'package:absentee/services/auction.service.dart';
import 'package:absentee/services/listing.service.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
        appBar:
            AppBar(title: Text(auction == null ? 'Loading' : auction!.title)),
        body: auction != null
            ? SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          getAuctionDetails(),
                          Column(children: [
                            const Text('Catalog',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CreateListingWidget(
                                        auctionId: widget.auctionId,
                                        listingId: null)));
                              },
                              child: const Text('Add Lot'),
                            )
                          ]),
                          StreamBuilder(
                              stream: listingService
                                  .streamListings(widget.auctionId),
                              builder: (context, snapshot) {
                                return Wrap(
                                    children: snapshot.data?.map((listing) {
                                          return GestureDetector(
                                            child: Card(
                                                child: Column(children: [
                                              listing.images != null
                                                  ? FractionallySizedBox(
                                                      widthFactor: 0.48,
                                                      child: _getImageCarousel(
                                                          listing.images))
                                                  : const Text(''),
                                              Text(
                                                  '${listing.title} (Lot #${listing.lotNumber})'),
                                              listing.locked != null
                                                  ? const Text('locked')
                                                  : const Text('')
                                            ])),
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CreateListingWidget(
                                                              auctionId: auction!
                                                                  .documentId,
                                                              listingId: listing
                                                                  .uid)));
                                            },
                                          );
                                        }).toList() ??
                                        []);
                              })
                        ])))
            : const CircularProgressIndicator());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _getImageCarousel(List<String>? images) {
    return CarouselSlider(
        options: CarouselOptions(height: 150.0),
        items: images!.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(color: Colors.black12),
                  child: Image.network(i));
            },
          );
        }).toList());
  }

  Widget getAuctionDetails() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(auction!.address, style: const TextStyle(fontSize: 16.0)),
          Text('${auction!.city!}, ${auction!.state!}',
              style: const TextStyle(fontSize: 16.0))
        ]));
  }
}
