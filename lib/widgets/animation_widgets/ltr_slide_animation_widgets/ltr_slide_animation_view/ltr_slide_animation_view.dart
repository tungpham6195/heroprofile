import 'package:avenger_information/widgets/animation_widgets/ltr_slide_animation_widgets/ltr_slide_animation_widget.dart';
import 'package:avenger_information/widgets/animation_widgets/slide_animation_view_base_state.dart';
import 'package:flutter/material.dart';

class LTRSlideAnimationView extends StatefulWidget {
  final Widget child;

  LTRSlideAnimationView(this.child) : assert(child != null);

  @override
  _LTRSlideAnimationViewState createState() => _LTRSlideAnimationViewState();
}

class _LTRSlideAnimationViewState
    extends SlideAnimationViewBaseState<LTRSlideAnimationView> {
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
  Duration getDuration() => Duration(milliseconds: 350);

  @override
  Widget getSlideAnimationWidget(Widget child, {int index, Duration duration}) {
    // TODO: implement getSlideAnimationWidget
    return LTRSlideAnimationWidget(
      child,
      index: index,
      duration: duration,
    );
  }
}
