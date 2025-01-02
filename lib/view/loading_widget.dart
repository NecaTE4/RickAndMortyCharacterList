import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.isLoading, required this.child});

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.orange),
      );
    } else if (!isLoading && child is! ListView && child is! Column) {
      return const Center(
        child: Text("No Data"),
      );
    } else {
      return child;
    }
  }
}
