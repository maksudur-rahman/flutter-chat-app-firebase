import 'package:chat_application_flutter/utils/page_utils.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading {
  Widget shimmerProduct(context) {
    double _pageHeight = PageUtils.getPageHeight(context: context);
    return SizedBox(
      height: _pageHeight * 1,
      width: double.infinity,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey,
          direction: ShimmerDirection.ltr,
          period: const Duration(seconds: 3),
          child: Column(
            children: [
              container(context),
              const SizedBox(
                height: 10,
              ),
              container(context),
              const SizedBox(
                height: 10,
              ),
              container(context),
              const SizedBox(
                height: 10,
              ),
              container(context),
              const SizedBox(
                height: 10,
              ),
              container(context),
              const SizedBox(
                height: 10,
              ),
              container(context),
            ],
          ),
        ),
      )),
    );
  }

  Widget container(context) {
    double _pageHeight = PageUtils.getPageHeight(context: context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: _pageHeight * 0.15,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
