import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/presentation/screens/home/post_user_card.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.data,
    this.onClick,
    this.showAllDetails = false,
  });

  final Map<String, dynamic> data;
  final void Function(Map<String, dynamic>)? onClick;
  final bool showAllDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          onClick?.call(data);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserPostCard(
                uid: data['createdBy'],
                postTime: DateFormat('dd/MM/yyyy HH:mm')
                    .format((data['createdAt'] as Timestamp).toDate()),
              ),
              const SizedBox(height: 16),
              Text(
                data['text'],
                overflow: showAllDetails ? null : TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
              if (data['imagePath'] != null) const SizedBox(height: 8),
              if (data['imagePath'] != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(imageUrl: data['imagePath']),
                ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
