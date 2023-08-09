import 'package:flutter/material.dart';
import 'package:flutter_sample/presentation/screens/home/post_item.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PostItem(
        data: data,
        showAllDetails: true,
      ),
    );
  }
}
