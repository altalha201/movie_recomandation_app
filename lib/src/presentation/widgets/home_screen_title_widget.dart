import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/date_frame_selactor_controller.dart';

class HomeScreenTitleWidget extends StatelessWidget {
  const HomeScreenTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Trandings 🔥",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.white),
        ),
        const SizedBox(
          width: 8,
        ),
        dateFrameSelecter(),
      ],
    );
  }

  Widget dateFrameSelecter() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(4.0),
      child: Consumer<DateFrameSelectorController>(
          builder: (context, controller, _) {
        return DropdownButton(
          autofocus: true,
          underline: Container(height: 0, color: Colors.transparent),
          dropdownColor: Colors.black.withOpacity(0.6),
          icon: const Icon(
            Icons.arrow_drop_down_sharp,
            color: Colors.amber,
            size: 30,
          ),
          value: controller.value,
          items: const [
            DropdownMenuItem(
              value: 1,
              child: Text(
                "Today",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text(
                "This week",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
          onChanged: (value) => controller.updateValue(context, value),
        );
      }),
    );
  }
}
