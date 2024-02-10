// import 'dart:math';

import 'dart:math';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahScreenState extends State<QiblahScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FlutterQiblah.qiblahStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ));
          }
    
          final qiblahDirection = snapshot.data;
          animation = Tween(
                  begin: begin,
                  end: (qiblahDirection!.qiblah * (pi / 180) * 1))
              .animate(_animationController!);
          begin = (qiblahDirection.qiblah * (pi / 180) * 1);
          _animationController!.forward(from: 0);
    
          return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${qiblahDirection.direction.toInt()}°",
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: Get.height * 0.4,
                      child: AnimatedBuilder(
                        animation: animation!,
                        builder: (context, child) => Transform.rotate(
                            angle: animation!.value,
                            child: Image.asset(
                              'assets/images/qibla.png',
                              // color: Colors.grey.shade900,
                            )),
                      ))
                ]),
          );
        },
      ),
    );
  }
}
