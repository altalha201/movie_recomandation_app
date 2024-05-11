import 'package:flutter/material.dart';

class PercentageWidget extends StatefulWidget {
  final int percentage;
  final Color? backgroundColor;
  const PercentageWidget({
    super.key,
    required this.percentage,
    this.backgroundColor,
  });

  @override
  State<PercentageWidget> createState() => _PercentageWidgetState();
}

class _PercentageWidgetState extends State<PercentageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  late Color finalColor;

  @override
  void initState() {
    super.initState();
    finalColor = getColor(widget.percentage);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = IntTween(
      begin: 0,
      end: widget.percentage,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller
      ..reset()
      ..forward();
    return Container(
      height: 74,
      width: 74,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.backgroundColor ?? Colors.black.withOpacity(0.7),
      ),
      alignment: Alignment.center,
      child: AnimatedBuilder(
          animation: Listenable.merge([
            _controller,
          ]),
          builder: (context, _) {
            return Stack(
              children: [
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: _animation.value.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      children: const [
                        TextSpan(
                          text: "%",
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox.square(
                  dimension: 66,
                  child: TweenAnimationBuilder(
                    tween: ColorTween(
                      begin: Colors.red,
                      end: finalColor,
                    ),
                    duration: const Duration(seconds: 2),
                    builder:
                        (BuildContext context, Color? value, Widget? child) {
                      return CircularProgressIndicator(
                        value: _animation.value / 100.0,
                        strokeWidth: 5,
                        color: value,
                        backgroundColor: Colors.grey,
                        strokeCap: StrokeCap.round,
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }

  Color getColor(int value) {
    if (value >= 0 && value < 40) {
      return Colors.red;
    } else if (value >= 40 && value < 70) {
      return Colors.yellow;
    } else if (value >= 70 && value <= 100) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }
}
