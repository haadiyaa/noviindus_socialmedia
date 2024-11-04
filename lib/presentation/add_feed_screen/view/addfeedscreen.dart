import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noviindus_machinetest/core/constants.dart';
import 'package:noviindus_machinetest/presentation/add_feed_screen/widgets/custombackbutton.dart';
import 'package:noviindus_machinetest/providers/authprovider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class AddFeedScreen extends StatefulWidget {
  const AddFeedScreen({super.key});

  @override
  State<AddFeedScreen> createState() => _AddFeedScreenState();
}

class _AddFeedScreenState extends State<AddFeedScreen> {
  File? _video;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? _controller;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<Authprovider>(context, listen: false);
    provider.category();
  }

  void _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _video = File(pickedFile.path);
        _controller = VideoPlayerController.file(_video!)..initialize();
      });
    }
  }

  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShareFeedHeader(formKey: key),
                const SizedBox(
                  height: 20,
                ),
                _controller == null
                    ? GestureDetector(
                        onTap: () {
                          _pickVideo();
                        },
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: Constants.white,
                          radius: const Radius.circular(10),
                          strokeWidth: 1,
                          dashPattern: const [6, 6, 6],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 53, 53, 53),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: size.height * 0.5,
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.videocam_outlined,
                                    color: Constants.white,
                                    size: 50,
                                  ),
                                  Text(
                                    'Select a video from Gallary',
                                    style: TextStyle(
                                      color: Constants.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                const SizedBox(
                  height: 25,
                ),
                _image == null
                    ? GestureDetector(
                        onTap: () {
                          _pickImage();
                        },
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: Constants.white,
                          radius: const Radius.circular(10),
                          strokeWidth: 1,
                          dashPattern: const [6, 6, 6],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 53, 53, 53),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: size.height * 0.15,
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_photo_alternate_outlined,
                                    color: Constants.white,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Add a Thumbnail',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 142, 142, 142),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: size.height * 0.15,
                        child: Image(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Add Description',
                  style: TextStyle(color: Constants.white, fontSize: 20),
                ),
                TextField(
                  controller: controller,
                  style: const TextStyle(
                    color: Constants.white,
                  ),
                  // expands: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Constants.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Categories This Project',
                  style: TextStyle(color: Constants.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                SelectButtons(
                  text: 'data',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectButtons extends StatelessWidget {
  const SelectButtons({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Constants.red,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Constants.white,
        ),
      ),
    );
  }
}

class ShareFeedHeader extends StatelessWidget {
  const ShareFeedHeader({
    super.key,
    required this.formKey,
  });
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomBackButton(),
        const Spacer(),
        const Text(
          'Add Feeds',
          style: TextStyle(
            color: Constants.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Spacer(
          flex: 8,
        ),
        OutlinedButton(
          onPressed: () {
            formKey.currentState!.validate();
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Constants.white,
            backgroundColor: Constants.redLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                width: 1,
                color: Color.fromARGB(255, 254, 22, 5),
              ),
            ),
          ),
          child: const Text('Share Post'),
        ),
      ],
    );
  }
}
