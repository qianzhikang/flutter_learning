import 'package:flutter/material.dart';

import 'count_page.dart';

class InheritedContainer extends InheritedWidget {
  static InheritedContainer of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedContainer>()
          as InheritedContainer;

  final CountPageState model;
  final Function() add;

  const InheritedContainer(this.model, this.add, {required super.child, });

  @override
  bool updateShouldNotify(InheritedContainer oldWidget) {
    return model.count != oldWidget.model.count;
  }
}
