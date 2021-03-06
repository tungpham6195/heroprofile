import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_profile/blocs/base/base_event.dart';
import 'package:hero_profile/blocs/base/base_state.dart';
import 'package:hero_profile/blocs/character_list/character_list_bloc.dart';
import 'package:hero_profile/blocs/character_list/character_list_state.dart';
import 'package:hero_profile/models/character.dart';
import 'package:hero_profile/screens/base/state/base_page_state.dart';
import 'package:hero_profile/screens/character_info/character_info_page.dart';
import 'package:hero_profile/widgets/character_item.dart';
import 'package:hero_profile/widgets/slide_animation_widgets/ltr_slide_animation_widgets/ltr_slide_animation_list/ltr_slide_animation_list.dart';

class CharactersPage extends StatefulWidget {
  final String title;
  final String appBarBg =
      'https://www.wallpaperup.com/uploads/wallpapers/2015/11/28/844462/3fd9cb463620756c8f3dacc926303d45.jpg';

  CharactersPage({this.title = ''}) : assert(title != null);

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends BasePageState<CharactersPage> {
  List<Character> list = [];

  CharacterListBloc _characterListBloc;

  @override
  void initState() {
    _characterListBloc = BlocProvider.of<CharacterListBloc>(context);
    _characterListBloc.dispatch(OnStart());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<CharacterListBloc, BaseState>(
          bloc: _characterListBloc,
          builder: (context, state) {
            Widget _replaceWidget;
            bool isLoading = false;

            if (state is InitialState) {
              _replaceWidget = buildBlankFragment();
              isLoading = true;
            }
            if (state is LoadingCharacterSate) {
              _replaceWidget = showProgressIndicator();
              isLoading = true;
            }

            if (state is LoadedCharacterState) {
              _replaceWidget = _buildCharacterList(state.characters);
            }
            return isLoading
                ? _replaceWidget
                : Stack(
                    children: <Widget>[
                      CustomScrollView(
                        slivers: <Widget>[
                          _replaceWidget,
                        ],
                      ),
                    ],
                  );
          },
        ));
  }

  Widget _buildCharacterList(List<Character> list) {
    return SliverPadding(
      padding: EdgeInsets.only(
          top: scaleHeight(56 + 10.0), bottom: scaleHeight(68 + 10.0)),
      sliver: LTRSlideAnimationList(list
          .map<CharacterItem>((item) => CharacterItem(
                item,
                itemHeight: scaleHeight(120),
                circleBorderWidth: scaleWidth(2.5),
                avatarSize: scaleWidth(90),
                itemPaddingTop: scaleHeight(10),
                itemPaddingLeft: scaleWidth(10),
                itemPaddingRight: scaleWidth(10),
                itemPaddingBottom: scaleHeight(10),
                contentPaddingLeft: scaleWidth(15),
                contentPaddingRight: scaleWidth(15),
                textRatio: screenWidthRatio(),
                itemClickListener: (id) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CharacterInfoPage(
                        character: item,
                        repository: item.repository,
                      ),
                    ),
                  );
                },
              ))
          .toList()),
    );
  }

  @override
  double getProgressViewHeight() => screenSize.height;

  @override
  void dispose() {
    _characterListBloc.dispose();
    super.dispose();
  }
}
