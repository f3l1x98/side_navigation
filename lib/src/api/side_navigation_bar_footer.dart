import 'package:flutter/material.dart';

/// Interface to provide information about the footer widget of a [SideNavigationBar]
class SideNavigationBarFooter {
  /// A [Widget] to display above the [expandIcon] and [shrinkIcon]
  final Widget label;

  /// A [Widget] to display above the [expandIcon] and [shrinkIcon] if the bar is shrinked
  final Widget? shrinkedLabel;

  /// Footer data
  const SideNavigationBarFooter({required this.label, this.shrinkedLabel});
}
