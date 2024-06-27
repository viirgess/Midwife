import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'topic_description_model.dart';
export 'topic_description_model.dart';

class TopicDescriptionWidget extends StatefulWidget {
  const TopicDescriptionWidget({
    super.key,
    required this.title,
    required this.date,
    required this.image,
    required this.topicOne,
    required this.oneDescription,
    required this.topicTwo,
    required this.twoDescription,
    required this.topicThree,
    required this.threeDescription,
    required this.topicFour,
    required this.fourDescription,
    required this.topicFive,
    required this.fiveDescription,
    required this.topicSix,
    required this.sixDescription,
    required this.chapterTitle,
    required this.chapterOne,
    required this.chapterTwo,
    required this.chapterThree,
    required this.partOne,
    required this.partOneDescription,
    required this.partTwo,
    required this.partTwoDescription,
    required this.partThree,
    required this.partThreeDescription,
    required this.partFour,
    required this.partFourDescription,
    required this.partFive,
    required this.partFiveDescription,
    required this.partSix,
    required this.partSixDescription,
    required this.partSeven,
    required this.partSevenDescription,
    required this.partEight,
    required this.partEightDescription,
    required this.partNine,
    required this.partNineDescription,
    required this.partTen,
    required this.partTenDescription,
    required this.chapterFour,
    required this.chapterFive,
  });

  final String? title;
  final DateTime? date;
  final String? image;
  final String? topicOne;
  final String? oneDescription;
  final String? topicTwo;
  final String? twoDescription;
  final String? topicThree;
  final String? threeDescription;
  final String? topicFour;
  final String? fourDescription;
  final String? topicFive;
  final String? fiveDescription;
  final String? topicSix;
  final String? sixDescription;
  final String? chapterTitle;
  final String? chapterOne;
  final String? chapterTwo;
  final String? chapterThree;
  final String? partOne;
  final String? partOneDescription;
  final String? partTwo;
  final String? partTwoDescription;
  final String? partThree;
  final String? partThreeDescription;
  final String? partFour;
  final String? partFourDescription;
  final String? partFive;
  final String? partFiveDescription;
  final String? partSix;
  final String? partSixDescription;
  final String? partSeven;
  final String? partSevenDescription;
  final String? partEight;
  final String? partEightDescription;
  final String? partNine;
  final String? partNineDescription;
  final String? partTen;
  final String? partTenDescription;
  final String? chapterFour;
  final String? chapterFive;

  @override
  State<TopicDescriptionWidget> createState() => _TopicDescriptionWidgetState();
}

class _TopicDescriptionWidgetState extends State<TopicDescriptionWidget> {
  late TopicDescriptionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopicDescriptionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
