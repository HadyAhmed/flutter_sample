import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/config/router/destinations.dart';
import 'package:flutter_sample/presentation/screens/auth/authentication_provider.dart';
import 'package:flutter_sample/presentation/screens/home/home_provider.dart';
import 'package:flutter_sample/presentation/screens/home/post_item.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr()),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(RouterDestination.profileScreen);
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
          IconButton(
            onPressed: () {
              _logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RouterDestination.addPostScreen);
        },
        tooltip: 'common.add_post'.tr(),
        child: const Icon(Icons.post_add),
      ),
      body: Scrollbar(
        child: FirestorePagination(
          query: Provider.of<HomeProvider>(context, listen: false)
              .getRecentlyPosts(),
          separatorBuilder: (context, index) => const Divider(),
          onEmpty: Center(
              child: Text(
            'no_posts'.tr(),
            style: Theme.of(context).textTheme.headlineMedium,
          )),
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          isLive: true,
          itemBuilder: (context, documentSnapshot, index) {
            final data = documentSnapshot.data() as Map<String, dynamic>;
            return PostItem(data: data);
          },
        ),
      ),
    );
  }

  void _logout() {
    final provider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    provider.logout().then(
        (value) => context.goNamed(RouterDestination.authenticationScreen));
  }
}
