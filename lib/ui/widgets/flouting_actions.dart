import 'package:flutter/material.dart';

Widget floutingButtonBiulder({
  required String heroTag,
  required Image image,
  required Color color,
  required VoidCallback onPressed,
}) {
  return FloatingActionButton(
    heroTag: heroTag,
    backgroundColor: color,
    onPressed: onPressed,
    child: image,
  );
}
