import '/backend/backend.dart';
import '/components/app_bar_baby_names/app_bar_baby_names_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'baby_names_widget.dart' show BabyNamesWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class BabyNamesModel extends FlutterFlowModel<BabyNamesWidget> {
  ///  Local state fields for this page.

  int selectIndex = 0;

  List<BabyNameStruct> listOfNames = [];
  void addToListOfNames(BabyNameStruct item) => listOfNames.add(item);
  void removeFromListOfNames(BabyNameStruct item) => listOfNames.remove(item);
  void removeAtIndexFromListOfNames(int index) => listOfNames.removeAt(index);
  void insertAtIndexInListOfNames(int index, BabyNameStruct item) =>
      listOfNames.insert(index, item);
  void updateListOfNamesAtIndex(int index, Function(BabyNameStruct) updateFn) =>
      listOfNames[index] = updateFn(listOfNames[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in BabyNames widget.
  NameListRecord? babyNames;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Model for AppBarBabyNames component.
  late AppBarBabyNamesModel appBarBabyNamesModel;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    appBarBabyNamesModel = createModel(context, () => AppBarBabyNamesModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarBabyNamesModel.dispose();
  }
}
