import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';

class NewBookItemLoading extends StatelessWidget {
  const NewBookItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Row(
        children: [
          ShimmerLoadingBoxBackground(
            height: 100,
            width: 75,
            borderRadius: BorderRadius.circular(10),
          ),
          const AppSpace.semiMedium(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerLoadingBoxBackground.textTitle3(),
                    const AppSpace.semiSmall(),
                    ShimmerLoadingBoxBackground.textParagraph12(),
                  ],
                ),
                const AppSpace.semiMedium(),
                ShimmerLoadingBoxBackground.textParagraph12(),
              ],
            ),
          ),
          const Center(
            child: NewBookNotification(),
          )
        ],
      ),
    );
  }
}
