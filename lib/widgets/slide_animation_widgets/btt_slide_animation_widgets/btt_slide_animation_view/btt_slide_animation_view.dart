import 'package:flutter/material.dart';

import '../../slide_animation_view_base_state.dart';
import '../btt_slide_animation_widget.dart';

class BTTSlideAnimationView extends StatefulWidget {
  final Widget child;

  BTTSlideAnimationView(this.child) : assert(child != null);

  @override
  _BTTSlideAnimationViewState createState() => _BTTSlideAnimationViewState();
}

class _BTTSlideAnimationViewState
    extends SlideAnimationViewBaseState<BTTSlideAnimationView> {
  Widget get _child => widget.child;

  @override
  Widget buildChild(BuildContext context) {
    return getSlideAnimationWidget(
      _child,
      index: 0,
      duration: getDuration(),
    );
  }

  @override
  Duration getDuration() => Duration(milliseconds: 700);

  @override
  Widget getSlideAnimationWidget(Widget child, {int index, Duration duration}) {
    return BTTSlideAnimationWidget(
      child,
      index: index,
      duration: duration,
    );
  }
}
