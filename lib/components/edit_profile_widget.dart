import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget>
    with TickerProviderStateMixin {
  late EditProfileModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    _model.newDisplayNameFocusNode ??= FocusNode();

    _model.newEmailFocusNode ??= FocusNode();

    _model.newPasswordTextController ??= TextEditingController();
    _model.newPasswordFocusNode ??= FocusNode();
    _model.newPasswordFocusNode!.addListener(() => safeSetState(() {}));
    _model.confirmPasswordTextController ??= TextEditingController();
    _model.confirmPasswordFocusNode ??= FocusNode();
    _model.confirmPasswordFocusNode!.addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'circleImageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.newPasswordTextController?.text =
              FFLocalizations.of(context).getText(
            'tg1e2iy5' /* Enter Your New Password Here */,
          );
          _model.confirmPasswordTextController?.text =
              FFLocalizations.of(context).getText(
            'bdep1j07' /* Confirm Your New Password Here */,
          );
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 16.0),
            child: StreamBuilder<List<UsersRecord>>(
              stream: queryUsersRecord(
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: SpinKitWave(
                        color: FlutterFlowTheme.of(context).accent1,
                        size: 100.0,
                      ),
                    ),
                  );
                }
                List<UsersRecord> containerUsersRecordList = snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final containerUsersRecord = containerUsersRecordList.isNotEmpty
                    ? containerUsersRecordList.first
                    : null;

                return Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 670.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        color: Color(0x1E000000),
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'rc5ozpsf' /* Edit Profile */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'The Seasons',
                                color: FlutterFlowTheme.of(context).alternate,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'aor6gsvi' /* Below are your profile details */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'WorkSans',
                                color: FlutterFlowTheme.of(context).alternate,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Container(
                                                width: 90.0,
                                                height: 90.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.memory(
                                                  _model.uploadedLocalFile_uploadPhoto1
                                                          .bytes ??
                                                      Uint8List.fromList([]),
                                                  fit: BoxFit.fitWidth,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.jpg',
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'circleImageOnPageLoadAnimation']!),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'EDIT_PROFILE_CHANGE_PHOTO_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_upload_media_to_firebase');
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            maxWidth: 400.00,
                                            maxHeight: 400.00,
                                            allowPhoto: true,
                                            includeDimensions: true,
                                            includeBlurHash: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() => _model
                                                    .isDataUploading_uploadPhoto1 =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              showUploadMessage(
                                                context,
                                                'Uploading file...',
                                                showLoading: true,
                                              );
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();

                                              downloadUrls = (await Future.wait(
                                                selectedMedia.map(
                                                  (m) async => await uploadData(
                                                      m.storagePath, m.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                              _model.isDataUploading_uploadPhoto1 =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_uploadPhoto1 =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl_uploadPhoto1 =
                                                    downloadUrls.first;
                                              });
                                              showUploadMessage(
                                                  context, 'Success!');
                                            } else {
                                              safeSetState(() {});
                                              showUploadMessage(context,
                                                  'Failed to upload data');
                                              return;
                                            }
                                          }

                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().ProfilePicture = _model
                                              .uploadedFileUrl_uploadPhoto1;
                                          FFAppState().update(() {});
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            photoUrl: _model
                                                .uploadedFileUrl_uploadPhoto1,
                                          ));
                                          if (FFAppState().ProfilePicture ==
                                              '') {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Profile Picture Uploaded!',
                                                  style: TextStyle(
                                                    fontFamily: 'WorkSans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                              ),
                                            );
                                          } else if (currentUserPhoto != '') {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Profile Picture Uploaded!',
                                                  style: TextStyle(
                                                    fontFamily: 'WorkSans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                              ),
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Please try again!',
                                                  style: TextStyle(
                                                    fontFamily: 'WorkSans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                              ),
                                            );
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'sg5casbc' /* Change Photo */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 44.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'WorkSans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          hoverTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          hoverElevation: 3.0,
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 0.0),
                                  child: TextFormField(
                                    controller:
                                        _model.newDisplayNameTextController ??=
                                            TextEditingController(
                                      text: valueOrDefault<String>(
                                        containerUsersRecord?.displayName,
                                        'Enter New Display Name...',
                                      ),
                                    ),
                                    focusNode: _model.newDisplayNameFocusNode,
                                    autofocus: true,
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'uztjvpf1' /* New Display Name */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 20.0, 24.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    validator: _model
                                        .newDisplayNameTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
                                                    TextCapitalization.none),
                                          );
                                        }),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 0.0),
                                  child: TextFormField(
                                    controller:
                                        _model.newEmailTextController ??=
                                            TextEditingController(
                                      text: valueOrDefault<String>(
                                        containerUsersRecord?.email,
                                        'Enter New Email Here...',
                                      ),
                                    ),
                                    focusNode: _model.newEmailFocusNode,
                                    autofocus: true,
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'iewai4q7' /* New Email */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 20.0, 24.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          letterSpacing: 0.0,
                                        ),
                                    maxLines: 4,
                                    minLines: 1,
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    validator: _model
                                        .newEmailTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
                                                    TextCapitalization.none),
                                          );
                                        }),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 8.0),
                                  child: TextFormField(
                                    controller:
                                        _model.newPasswordTextController,
                                    focusNode: _model.newPasswordFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.newPasswordTextController',
                                      Duration(milliseconds: 2000),
                                      () => safeSetState(() {}),
                                    ),
                                    autofocus: true,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    obscureText: !_model.newPasswordVisibility,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'mimdx71q' /* New Password */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 20.0, 24.0),
                                      suffixIcon: InkWell(
                                        onTap: () => safeSetState(
                                          () => _model.newPasswordVisibility =
                                              !_model.newPasswordVisibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.newPasswordVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          letterSpacing: 0.0,
                                        ),
                                    maxLength: 20,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    enableInteractiveSelection: true,
                                    validator: _model
                                        .newPasswordTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
                                                    TextCapitalization.none),
                                          );
                                        }),
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z0-9]'))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 8.0),
                                  child: TextFormField(
                                    controller:
                                        _model.confirmPasswordTextController,
                                    focusNode: _model.confirmPasswordFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.confirmPasswordTextController',
                                      Duration(milliseconds: 2000),
                                      () => safeSetState(() {}),
                                    ),
                                    autofocus: true,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    obscureText:
                                        !_model.confirmPasswordVisibility,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'amafxs90' /* Confirm Your New Password */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 20.0, 24.0),
                                      suffixIcon: InkWell(
                                        onTap: () => safeSetState(
                                          () => _model
                                                  .confirmPasswordVisibility =
                                              !_model.confirmPasswordVisibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.confirmPasswordVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          letterSpacing: 0.0,
                                        ),
                                    maxLength: 20,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    enableInteractiveSelection: true,
                                    validator: _model
                                        .confirmPasswordTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
                                                    TextCapitalization.none),
                                          );
                                        }),
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z0-9]'))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 4,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 20.0, 0.0, 0.0),
                                                child: SelectionArea(
                                                    child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qyqvnwcg' /* The email associated with this... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 4.0, 0.0, 0.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    currentUserEmail,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 20.0, 0.0, 0.0),
                                                child: SelectionArea(
                                                    child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zzhd9uw3' /* Created On: */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 4.0, 0.0, 0.0),
                                                child: SelectionArea(
                                                    child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '3jbapegn' /* July 12th, 2023 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 20.0, 0.0, 0.0),
                                                child: SelectionArea(
                                                    child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'pck7ltqw' /* Last Active: */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 4.0, 0.0, 0.0),
                                                child: SelectionArea(
                                                    child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    's8cawauc' /* Just Now */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 12.0, 24.0, 24.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.05),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'EDIT_PROFILE_COMP_CANCEL_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_close_dialog_drawer_etc');
                                            Navigator.pop(context);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'p2vgkw63' /* Cancel */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 44.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'WorkSans',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 5.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            hoverTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            hoverElevation: 3.0,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.05),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'EDIT_PROFILE_SAVE_CHANGES_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_validate_form');
                                            _model.validateEditProfile = true;
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              safeSetState(() => _model
                                                  .validateEditProfile = false);
                                              return;
                                            }
                                            if ((_model.uploadedLocalFile_uploadPhoto1
                                                            .bytes ??
                                                        [])
                                                    .isEmpty) {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                maxWidth: 400.00,
                                                maxHeight: 400.00,
                                                allowPhoto: true,
                                                includeDimensions: true,
                                                includeBlurHash: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                safeSetState(() => _model
                                                        .isDataUploading_uploadPhoto1 =
                                                    true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
                                                  showUploadMessage(
                                                    context,
                                                    'Uploading file...',
                                                    showLoading: true,
                                                  );
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();

                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  _model.isDataUploading_uploadPhoto1 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile_uploadPhoto1 =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl_uploadPhoto1 =
                                                        downloadUrls.first;
                                                  });
                                                  showUploadMessage(
                                                      context, 'Success!');
                                                } else {
                                                  safeSetState(() {});
                                                  showUploadMessage(context,
                                                      'Failed to upload data');
                                                  return;
                                                }
                                              }

                                              _model.validateEditProfile =
                                                  false;
                                              safeSetState(() {});
                                              return;
                                            }
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              email: _model
                                                  .newEmailTextController.text,
                                              displayName: _model
                                                  .newDisplayNameTextController
                                                  .text,
                                            ));
                                            logFirebaseEvent('Button_auth');
                                            await authManager.updatePassword(
                                              newPassword: _model
                                                  .newPasswordTextController
                                                  .text,
                                              context: context,
                                            );
                                            safeSetState(() {});

                                            logFirebaseEvent(
                                                'Button_navigate_back');
                                            context.safePop();
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'You successfully updated your profile information!',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );

                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'mic0red2' /* Save Changes */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 44.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'WorkSans',
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            hoverBorderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            hoverTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            hoverElevation: 0.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
