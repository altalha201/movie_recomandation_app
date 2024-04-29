import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          CarouselSlider(
            items: [
              ...[1, 2, 3, 4, 5, 6, 7, 8, 9].map(
                (e) => Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      margin: const EdgeInsets.all(16),
                      child: Text(e.toString()),
                    ),
                    const Positioned(
                      bottom: 30,
                      right: 30,
                      child: Center(
                        child: SizedBox.square(
                          dimension: 50,
                          child: CircularProgressIndicator(
                            value: 0.6,
                            strokeWidth: 8,
                            semanticsLabel: "70",
                            color: Colors.green,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
            options: CarouselOptions(
              viewportFraction: 0.6,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              height: MediaQuery.of(context).size.height * 0.5,
              enlargeCenterPage: true,
            ),
          )
        ],
      ),
    );
  }
}
