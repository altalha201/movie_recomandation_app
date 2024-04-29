import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              colorFilter: ColorFilter.mode(
                Colors.grey,
                BlendMode.darken,
              ),
              fit: BoxFit.cover
            ),
          ),
        ),
        GlassmorphicContainer(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          borderRadius: 0,
          blur: 38,
          border: 0,
          alignment: Alignment.bottomCenter,
          linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF000000).withOpacity(0.8),
              const Color(0xFF000003).withOpacity(0.6),
            ],
            stops: const [
              0.1,
              1,
            ],
          ),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.5),
              const Color((0xFFFFFFFF)).withOpacity(0.5),
            ],
          ),
        ),
        child
      ],
    );
  }
}
