import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/extensions/size_utils.dart';

class GeneralLoadingWidget extends StatelessWidget {
  const GeneralLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getSize().width,
      height: context.getSize().height,
      color: Colors.black.withAlpha(125),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
