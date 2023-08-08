import 'package:flutter/material.dart';
import 'package:get/utils.dart';

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
      builder: (context, snapshot) {
        return Row(
          children: [
            CircleAvatar(
              child: Text(uid.substring(0, 2).capitalize!),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(uid),
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
      },
    );
  }
}
