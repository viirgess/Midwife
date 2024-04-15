import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'main_page_card_model.dart';
export 'main_page_card_model.dart';

class MainPageCardWidget extends StatefulWidget {
  const MainPageCardWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  });

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final String? parameter4;

  @override
  State<MainPageCardWidget> createState() => _MainPageCardWidgetState();
}

class _MainPageCardWidgetState extends State<MainPageCardWidget> {
  late MainPageCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
