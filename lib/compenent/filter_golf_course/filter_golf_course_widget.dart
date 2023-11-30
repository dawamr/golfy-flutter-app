import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filter_golf_course_model.dart';
export 'filter_golf_course_model.dart';

class FilterGolfCourseWidget extends StatefulWidget {
  const FilterGolfCourseWidget({super.key});

  @override
  _FilterGolfCourseWidgetState createState() => _FilterGolfCourseWidgetState();
}

class _FilterGolfCourseWidgetState extends State<FilterGolfCourseWidget> {
  late FilterGolfCourseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterGolfCourseModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 70.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(8.0),
          ),
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Text(
            'Fill some basic informations, so we can match the\nperfect golf course for you.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelSmall,
          ),
        ),
      ],
    );
  }
}
