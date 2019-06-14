import 'package:avenger_information/widgets/animation_widgets/slide_animation_state.dart';
import 'package:flutter/material.dart';

class LTRSlideAnimationWidget extends StatefulWidget {
  final Widget child;
  final int index;
  final Duration duration;

  LTRSlideAnimationWidget(this.child, {this.index = 0, this.duration})
      : assert(child != null),
        assert(index >= 0),
        assert(duration != null);

  @override
  _LTRSlideAnimationWidgetState createState() =>
      _LTRSlideAnimationWidgetState();
}

class _LTRSlideAnimationWidgetState
    extends SlideAnimationtState<LTRSlideAnimationWidget> {
  Widget get _child => widget.child;

  int get _index => widget.index;

  Duration get _duration => widget.duration;

  @override
  Widget buildChild(BuildContext context) => _child;

  @override
  Duration getDuration() => _duration;

  @override
  int getIndex() => _index;

  @override
  Offset getEndOffset() => Offset(-1, 0);

  @override
  Offset getBeginOffset() => Offset(0, 0);
}
