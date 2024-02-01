import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, idnex) {
          return SizedBox(
              width: Get.width * 0.5,
              height: Get.height * 0.1,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade900.withOpacity(0.5),
                highlightColor: Colors.grey,
                child: ListTile(
                  leading: CircleAvatar(),
                  title: Container(
                    margin: EdgeInsets.only(right: Get.width * 0.4),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                    width: Get.width,
                    height: Get.height * 0.02,
                    // child: Text('       '),
                  ),
                  subtitle: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                    width: Get.width,
                    height: Get.height * 0.02,
                    // child: Text('       '),
                  ),
                ),
              ));
        });
  }
}
