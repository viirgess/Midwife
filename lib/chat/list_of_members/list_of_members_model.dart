import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_of_members_widget.dart' show ListOfMembersWidget;
import 'package:flutter/material.dart';

class ListOfMembersModel extends FlutterFlowModel<ListOfMembersWidget> {
  ///  Local state fields for this component.

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in ListOfMembers widget.
  List<UsersRecord>? listOfUsers;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on TextField
  List<UsersRecord>? algoliaSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
