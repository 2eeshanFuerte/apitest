import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/models/reel_model.dart';

class ReelWidget extends StatelessWidget {
  final ReelModel reel;

  const ReelWidget({Key? key, required this.reel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              reel.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),

          // Display Video Thumbnail
          CachedNetworkImage(
            imageUrl: reel.videoUrl,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
