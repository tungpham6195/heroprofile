import 'package:avenger_information/widgets/animation_widgets/ltr_slide_animation_widgets/ltr_slide_animation_widget.dart';
import 'package:avenger_information/widgets/animation_widgets/slide_animation_view_base_state.dart';
import 'package:flutter/material.dart';

class LTRSlideAnimationList extends StatefulWidget {
  final List<Widget> items;

  LTRSlideAnimationList(this.items) : assert(items != null);

  @override
  _LTRSlideAnimationListState createState() => _LTRSlideAnimationListState();
}

class _LTRSlideAnimationListState
    extends SlideAnimationViewBaseState<LTRSlideAnimationList> {
  List<Widget> get _list => widget.items;

  @override
  Widget buildChild(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return getSlideAnimationWidget(
          _list[index],
          index: index,
          duration: getDuration(),
        );
      },
      childCount: getLength(),
    ));
  }

  @override
  int getLength() => _list.length;

  @override
  Duration getDuration() => Duration(milliseconds: 250);

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
