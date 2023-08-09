import 'package:cloud_firestore/cloud_firestore.dart';

class PostDomain {
  final String text;
  final String? imagePath;
  final Timestamp createdAt;

  PostDomain(this.text, this.imagePath, this.createdAt);
}
