import 'package:absentee/models/listing/listing.dart';
import 'package:absentee/services/listing.service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListingWidget extends StatefulWidget {
  const ListingWidget({super.key, required this.listingId});
  final String listingId;

  @override
  State<ListingWidget> createState() => _ListingWidgetState();
}

class _ListingWidgetState extends State<ListingWidget> {
  late final ListingModel listing;
  final ListingService listingService = ListingService();

  Future<ListingModel> _init() async {
    return listingService.single(widget.listingId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _init(),
        builder: (context, snapshot) {
          final listing = snapshot.data;
          return snapshot.hasData
              ? Scaffold(
                  appBar: AppBar(title: Text("Listing ${listing!.uid}")),
                  body: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        _getImageCarousel(listing.images),
                        Text(
                          listing.title,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ])),
                )
              : const CircularProgressIndicator();
        });
  }

  String _getCurrency(double amount) {
    final NumberFormat format = NumberFormat.simpleCurrency();
    return format.format(amount);
  }

  Widget _getImageCarousel(List<String>? images) {
    return CarouselSlider(
        options: CarouselOptions(height: 300.0),
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
}
