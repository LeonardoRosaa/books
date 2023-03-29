import 'package:books/presentation/presentation.dart';
import 'package:books/presentation/widgets/play_book.dart';
import 'package:flutter/material.dart';

class ContinueBookItemLoading extends StatelessWidget {
  const ContinueBookItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ShimmerLoadingBoxBackground(
                height: 100,
                width: 100,
                borderRadius: BorderRadius.circular(200),
              ),
              const Positioned(
                bottom: 0,
                right: -5,
                child: ShimmerLoading(
                  child: PlayBook(),
                ),
              ),
            ],
          ),
          const AppSpace(10),
          ShimmerLoadingBoxBackground.textTitle3(),
          const AppSpace(2),
          ShimmerLoadingBoxBackground.textParagraph12(),
        ],
      ),
    );
  }
}
