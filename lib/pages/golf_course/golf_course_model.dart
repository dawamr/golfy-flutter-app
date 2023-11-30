import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'golf_course_widget.dart' show GolfCourseWidget;
import 'package:flutter/material.dart';

class GolfCourseModel extends FlutterFlowModel<GolfCourseWidget> {
  ///  Local state fields for this page.

  List<dynamic> listGolfCourse = [];
  void addToListGolfCourse(dynamic item) => listGolfCourse.add(item);
  void removeFromListGolfCourse(dynamic item) => listGolfCourse.remove(item);
  void removeAtIndexFromListGolfCourse(int index) =>
      listGolfCourse.removeAt(index);
  void insertAtIndexInListGolfCourse(int index, dynamic item) =>
      listGolfCourse.insert(index, item);
  void updateListGolfCourseAtIndex(int index, Function(dynamic) updateFn) =>
      listGolfCourse[index] = updateFn(listGolfCourse[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getGolfCourse)] action in golfCourse widget.
  ApiCallResponse? apiResult074;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (searchGolfCourse)] action in TextField widget.
  ApiCallResponse? apiResultwl7;
  // Stores action output result for [Backend Call - API (getGolfCourse)] action in TextField widget.
  ApiCallResponse? apiResultd9c;
  // Stores action output result for [Backend Call - API (getGolfCourse)] action in ListView widget.
  ApiCallResponse? apiResult074Copy;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
