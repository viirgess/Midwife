import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_post_widget.dart' show CreatePostWidget;
import 'package:flutter/material.dart';

class CreatePostModel extends FlutterFlowModel<CreatePostWidget> {
  ///  Local state fields for this page.

  DocumentReference? groupRef;

  List<String> photosUploaded = [];
  void addToPhotosUploaded(String item) => photosUploaded.add(item);
  void removeFromPhotosUploaded(String item) => photosUploaded.remove(item);
  void removeAtIndexFromPhotosUploaded(int index) =>
      photosUploaded.removeAt(index);
  void insertAtIndexInPhotosUploaded(int index, String item) =>
      photosUploaded.insert(index, item);
  void updatePhotosUploadedAtIndex(int index, Function(String) updateFn) =>
      photosUploaded[index] = updateFn(photosUploaded[index]);

  String? title;

  String? description;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in CreatePost widget.
  PostsRecord? postDocument;
  // State field(s) for TitleTextField widget.
  FocusNode? titleTextFieldFocusNode;
  TextEditingController? titleTextFieldTextController;
  String? Function(BuildContext, String?)?
      titleTextFieldTextControllerValidator;
  // State field(s) for DetailsTextField widget.
  FocusNode? detailsTextFieldFocusNode;
  TextEditingController? detailsTextFieldTextController;
  String? Function(BuildContext, String?)?
      detailsTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  GroupsRecord? groupDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    titleTextFieldFocusNode?.dispose();
    titleTextFieldTextController?.dispose();

    detailsTextFieldFocusNode?.dispose();
    detailsTextFieldTextController?.dispose();
  }
}
