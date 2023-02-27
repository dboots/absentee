import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/screens/auction.dart';
import 'package:absentee/screens/auctioneers/create-auction.dart';
import 'package:absentee/screens/listing.dart';
import 'package:absentee/services/auction.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuctioneerDashboardWidget extends StatelessWidget {
  AuctioneerDashboardWidget({super.key});

  late final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: SingleChildScrollView(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: getAuctions(context))),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => CreateAuctionWidget()));
          },
          child: const Icon(Icons.add)),
    );
  }

  Widget getAuctions(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final auctionService = AuctionService();
    uid = authProvider.auth.currentUser!.uid;
    return StreamBuilder(
        stream: auctionService.read(authProvider.auth.currentUser!.uid),
        builder: (context, snapshot) {
          final auctions = snapshot.data;
          return snapshot.hasData
              ? Column(
                  children: auctions!
                      .map((auction) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AuctionWidget(auctionId: auction.documentId)));
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              child: Card(
                                  child: Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //AIzaSyCGqQ0w0CUG5ah7kNyIU_uwv2RB-IQvTwI
                                            Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black)),
                                                child: Image.network(
                                                    'https://maps.googleapis.com/maps/api/staticmap?center=Berkeley,CA&zoom=14&size=500x200&key=AIzaSyCGqQ0w0CUG5ah7kNyIU_uwv2RB-IQvTwI')),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(auction
                                                            .description),
                                                        Row(children: [
                                                          const Icon(
                                                              Icons.pin_drop),
                                                          Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(auction
                                                                    .address),
                                                                Text(
                                                                    '${auction.city}, ${auction.state}')
                                                              ]),
                                                        ]),
                                                      ]),
                                                  Row(children: const [
                                                    Icon(Icons.shopping_bag),
                                                    Text('23')
                                                  ]),
                                                ]),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(children: const [
                                                    Icon(Icons.calendar_month),
                                                    Text('10/23')
                                                  ]),
                                                  Row(children: const [
                                                    Icon(Icons.timer),
                                                    Text('10/23')
                                                  ]),
                                                ]),
                                          ]))))))
                      .toList())
              : Text(
                  'No auctions found for $uid ${snapshot.connectionState} ${snapshot.data}');
        });
  }
}
