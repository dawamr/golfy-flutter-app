import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'homepage_widget.dart' show HomepageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  Local state fields for this page.

  LatLng? currentLocation;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  /// Query cache managers for this widget.

  final _meProfileCcManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> meProfileCc({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _meProfileCcManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMeProfileCcCache() => _meProfileCcManager.clear();
  void clearMeProfileCcCacheKey(String? uniqueKey) =>
      _meProfileCcManager.clearRequest(uniqueKey);

  final _appMenuHomeManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> appMenuHome({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _appMenuHomeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAppMenuHomeCache() => _appMenuHomeManager.clear();
  void clearAppMenuHomeCacheKey(String? uniqueKey) =>
      _appMenuHomeManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    /// Dispose query cache managers for this widget.

    clearMeProfileCcCache();

    clearAppMenuHomeCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
