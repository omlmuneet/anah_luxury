import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

List<String> bgImageList = [Assets.assetsLoginBg1, Assets.assetsLoginBg2];

class LoginBackgroundDecoration extends StatefulWidget {
  const LoginBackgroundDecoration({super.key});

  @override
  State<LoginBackgroundDecoration> createState() =>
      _LoginBackgroundDecorationState();
}

class _LoginBackgroundDecorationState extends State<LoginBackgroundDecoration>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    animationController.forward();
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    animationController.addListener(() {
      if (animationController.isCompleted) {
        animationController.reverse();
      }
      if (animationController.isDismissed) {
        animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          bgImageList[1],
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Opacity(opacity: animation.value, child: child);
          },
          child: Image.asset(
            bgImageList[0],
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
