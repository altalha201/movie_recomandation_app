import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

import '../../../utils/exports.dart';

class ImagesViewScreen extends StatefulWidget {
  final String title;
  final List<ImageModel> images;
  const ImagesViewScreen({
    super.key,
    required this.title,
    required this.images,
  });

  @override
  State<ImagesViewScreen> createState() => _ImagesViewScreenState();
}

class _ImagesViewScreenState extends State<ImagesViewScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<ImageModel> _loadedImages = [];
  int _startIndex = 0;
  final int _increment = 20;

  @override
  void initState() {
    super.initState();
    _loadNextImages();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadNextImages();
    }
  }

  void _loadNextImages() {
    setState(() {});
    int endIndex = _startIndex + _increment;
    if (endIndex > widget.images.length) {
      endIndex = widget.images.length;
    }
    setState(() {
      _loadedImages.addAll(widget.images.getRange(_startIndex, endIndex));
      _startIndex = endIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MSColors.appbarBackground,
          foregroundColor: Colors.white,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _loadedImages.length,
            itemBuilder: (context, index) {
              var current = _loadedImages[index];
              var filePath = current.filePath;
              var imageUrl = filePath != null
                  ? EndPoints.getImageUrl(filePath)
                  : EndPoints.noPosterUrl;
              if (filePath?.split(".").last case "png" || "jpeg" || "jpg") {
                return _ImageBuilder(imageUrl: imageUrl);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}

class _ImageBuilder extends StatelessWidget {
  const _ImageBuilder({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imageUrl,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const AppProgressIndicator();
          },
        ),
      ),
    );
  }
}
