import 'package:absentee/main.dart';
import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/screens/auction.dart';
import 'package:absentee/screens/auctioneers/create-auction.dart';
import 'package:absentee/services/auction.service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AuctioneerDashboardWidget extends StatefulWidget {
  const AuctioneerDashboardWidget({super.key});

  @override
  State<AuctioneerDashboardWidget> createState() =>
      _AuctioneerDashboardWidgetState();
}

class _AuctioneerDashboardWidgetState extends State<AuctioneerDashboardWidget> {
  final AuthProvider _authProvider = AuthProvider();
  final AuctionService _auctionService = AuctionService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: SingleChildScrollView(
          child: Column(children: [
        TextButton(
            onPressed: () {
              _authProvider.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MainPage(title: 'logout')));
            },
            child: const Text('Logout')),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: getAuctions(context))
      ])),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CreateAuctionWidget()));
          },
          child: const Icon(Icons.add)),
    );
  }

  Widget getAuctions(BuildContext context) {
    return StreamBuilder(
        stream: _auctionService.read(_authProvider.auth.currentUser!.uid),
        builder: (context, snapshot) {
          final auctions = snapshot.data;
          return auctions != null && snapshot.hasData
              ? Column(children: [
                  ...auctions
                      .map((auction) => auction != null
                          ? GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AuctionWidget(
                                        auctionId: auction.documentId)));
                              },
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Card(
                                      child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 5.0,
                                                                    bottom:
                                                                        5.0),
                                                            child: Text(
                                                                auction != null
                                                                    ? auction
                                                                        .title
                                                                    : '',
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20.0))),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(children: [
                                                                const Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right:
                                                                            5.0),
                                                                    child: Icon(
                                                                        Icons
                                                                            .pin_drop_outlined,
                                                                        color: Colors
                                                                            .black45)),
                                                                Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          auction
                                                                              .address,
                                                                          style: const TextStyle(
                                                                              fontSize: 14.0,
                                                                              color: Colors.black54)),
                                                                      Text(
                                                                          '${auction.city}, ${auction.state}',
                                                                          style: const TextStyle(
                                                                              fontSize: 14.0,
                                                                              color: Colors.black54))
                                                                    ])
                                                              ]),
                                                              Row(children: [
                                                                const Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right:
                                                                            5.0),
                                                                    child: Icon(
                                                                        Icons
                                                                            .calendar_month_outlined,
                                                                        color: Colors
                                                                            .black45)),
                                                                Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    // Format auction.startDate date to MM dd, yyyy format

                                                                    children: [
                                                                      Text(
                                                                          DateFormat.yMMMd().format(auction
                                                                              .startDate!),
                                                                          style: const TextStyle(
                                                                              fontSize: 14.0,
                                                                              color: Colors.black54)),
                                                                      Text(
                                                                          DateFormat.jm().format(auction
                                                                              .startDate!),
                                                                          style: const TextStyle(
                                                                              fontSize: 14.0,
                                                                              color: Colors.black54))
                                                                    ]),
                                                              ]),
                                                              Row(children: [
                                                                const Icon(
                                                                    Icons
                                                                        .shopping_bag_outlined,
                                                                    color: Colors
                                                                        .black54),
                                                                Text(
                                                                    auction.listings !=
                                                                            null
                                                                        ? auction
                                                                            .listings!
                                                                            .length
                                                                            .toString()
                                                                        : '0',
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black54))
                                                              ])
                                                            ]),
                                                      ],
                                                    ),
                                                  )
                                                ])
                                              ])))))
                          : const Text('Loading'))
                      .toList(),
                  const SizedBox(height: 90.0)
                ])
              : Text(
                  'No auctions found for ${_authProvider.auth.currentUser!.uid} ${snapshot.connectionState} ${snapshot.data}');
        });
  }
}
