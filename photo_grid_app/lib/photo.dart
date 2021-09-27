import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class Photos extends StatelessWidget {
  final List<dynamic>? photos;

  Photos({
    required this.photos,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(photos![index]["path"]),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes:
                  PhotoViewHeroAttributes(tag: photos![index]["title"]),
            );
          },
          itemCount: photos!.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                  value: event == null ? 0 : event.cumulativeBytesLoaded / 4
                  // event.expectedTotalBytes,
                  ),
            ),
          ),
          // backgroundDecoration:
          // pageController: pageController,
          // onPageChanged: onPageChanged,
        ));
  }
}
