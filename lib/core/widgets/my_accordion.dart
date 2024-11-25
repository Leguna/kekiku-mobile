import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

class MyAccordion extends GFAccordion {
  const MyAccordion({
    super.key,
    super.titleChild = const Text(''),
    super.contentChild,
    super.showAccordion = false,
    super.margin = const EdgeInsets.all(0),
    super.contentPadding = const EdgeInsets.all(0),
    super.contentBackgroundColor = Colors.transparent,
    super.collapsedTitleBackgroundColor = Colors.transparent,
    super.expandedTitleBackgroundColor = Colors.transparent,
  });
}
