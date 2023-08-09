import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/presentation/screens/home/home_provider.dart';
import 'package:provider/provider.dart';

class UserPostCard extends StatelessWidget {
  const UserPostCard({
    super.key,
    required this.uid,
    required this.postTime,
  });

  final String uid, postTime;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<HomeProvider>(context, listen: false).getUserData(uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.requireData;
          final String? name = user.get('name') as String?;
          final String? image = user.get('image') as String?;
          return Row(
            children: [
              CircleAvatar(
                child: image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(96),
                        child: CachedNetworkImage(imageUrl: image))
                    : (name != null
                        ? Text(name.substring(0, 2).toUpperCase())
                        : null),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user['name'] ?? user['email']),
                  Text(
                    postTime,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
