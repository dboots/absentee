import 'dart:io';

import 'package:absentee/utils/IconCircle.dart';
import 'package:flutter/material.dart';

class ListingImage extends StatefulWidget {
  const ListingImage(
      {super.key,
      required this.imageUrl,
      required this.index,
      required this.onRemove});
  final String imageUrl;
  final int index;
  final Function(int index) onRemove;

  @override
  State<ListingImage> createState() => _ListingImageState();
}

class _ListingImageState extends State<ListingImage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150,
        child: Stack(children: [
          widget.imageUrl.contains('http')
              ? getImage(Image.network(widget.imageUrl))
              : getImage(Image.file(File(widget.imageUrl))),
          Positioned(
              top: 8.0,
              right: 8.0,
              child: IconCircle(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    widget.onRemove(widget.index);
                  }))
        ]));
  }

  Widget getImage(Image img) {
    return Padding(padding: const EdgeInsets.all(5.0), child: img);
  }
}
