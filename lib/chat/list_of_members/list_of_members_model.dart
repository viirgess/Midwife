import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_of_members_widget.dart' show ListOfMembersWidget;
import 'package:flutter/material.dart';

class ListOfMembersModel extends FlutterFlowModel<ListOfMembersWidget> {
  ///  Local state fields for this component.

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this component.

  List<UsersRecord> simpleSearchResults1 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
