import '/flutter_flow/flutter_flow_util.dart';
import 'add_photo_to_post_widget.dart' show AddPhotoToPostWidget;
import 'package:flutter/material.dart';

class AddPhotoToPostModel extends FlutterFlowModel<AddPhotoToPostWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
