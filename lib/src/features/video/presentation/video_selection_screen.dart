import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:language_learning_app/src/features/pronunciation/presentation/create_challenge/create_pronunciation_screen.dart';
import 'package:language_learning_app/src/features/video/presentation/video_controller.dart';
import 'package:language_learning_app/src/features/video/presentation/video_widget.dart';
import 'package:language_learning_app/src/utils/async_value_ui.dart';
import 'package:language_learning_app/src/utils/toastification.dart';

class VideoSelectionScreen extends ConsumerStatefulWidget {
  const VideoSelectionScreen({super.key, required this.classroomId});
  final String classroomId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VideoSelectionScreenState();
}

class _VideoSelectionScreenState extends ConsumerState<VideoSelectionScreen> {
  final TextEditingController _titleController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  XFile? pickedVideo;
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<dynamic>>(
      createVideoChallengeProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Video'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      hintText: 'Enter video title',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title name';
                      }
                      return null;
                    }),
                gapH20,
                if (pickedVideo == null)
                  ElevatedButton(
                    child: const Text('Pick video'),
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();

                      pickedVideo =
                          await picker.pickVideo(source: ImageSource.gallery);
                      setState(() {});
                    },
                  ),
                if (pickedVideo != null)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: VideoWidget(
                                  filePath: pickedVideo!.path,
                                  fromFile: true))),
                      gapH16,
                      ElevatedButton(
                        child: const Text('Upload video'),
                        onPressed: () async {
                          if (pickedVideo == null) {
                            errorToast(
                                ctx: context,
                                title: 'Upload failed',
                                description: 'Please select a video first');
                          }
                          if (_formKey.currentState!.validate()) {
                            showUploadingDialog(context, ref);
                            final success = await ref
                                .read(createVideoChallengeProvider.notifier)
                                .createVideoAssignment(
                                    name: _titleController.text,
                                    filePath: pickedVideo!.path,
                                    classroomId: widget.classroomId);
                            context.pop();
                            if (success) {
                              successToast(
                                ctx: context,
                                title: 'Post video successful',
                              );
                            }
                          }
                        },
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
