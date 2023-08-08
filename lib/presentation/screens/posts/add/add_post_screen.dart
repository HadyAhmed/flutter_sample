import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/post.dart';
import 'package:flutter_sample/presentation/screens/posts/add/add_post_provider.dart';
import 'package:flutter_sample/utils/extensions/size_utils.dart';
import 'package:flutter_sample/utils/extensions/snackbar.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _text = TextEditingController();
  bool _enablePost = false;
  String? _imagePath;

  set imagePath(String? value) {
    setState(() {
      _imagePath = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _text.addListener(() {
      setState(() {
        _enablePost = _text.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPostProvider>(
      builder: (conContext, provider, consChild) {
        return Scaffold(
          appBar: AppBar(
            title: Text('home.add_post'.tr()),
            actions: [
              TextButton(
                onPressed: _enablePost
                    ? () {
                        _addPost(provider);
                      }
                    : null,
                child: Text('home.post'.tr()),
              ),
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: Column(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: _text,
                                  textInputAction: TextInputAction.newline,
                                  maxLines: 40,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'home.whats_on_your_mind'.tr(),
                                  ),
                                ),
                              ),
                              if (_imagePath != null)
                                Flexible(child: Image.file(File(_imagePath!))),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: context.getWidthPercentage(80),
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add_a_photo),
                        onPressed: () async {
                          await _showPickerDialog();
                        },
                        label: Text('home.add_picture'.tr()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _addPost(AddPostProvider provider) async {
    try {
      provider.isGeneralLoading = true;
      await provider
          .addPost(PostDomain(_text.text, _imagePath, Timestamp.now()));
    } catch (e) {
      context.showSnackBar(message: e.toString());
    } finally {
      provider.isGeneralLoading = false;
    }
  }

  Future<void> _showPickerDialog() async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose photo'),
          content: Text('Choose your way to pick up a picture'),
          actions: [
            TextButton.icon(
              label: Text('Gallery'),
              icon: const Icon(Icons.browse_gallery),
              onPressed: () {
                context.pop();
                _pickPicture(ImageSource.gallery);
              },
            ),
            TextButton.icon(
              label: Text('Camera'),
              icon: const Icon(Icons.camera),
              onPressed: () {
                context.pop();
                _pickPicture(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }

  _pickPicture(ImageSource src) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: src);
    imagePath = image?.path;
  }
}
