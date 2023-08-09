import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/presentation/screens/home/post_item.dart';
import 'package:flutter_sample/presentation/screens/profile/profile_provider.dart';
import 'package:flutter_sample/presentation/widgets/custom_text_field.dart';
import 'package:flutter_sample/utils/extensions/snackbar.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: widget.data['my_profile']
              ? provider.isGeneralLoading
                  ? const CircularProgressIndicator()
                  : FloatingActionButton(
                      onPressed: () {
                        _updateName(provider, _name.text);
                      },
                      child: const Icon(Icons.done),
                    )
              : null,
          appBar: AppBar(
            title: Text('common.profile'.tr()),
          ),
          body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: provider.getAccountData(widget.data['uid']),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final user = snapshot.requireData;
                final String? image = user['image'];
                final String? name = user['name'];
                final String email = user['email'];
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 96,
                        height: 96,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(96),
                          child: image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(96),
                                  child: CachedNetworkImage(
                                    imageUrl: image,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const CircleAvatar(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      widget.data['my_profile']
                          ? CustomTextField(
                              controller: _name..text = name ?? '',
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              label: 'authentication_screen.display_name'.tr(),
                              hint: 'John Doe',
                            )
                          : Text(name ?? 'User'),
                      const SizedBox(height: 16),
                      Text('Email : $email'),
                      const Divider(),
                      Expanded(
                        child: Scrollbar(
                          child: FirestorePagination(
                            query: provider.getRecentlyPosts(
                                uid: widget.data['uid']),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            onEmpty: Center(
                                child: Text(
                              'no_posts'.tr(),
                              style: Theme.of(context).textTheme.headlineMedium,
                            )),
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(8),
                            isLive: true,
                            itemBuilder: (context, documentSnapshot, index) {
                              final data = documentSnapshot.data()
                                  as Map<String, dynamic>;
                              return PostItem(data: data);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      },
    );
  }

  _updateName(ProfileProvider provider, String text) async {
    try {
      provider.isGeneralLoading = true;
      await provider.updateName(text);
    } catch (e) {
      context.showSnackBar(message: e.toString());
    } finally {
      provider.isGeneralLoading = false;
    }
  }
}
