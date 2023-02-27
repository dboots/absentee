import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/services/auction.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Auctions")),
        body: SingleChildScrollView(child: getAuctions(context)));
  }

  Widget getAuctions(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final auctionService =
        AuctionService();
    return StreamBuilder(
        stream: auctionService.read(authProvider.auth.currentUser!.uid),
        builder: (context, snapshot) {
          final auctions = snapshot.data;
          return snapshot.connectionState != ConnectionState.waiting
              ? Row(
                  children:
                      auctions!.map((auction) => Text(auction.description)).toList())
              : Text('${snapshot.connectionState}');
        });
  }
}
