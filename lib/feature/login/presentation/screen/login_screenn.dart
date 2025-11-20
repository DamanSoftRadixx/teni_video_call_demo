import 'dart:math' show Random;

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livekit_components/livekit_components.dart';
import 'package:teni_video_call_demo/core/common_widgets/form_txt_field.dart';
import 'package:teni_video_call_demo/core/local_storage/local_secure_storage.dart';
import 'package:teni_video_call_demo/core/utils/utils.dart';
import 'package:teni_video_call_demo/feature/login/domain/entities/user.dart'
    show TokenStatus, RefreshTokenDetail;
import 'package:teni_video_call_demo/feature/login/presentation/bloc/login_bloc.dart';
import 'package:teni_video_call_demo/feature/login/presentation/bloc/login_event.dart'
    show GenerateTokenLoginEvent, ResetTokenEvent, PreConfigureValuesEvent;
import 'package:teni_video_call_demo/feature/login/presentation/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common_widgets/common_image_loader.dart';
import '../../../../core/constants/image_resource.dart';
import '../../../../core/common_widgets/button_bouncing_effect.dart';
import '../../../../core/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:teni_video_call_demo/feature/video_calling/domain/entities/video_calling_parsing_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // A key for managing the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _hostUrlController = TextEditingController(
    text: "",
  );
  final TextEditingController _tokenController = TextEditingController(
    text: "",
  );
  final TextEditingController _roomNameController = TextEditingController(
    text: "",
  );
  final TextEditingController _participantNameController =
      TextEditingController(text: "");

  bool _showOverlay = true; // Show by default

  @override
  void initState() {
    super.initState();
    configureValues();
  }

  void configureValues() async {
    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    _roomNameController.text = "TestingRoomOne";
    final deviceName = await Utils.getDeviceNameWithDeviceId();
    _participantNameController.text = deviceName;

    final refreshTokenDetail = await LocalSecureStorage()
        .getRefreshTokenDetail();
    if (refreshTokenDetail != null) {
      context.read<LoginBloc>().add(
        PreConfigureValuesEvent(refreshTokenDetail: refreshTokenDetail),
      );
    }
    // });
  }

  @override
  void dispose() {
    _hostUrlController.dispose();
    _tokenController.dispose();
    _roomNameController.dispose();
    _participantNameController.dispose();
    super.dispose();
  }

  void _onGernateTokenPressed() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }
    // context.goNamed(RouteNames.productList);
    // getIt<LoginBloc>().add(SubmitLoginEvent(email: email, password: password));
    context.read<LoginBloc>().add(
      GenerateTokenLoginEvent(
        roomName: _roomNameController.text,
        participantName: _participantNameController.text,
      ),
    );
  }

  void _onResetTokenPressed() {
    context.read<LoginBloc>().add(
      ResetTokenEvent(
        hostUrl: _hostUrlController.text,
        token: _tokenController.text,
        roomName: _roomNameController.text,
        participantName: _participantNameController.text,
      ),
    );
  }

  void _onJoinVideoCallPressed() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // ScaffoldMessenger.of(
    //   context,
    // ).showSnackBar(SnackBar(content: Text(errorMessage)));
    // context.goNamed(RouteNames.productList);
    // getIt<LoginBloc>().add(SubmitLoginEvent(email: email, password: password));
    // context.read<LoginBloc>().add(
    //   GenerateTokenLoginEvent(
    //     roomName: roomName,
    //     participantName: participantName,
    //   ),
    // );
  }

  Future<void> _saveDetailToSharedPreferences({
    required RefreshTokenDetail refreshTokenDetail,
  }) async {
    await LocalSecureStorage().saveRefreshTokenDetail(refreshTokenDetail);
    var parsingModel = VideoCallingParsingModel(
      serverUrl: refreshTokenDetail.serverUrl,
      token: refreshTokenDetail.participantToken,
      roomName: refreshTokenDetail.roomName,
      participantName: refreshTokenDetail.participantName,
    );
    if (!mounted) {
      return;
    }
    context.pushNamed(RouteNames.videoCalling, extra: parsingModel);
  }

  Future<void> _resetDetailToSharedPreferences() async {
    await LocalSecureStorage().clearRefreshTokenDetail();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    _onDoubleClickJoinTempDetailVideoCallPressed() {
      // var parsingModel = VideoCallingParsingModel(
      //   serverUrl: 'wss://tenivideocalldemo-w1c5pwyo.livekit.cloud',
      //   token:
      //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NjM2MTY5NzcsImlkZW50aXR5Ijoic2RrX2dwaG9uZTY0X2FybTY0IC0gQUUzQS4yNDA4MDYuMDM2IiwiaXNzIjoiQVBJQTROVXh2M053dldDIiwibmJmIjoxNzYzNjE2MDc3LCJzdWIiOiJzZGtfZ3Bob25lNjRfYXJtNjQgLSBBRTNBLjI0MDgwNi4wMzYiLCJ2aWRlbyI6eyJjYW5VcGRhdGVPd25NZXRhZGF0YSI6dHJ1ZSwicm9vbSI6IlRlc3RpbmdSb29tT25lIiwicm9vbUpvaW4iOnRydWUsInJvb21MaXN0Ijp0cnVlfX0.Lg1DJnrHEbpQywY2uMGQHNc6FuzXqELfPZ4WzAfR6DU',
      //   roomName: _roomNameController.text,
      //   participantName: _participantNameController.text,
      // );
      // if (!mounted) {
      //   return;
      // }
      // context.pushNamed(RouteNames.videoCalling, extra: parsingModel);
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      onDoubleTap: () => _onDoubleClickJoinTempDetailVideoCallPressed(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(
            'Teni',
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          elevation: 0,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Main login form
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            _hostUrlController.text =
                                state.refreshTokenDetail.serverUrl;
                            _tokenController.text =
                                state.refreshTokenDetail.participantToken;
                            _roomNameController.text =
                                state.refreshTokenDetail.roomName;
                            _participantNameController.text =
                                state.refreshTokenDetail.participantName;
                            if (state.refreshTokenDetail.tokenStatus ==
                                TokenStatus.generated) {
                              _saveDetailToSharedPreferences(
                                refreshTokenDetail: state.refreshTokenDetail,
                              );
                            } else {
                              _resetDetailToSharedPreferences();
                            }
                          } else if (state is LoginFailure) {
                            var parsingModel = VideoCallingParsingModel(
                              serverUrl:
                                  'wss://tenivideocalldemo-w1c5pwyo.livekit.cloud',
                              token: 'ddf',
                              roomName: 'TestingRoomOne',
                              participantName: 'deviceName',
                            );
                            if (!mounted) {
                              return;
                            }
                            // context.pushNamed(
                            //   RouteNames.videoCalling,
                            //   extra: parsingModel,
                            // );
                          }
                        },
                        // buildWhen: (previous, current) {
                        //   if (false &&
                        //       previous is LoginSuccess &&
                        //       current is LoginSuccess) {
                        //     return previous.refreshTokenDetail.tokenStatus !=
                        //         current.refreshTokenDetail.tokenStatus;
                        //   }
                        //   return true;
                        // },
                        builder: (context, state) {
                          bool isExpiredToken = false;
                          bool isLoading = false;
                          if (state is LoginLoading) {
                            isLoading = true;
                          }
                          if (state is LoginSuccess) {
                            isExpiredToken =
                                state.refreshTokenDetail.tokenStatus ==
                                TokenStatus.expired;
                          }
                          // if (state is LoginLoading) {
                          //   return Center(child: CircularProgressIndicator());
                          // }
                          // if (state is LoginSuccess &&
                          //     state.refreshTokenDetail.tokenStatus ==
                          //         TokenStatus.generated) {
                          //   return _joinVideoCallWidget(
                          //     isLoading: isLoading,
                          //     context: context,
                          //     serverUrlController: _hostUrlController,
                          //     tokenController: _tokenController,
                          //     roomNameController: _roomNameController,
                          //     participantNameController: _participantNameController,
                          //   );
                          // }
                          return _tokenGernateWidget(
                            isLoading: isLoading,
                            isExpiredToken: isExpiredToken,
                            context: context,
                            roomNameController: _roomNameController,
                            participantNameController:
                                _participantNameController,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Draggable overlay (non-modal, clickable background)
            if (_showOverlay)
              Positioned(
                left: 0,
                right: 0,
                top: 0, // Add top constraint to provide bounded height
                bottom: 0,
                child: Container(
                  child: CustomDraggableBottomSheet(onDismiss: hideOverlay),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _joinVideoCallWidget({
    required bool isLoading,
    required BuildContext context,
    required TextEditingController serverUrlController,
    required TextEditingController tokenController,
    required TextEditingController roomNameController,
    required TextEditingController participantNameController,
  }) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return LivekitRoom(
      roomContext: RoomContext(
        enableAudioVisulizer: true,
        onConnected: () {
          if (kDebugMode) {
            print('Connected to room');
          }
        },
        onDisconnected: () {
          if (kDebugMode) {
            print('Disconnected from room');
          }
        },
        onError: (error) {
          if (kDebugMode) {
            print('Error: $error');
          }
        },
      ),
      builder: (context, roomCtx) {
        return Column(
          children: [
            // Logo
            CommonImageLoader(
              asset: CommonImageAsset(
                path: ImageResource.splashOverLayBlueYellow,
                type: CommonImageType.png,
              ),
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 24),
            // Title
            Text(
              'Join Video Call',
              style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Join the video call with your host URL and token',
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: CameraPreview(
                builder: (context, videoTrack) =>
                    CameraPreviewWidget(track: videoTrack),
              ),
            ),
            SizedBox(
              width: 360,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MicrophoneSelectButton(),
                    CameraSelectButton(showTitleWidget: true),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
            CommonFormTextField(
              hintText: 'Host URL',
              controller: serverUrlController,
              borderRadius: 12,
              textStyle: textTheme.bodyLarge,
              hintStyle: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              keyboardTypeParam: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CommonFormTextField(
              suffixIcon: IconButton(
                onPressed: () {
                  _tokenController.clear();
                },
                icon: Icon(Icons.visibility),
              ),
              hintText: 'Token',
              isPassword: true,
              borderRadius: 12,
              controller: participantNameController,
              textStyle: textTheme.bodyLarge,
              hintStyle: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: 16),
            CommonFormTextField(
              hintText: 'Participant Name',
              readOnlyParam: true,

              borderRadius: 12,
              controller: participantNameController,
              textStyle: textTheme.bodyLarge,
              hintStyle: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: 16),
            CommonFormTextField(
              hintText: 'Room Name',
              readOnlyParam: true,
              borderRadius: 12,
              controller: roomNameController,
              textStyle: textTheme.bodyLarge,
              hintStyle: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: 24),
            ButtonBouncingEffect(
              buttonText: 'Join Video Call',
              onTap: isLoading ? null : _onJoinVideoCallPressed,
              isLoading: isLoading,
            ),
            SizedBox(height: 10),
            ButtonBouncingEffect(
              buttonText: 'Reset Token',
              onTap: isLoading ? null : _onResetTokenPressed,
            ),
          ],
        );
      },
    );
  }

  Widget _tokenGernateWidget({
    required bool isLoading,
    required bool isExpiredToken,
    required BuildContext context,
    required TextEditingController roomNameController,
    required TextEditingController participantNameController,
  }) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Column(
      children: [
        // Logo
        CommonImageLoader(
          asset: CommonImageAsset(
            path: ImageResource.splashOverLayBlueYellow,
            type: CommonImageType.png,
          ),
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 24.h),
        // Title
        Text(
          'Generate Token',
          style: textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          'Teni Video Call Demo',
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32.h),
        CommonFormTextField(
          hintText: 'Room Name',
          controller: roomNameController,
          borderRadius: 12,
          textStyle: textTheme.bodyLarge,
          hintStyle: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          keyboardTypeParam: TextInputType.emailAddress,
          validatorFunction: (value) {
            if (value == null || value.isEmpty || value.trim().isEmpty) {
              return 'Room Name is required';
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        CommonFormTextField(
          hintText: 'Participant Name',
          borderRadius: 12,
          controller: participantNameController,
          textStyle: textTheme.bodyLarge,
          hintStyle: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          validatorFunction: (value) {
            if (value == null || value.isEmpty || value.trim().isEmpty) {
              return 'Participant Name is required';
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        ButtonBouncingEffect(
          buttonText: 'Generate Token',
          onTap: isLoading ? null : _onGernateTokenPressed,
          isLoading: isLoading,
        ),
        SizedBox(height: 20.h),
        // for bottom sheet view
        ButtonBouncingEffect(
          buttonText: _showOverlay ? 'Hide Participants' : 'Show Participants',
          onTap: isLoading ? null : showBottomSheetView,
          isLoading: isLoading,
        ),
      ],
    );
  }

  void showBottomSheetView() {
    setState(() {
      _showOverlay = !_showOverlay; // Toggle overlay visibility
    });
  }

  void hideOverlay() {
    setState(() {
      _showOverlay = false;
    });
  }
}

class CustomDraggableBottomSheet extends StatefulWidget {
  final VoidCallback onDismiss;

  const CustomDraggableBottomSheet({Key? key, required this.onDismiss})
    : super(key: key);

  @override
  State<CustomDraggableBottomSheet> createState() =>
      _CustomDraggableBottomSheetState();
}

class _CustomDraggableBottomSheetState
    extends State<CustomDraggableBottomSheet> {
  // Demo data for grid items
  final List<ParticipantData> participants = [
    ParticipantData(
      name: 'You sadf ',
      imageUrl: 'assets/avatar1.png',
      participantType: ParticipantType.host,
      participantMicStatus: ParticipantMicStatus.accordingToUserPermission,
    ),
    ParticipantData(
      name: 'Joe Kumar',
      imageUrl: 'assets/avatar2.png',
      participantType: ParticipantType.coHost,
      participantMicStatus: ParticipantMicStatus.accordingToUserPermission,
    ),
    ParticipantData(name: 'Alex', imageUrl: 'assets/avatar3.png'),
    ParticipantData(
      name: 'Amy Virak',
      imageUrl: 'assets/avatar4.png',
      participantMicStatus: ParticipantMicStatus.rasiedHandView,
    ),
    ParticipantData(name: 'Monty Rawat ', imageUrl: 'assets/avatar5.png'),
    ParticipantData(name: 'Joker Singh', imageUrl: 'assets/avatar6.png'),
    ParticipantData(name: 'Iron man  ', imageUrl: 'assets/avatar7.png'),
    ParticipantData(
      name: 'Tonny Jerrry',
      imageUrl: 'assets/avatar8.png',
      participantMicStatus: ParticipantMicStatus.rasiedHandView,
    ),
    ParticipantData(name: 'Alex Xel', imageUrl: 'assets/avatar9.png'),
  ];

  ParticipantData? selectedParticipant;
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var backgroundBlackColor = Color(0xFF212121);
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate heights for different states
    // Initial: 1 row of 3 items + header + bottom margin (approximately 220-250px)
    final double minChildSize = 210.h / screenHeight; // ~1 row visible
    double initialChildSize = minChildSize;
    final double mediumChildSize = 0.5; // 50% of screen
    final double maxChildSize = 0.95; // 90% of screen

    // Determine initial size based on participant count
    if (participants.length < 4) {
      initialChildSize = minChildSize;
    } else if (participants.length < 7) {
      initialChildSize = mediumChildSize;
    } else {
      initialChildSize = maxChildSize;
    }

    // Build snapSizes in ascending order, ensuring uniqueness
    final snapSizes = <double>{
      minChildSize,
      mediumChildSize,
      maxChildSize,
    }.toList()..sort();

    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        // Only unselect when reaching min extent (fully collapsed)
        if (notification.extent <= mediumChildSize + 0.01 &&
            selectedParticipant != null) {
          // Sheet has reached min size - clear all selections
          setState(() {
            for (var participant in participants) {
              participant.participantSelectionType =
                  ParticipantSelectionType.none;
            }
            selectedParticipant = null;
          });
        }
        return false;
      },
      child: DraggableScrollableSheet(
        controller: _sheetController,
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        snap: true,
        snapSizes: snapSizes,
        shouldCloseOnMinExtent:
            false, // Prevent closing when reaching minExtent
        builder: (BuildContext context, ScrollController scrollController) {
          bool isCameraViewVisible = false;
          bool isMyMicOne = false;
          ParticipantType isMyParitpicantType = ParticipantType.guest;
          double horizontalPadding = 10.w;
          double veriticalPadding = 8.h;
          double iconSize = 42.w;
          String micOnOffRaiseHandIconPath = 'assets/svg/mic_off_ic.svg';
          if (isMyParitpicantType == ParticipantType.guest) {
            micOnOffRaiseHandIconPath = 'assets/svg/hand_rase_ic.svg';
          } else {
            if (isMyMicOne) {
              micOnOffRaiseHandIconPath = 'assets/svg/mic_ic.svg';
            } else {
              micOnOffRaiseHandIconPath = 'assets/svg/mic_off_ic.svg';
            }
          }
          // Using state variable selectedParticipant instead of local variable

          return Container(
            decoration: BoxDecoration(
              color: backgroundBlackColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    // Header - Drag handle with close button
                    // Container(
                    //   width: double.infinity,
                    //   margin: EdgeInsets.only(top: 3.h, bottom: 8.h),
                    //   alignment: Alignment.center,
                    //   height: 20.h,
                    //   child: Stack(
                    //     alignment: Alignment.center,
                    //     fit: StackFit.loose,
                    //     children: [
                    //       // Drag handle
                    //       Positioned(
                    //         left: 0,
                    //         right: 0,
                    //         top: 0,
                    //         bottom: 0,
                    //         child: Center(
                    //           child: Container(
                    //             width: 55.w,
                    //             height: 4.h,
                    //             decoration: BoxDecoration(
                    //               color: Color(0xFF80848C),
                    //               borderRadius: BorderRadius.circular(2.r),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       // Close button
                    //       Positioned(
                    //         right: 0,
                    //         top: 0,
                    //         bottom: 0,
                    //         child: GestureDetector(
                    //           onTap: () => Navigator.pop(context),
                    //           child: Container(
                    //             padding: EdgeInsets.only(right: 16.w),
                    //             child: Icon(
                    //               Icons.close,
                    //               color: Colors.white.withValues(alpha: 0.7),
                    //               size: 24.sp,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    // Scrollable Grid view
                    Expanded(
                      child: CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverToBoxAdapter(
                            child:
                                // SliverPersistentHeader(
                                //   pinned: true,
                                //   floating: false,
                                //   delegate: SimpleSliverDelegate(
                                //     height: 80,
                                //     child:
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                    top: 3.h,
                                    bottom: 8.h,
                                  ),
                                  alignment: Alignment.center,
                                  height: 20.h,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    fit: StackFit.loose,
                                    children: [
                                      // Drag handle
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: Center(
                                          child: Container(
                                            width: 55.w,
                                            height: 4.h,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF80848C),
                                              borderRadius:
                                                  BorderRadius.circular(2.r),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Close button
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: widget
                                              .onDismiss, // Hide the overlay completely
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              right: 16.w,
                                            ),
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white.withValues(
                                                alpha: 0.7,
                                              ),
                                              size: 24.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            // ),
                          ),

                          // Selected participate View (draggable)
                          if (selectedParticipant != null)
                            SliverToBoxAdapter(
                              child: Container(
                                width: double.infinity,
                                height: 200.h,
                                margin: EdgeInsets.only(
                                  left: 16.w,
                                  right: 16.w,
                                  top: 10.h,
                                  bottom: 10.h,
                                ),
                                child: ParticipantTile(
                                  isBigView: true,
                                  isVideoVisible: Random().nextBool(),
                                  participant: selectedParticipant!,
                                  onHandRaseMicIconClicked: () {},
                                  onCloseIconClicked: () {},
                                  onItemClicked: () {},
                                ),
                              ),
                            ),

                          SliverPadding(
                            padding: EdgeInsets.only(
                              left: 16.w,
                              right: 16.w,
                              top: 0,
                              bottom: 80.h,
                            ),
                            sliver: SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 9.w,
                                    mainAxisSpacing: 9.w,
                                    childAspectRatio:
                                        1.0, // 1.0 = perfect square (width = height)
                                  ),
                              delegate: SliverChildBuilderDelegate((
                                context,
                                index,
                              ) {
                                return ParticipantTile(
                                  isVideoVisible: index == 1 ? true : false,
                                  participant: participants[index],
                                  onHandRaseMicIconClicked: () {
                                    print('Item: onHandRaseMicIconClicked');
                                  },
                                  onCloseIconClicked: () {
                                    print('Item: onCloseIconClicked');
                                  },
                                  onItemClicked: () {
                                    setState(() {
                                      // Clear all selections
                                      for (
                                        var i = 0;
                                        i < participants.length;
                                        i++
                                      ) {
                                        participants[i]
                                                .participantSelectionType =
                                            ParticipantSelectionType.none;
                                      }
                                      // Select the clicked participant
                                      participants[index]
                                              .participantSelectionType =
                                          ParticipantSelectionType.selected;
                                      // Update selectedParticipant
                                      selectedParticipant = participants[index];
                                    });
                                    // Expand to max size when item is selected
                                    _sheetController.animateTo(
                                      maxChildSize,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                    );
                                    print(
                                      'Item: onItemClicked - ${participants[index].name}',
                                    );
                                  },
                                );
                              }, childCount: participants.length),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Static view always visible at bottom
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: 10.h),
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(
                    //       // horizontal: horizontalPadding ?? 10.0,
                    //       // vertical: veriticalPadding ?? 8.0,
                    //       horizontal: 10.w,
                    //       vertical: 8.h,
                    //     ),
                    //     decoration: BoxDecoration(
                    //       color: Colors.black.withValues(alpha: 0.4),
                    //       borderRadius: BorderRadius.circular(50),
                    //     ),
                    //     child: Row(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         _iconViewWidget(
                    //           iconPath: 'assets/svg/mic_off_ic.svg',
                    //           onTap: () {
                    //             print('Item: onMicOffIconClicked');
                    //           },
                    //           paddingRight: horizontalPadding,
                    //           iconSize: iconSize,
                    //         ),
                    //         _iconViewWidget(
                    //           iconPath: 'assets/svg/camera_off_ic.svg',
                    //           onTap: () {
                    //             print('Item: onCameraOffIconClicked');
                    //           },
                    //           paddingRight: horizontalPadding,
                    //           iconSize: iconSize,
                    //         ),
                    //         _iconViewWidget(
                    //           iconPath: 'assets/svg/end_call_ic.svg',
                    //           onTap: () {
                    //             print('Item: onEndCallIconClicked');
                    //           },
                    //           paddingRight: horizontalPadding,
                    //           iconSize: iconSize,
                    //         ),
                    //         _iconViewWidget(
                    //           iconPath: 'assets/svg/mic_ic.svg',
                    //           onTap: () {
                    //             print('Item: onMicOnIconClicked');
                    //           },
                    //           paddingRight: horizontalPadding,
                    //           iconSize: iconSize,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Positioned(
                  // padding: EdgeInsets.only(bottom: 10.h),
                  bottom: 10.h,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: backgroundBlackColor,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            // horizontal: horizontalPadding ?? 10.0,
                            // vertical: veriticalPadding ?? 8.0,
                            horizontal: 10.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _iconViewWidget(
                                iconPath: 'assets/svg/share_ic.svg',
                                onTap: () {
                                  print('Item: onShareIconClicked');
                                },
                                paddingRight: horizontalPadding,
                                iconSize: iconSize,
                              ),
                              _iconViewWidget(
                                iconPath: isCameraViewVisible
                                    ? 'assets/svg/camera_ic.svg'
                                    : 'assets/svg/camera_off_ic.svg',
                                onTap: () {
                                  print('Item: onCameraIconClicked');
                                  setState(() {
                                    isCameraViewVisible = !isCameraViewVisible;
                                  });
                                },
                                paddingRight: horizontalPadding,
                                iconSize: iconSize,
                              ),
                              _iconViewWidget(
                                iconPath: 'assets/svg/end_call_ic.svg',
                                onTap: () {
                                  print('Item: onEndCallIconClicked');
                                },
                                paddingRight: horizontalPadding,
                                iconSize: iconSize,
                              ),
                              _iconViewWidget(
                                iconPath: micOnOffRaiseHandIconPath,
                                onTap: () {
                                  print('Item: onMicOnIconClicked');
                                },
                                paddingRight: horizontalPadding,
                                iconSize: iconSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _iconViewWidget({
    required String iconPath,
    required VoidCallback onTap,
    required double paddingRight,
    required double iconSize,
  }) {
    return Padding(
      padding: EdgeInsets.only(right: paddingRight),
      child: InkWell(
        onTap: onTap,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: SvgPicture.asset(iconPath, width: iconSize, height: iconSize),
      ),
    );
  }
}

enum ParticipantMicStatus {
  on,
  off,
  rasiedHandView,
  accordingToUserPermission,
  none,
}

enum ParticipantType { host, coHost, guest, ai }

enum ParticipantSelectionType { none, selected }

class ParticipantData {
  final String name;
  final String imageUrl;
  bool isCameraOff;
  ParticipantType participantType;
  ParticipantMicStatus participantMicStatus;
  ParticipantSelectionType participantSelectionType;

  ParticipantData({
    required this.name,
    required this.imageUrl,
    this.isCameraOff = false,
    this.participantType = ParticipantType.guest,
    this.participantMicStatus = ParticipantMicStatus.none,
    this.participantSelectionType = ParticipantSelectionType.none,
  });
}

double getBorderWidth({
  required ParticipantType participantType,
  required ParticipantMicStatus participantMicStatus,
  required ParticipantSelectionType participantSelectionType,
}) {
  // return isHostItemView ||
  //         isCoHostItemView ||
  //         isSelectedItemView ||
  //         isHandRaisedItemView
  //     ? 3.w
  //     : 1.w;
  if (participantType == ParticipantType.host ||
      participantType == ParticipantType.coHost ||
      participantSelectionType == ParticipantSelectionType.selected ||
      participantMicStatus == ParticipantMicStatus.rasiedHandView) {
    return 3.w;
  } else {
    return 1.w;
  }
}

LinearGradient getBorderColor({
  required ParticipantType participantType,
  required ParticipantMicStatus participantMicStatus,
  required ParticipantSelectionType participantSelectionType,
  // bool isHostItemView = false,
  // bool isCoHostItemView = false,
  // bool isSelectedItemView = false,
  // bool isHandRaisedItemView = false,
}) {
  if (participantSelectionType == ParticipantSelectionType.selected) {
    return LinearGradient(colors: [Color(0xFFF22245), Color(0xFFF22245)]);
  } else if (participantType == ParticipantType.host) {
    return LinearGradient(colors: [Color(0xFFFB743A), Color(0xFFF99A28)]);
  } else if (participantType == ParticipantType.coHost) {
    return LinearGradient(colors: [Color(0xFF7B9AFF), Color(0xFF7B9AFF)]);
  } else if (participantMicStatus == ParticipantMicStatus.rasiedHandView) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFF7847E), Color(0xFFFAC584), Color(0xFFB0FABC)],
    );
  } else {
    return LinearGradient(
      colors: [
        Color(0xFFFFFFFF).withValues(alpha: 0.2),
        Color(0xFFFFFFFF).withValues(alpha: 0.2),
      ],
    );
  }
}

class ParticipantTile extends StatelessWidget {
  final bool isVideoVisible;
  final bool isBigView;
  final ParticipantData participant;
  final VoidCallback onHandRaseMicIconClicked;
  final VoidCallback onCloseIconClicked;
  final VoidCallback onItemClicked;

  const ParticipantTile({
    Key? key,
    this.isBigView = false,
    required this.isVideoVisible,
    required this.participant,
    required this.onHandRaseMicIconClicked,
    required this.onCloseIconClicked,
    required this.onItemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = 112.w;
    // double height = 112.h;
    double width = double.infinity;
    double height = double.infinity;
    double borderRadius = 10.r;
    bool isSelfView = false;

    double borderWidth = getBorderWidth(
      participantType: participant.participantType,
      participantMicStatus: participant.participantMicStatus,
      participantSelectionType: participant.participantSelectionType,
    );
    LinearGradient borderColor = getBorderColor(
      participantType: participant.participantType,
      participantMicStatus: participant.participantMicStatus,
      participantSelectionType: participant.participantSelectionType,
    );

    return InkWell(
      onTap: onItemClicked,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(borderWidth),
          decoration: BoxDecoration(
            gradient: borderColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Participant avatar/video
                _participantVideoOrEmptyViewWidget(
                  name: participant.name,
                  isSelfView: isSelfView,
                  isVideoVisible: isVideoVisible,
                  participantType: participant.participantType,
                  participantMicStatus: participant.participantMicStatus,
                  participantSelectionType:
                      participant.participantSelectionType,
                ),
                _participantUserDetailShowWidget(
                  isBigView: isBigView,
                  name: participant.name,
                  isSelfView: isSelfView,
                  participantType: participant.participantType,
                  participantMicStatus: participant.participantMicStatus,
                  participantSelectionType:
                      participant.participantSelectionType,
                  isMicOn:
                      participant.participantMicStatus ==
                      ParticipantMicStatus.on,
                  onHandRaseMicIconClicked: onHandRaseMicIconClicked,
                  onCloseIconClicked: onCloseIconClicked,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     color: Color(0xFF2C2C2C),
    //     borderRadius: BorderRadius.circular(12.r),
    //     // border: isPinned ? Border.all(color: Colors.red, width: 2) : null,
    //   ),
    //   child: Stack(
    //     children: [
    //       // Participant avatar/video
    //       Center(
    //         child: Icon(
    //           Icons.person,
    //           size: 40.sp,
    //           color: Colors.white.withValues(alpha: 0.6),
    //         ),
    //       ),

    //       // Microphone indicator (top-left)
    //       if (participant.isMuted)
    //         Positioned(
    //           top: 8.h,
    //           left: 8.w,
    //           child: Container(
    //             padding: EdgeInsets.all(4.r),
    //             decoration: BoxDecoration(
    //               color: Colors.black.withValues(alpha: 0.6),
    //               borderRadius: BorderRadius.circular(4.r),
    //             ),
    //             child: Icon(Icons.mic_off, size: 14.sp, color: Colors.white),
    //           ),
    //         ),

    //       // Camera indicator (top-right)
    //       Positioned(
    //         top: 8.h,
    //         right: 8.w,
    //         child: Container(
    //           padding: EdgeInsets.all(4.r),
    //           decoration: BoxDecoration(
    //             color: Colors.black.withValues(alpha: 0.6),
    //             borderRadius: BorderRadius.circular(4.r),
    //           ),
    //           child: Icon(
    //             participant.isCameraOff ? Icons.videocam_off : Icons.videocam,
    //             size: 14.sp,
    //             color: Colors.white,
    //           ),
    //         ),
    //       ),

    //       // Name label at bottom
    //       Positioned(
    //         bottom: 0,
    //         left: 0,
    //         right: 0,
    //         child: Container(
    //           padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
    //           decoration: BoxDecoration(
    //             color: Colors.black.withValues(alpha: 0.7),
    //             borderRadius: BorderRadius.only(
    //               bottomLeft: Radius.circular(12.r),
    //               bottomRight: Radius.circular(12.r),
    //             ),
    //           ),
    //           child: Text(
    //             participant.name,
    //             style: TextStyle(
    //               color: Colors.white,
    //               fontSize: 11.sp,
    //               fontWeight: FontWeight.w500,
    //             ),
    //             maxLines: 1,
    //             overflow: TextOverflow.ellipsis,
    //             textAlign: TextAlign.center,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget _participantVideoOrEmptyViewWidget({
    required String name,
    required bool isSelfView,
    required bool isVideoVisible,
    required ParticipantType participantType,
    required ParticipantMicStatus participantMicStatus,
    required ParticipantSelectionType participantSelectionType,
  }) {
    String showName = isSelfView ? 'You' : name.substring(0, 1);
    print('isVideoVisible: $isVideoVisible');
    if (isVideoVisible) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/png/dummy_ai_person_img.png'),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.2),
              // borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                showName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _participantUserDetailShowWidget({
    required bool isBigView,
    required String name,
    required bool isSelfView,
    required ParticipantType participantType,
    required ParticipantMicStatus participantMicStatus,
    required ParticipantSelectionType participantSelectionType,
    required bool isMicOn,
    required VoidCallback onHandRaseMicIconClicked,
    required VoidCallback onCloseIconClicked,
  }) {
    String showName = '';
    showName =
        (isSelfView ? 'You' : name.substring(0, 3)).trim() +
        ' (${participantType == ParticipantType.host
            ? 'Host'
            : participantType == ParticipantType.coHost
            ? 'Co-host'
            : 'Guest'})';
    String leftSideIcon = isMicOn
        ? 'assets/svg/mic_ic.svg'
        : 'assets/svg/mic_off_ic.svg';
    if (participantMicStatus == ParticipantMicStatus.rasiedHandView) {
      leftSideIcon = 'assets/svg/hand_rase_ic.svg';
    }
    double iconSize = 23.w;
    if (isBigView) {
      iconSize = 30.w;
    }

    return Stack(
      children: [
        isSelfView
            ? SizedBox.shrink()
            : Positioned(
                top: 0,
                left: 0,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: onHandRaseMicIconClicked,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, top: 5.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        color: isVideoVisible
                            ? Colors.black.withValues(alpha: 0.7)
                            : null,
                        child: SvgPicture.asset(
                          leftSideIcon,
                          width: iconSize,
                          height: iconSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
        isSelfView
            ? SizedBox.shrink()
            : Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: onCloseIconClicked,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, top: 5.w),
                    child: SvgPicture.asset(
                      'assets/svg/close_ic.svg',
                      width: iconSize,
                      height: iconSize,
                    ),
                  ),
                ),
              ),
        isSelfView
            ? SizedBox.shrink()
            : Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  margin: EdgeInsets.only(left: 5.w, bottom: 5.w),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: isVideoVisible
                        ? Colors.black.withValues(alpha: 0.6)
                        : Colors.white.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    showName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isBigView ? 14.sp : 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}

class SimpleSliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  SimpleSliverDelegate({required this.child, required this.height});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox(height: height, child: child);
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
