import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

/// Represents the footer widget which is rendered on the screen
///
/// Makes use of the [SideNavigationBarFooter] data interface to build the footer
class SideNavigationBarFooterWidget extends StatefulWidget {
  /// Footer data obtained from user
  final SideNavigationBarFooter footerData;

  /// Whether [SideNavigationBar] is expandable at all
  final bool expandable;

  /// The current expanded state of [SideNavigationBar]
  final bool expanded;

  /// [SideNavigationBar.initiallyExpanded] value
  final bool initiallyExpanded;

  const SideNavigationBarFooterWidget({
    Key? key,
    required this.footerData,
    required this.expandable,
    required this.expanded,
    required this.initiallyExpanded,
  }) : super(key: key);

  @override
  _SideNavigationBarFooterWidgetState createState() =>
      _SideNavigationBarFooterWidgetState();
}

class _SideNavigationBarFooterWidgetState
    extends State<SideNavigationBarFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return _determineFooterWidget();
  }

  /// Determines the footer widget based on [expandable] and [expanded]
  Widget _determineFooterWidget() {
    return _FooterWidget(
      footerData: widget.footerData,
      expanded: widget.expandable ? widget.expanded : widget.initiallyExpanded,
    );
  }
}

/// Internal Widget to just handle displaying data
class _FooterWidget extends StatelessWidget {
  final SideNavigationBarFooter footerData;
  final bool expanded;
  const _FooterWidget(
      {Key? key, required this.footerData, this.expanded = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!expanded && footerData.shrinkedLabel == null) return Container();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: expanded
            ? [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: footerData.label,
                ),
              ]
            : [
                footerData.shrinkedLabel!,
              ],
      ),
    );
  }
}
