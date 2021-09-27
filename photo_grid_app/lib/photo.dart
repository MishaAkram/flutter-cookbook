import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class Photos extends StatelessWidget {
  final List<dynamic>? photos;
  final int? indexP;
  Photos({required this.photos, this.indexP});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          enableRotation: true,
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(photos![indexP! + index]),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,

              // heroAttributes:
              //     PhotoViewHeroAttributes(tag: "photos"),
            );
          },
          itemCount: photos!.length-indexP!,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
              ),
            ),
          ),
          // backgroundDecoration: BoxDecoration(
          // color: Theme.of(context).canvasColor,
          // )
          // pageController: pageController,
          // onPageChanged: onPageChanged,
        ));
  }
}
