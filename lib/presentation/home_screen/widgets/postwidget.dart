import 'package:flutter/material.dart';
import 'package:noviindus_machinetest/core/constants.dart';
import 'package:noviindus_machinetest/data/models/homemodel.dart';
import 'package:video_player/video_player.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    required this.size,
    required this.list,
    required this.index,
  });
  final List<Result> list;
  final Size size;
  final int index;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    print('object ${widget.list[widget.index].video}');
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.list[widget.index].video));
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: widget.list[widget.index].user.image != null
                    ? NetworkImage(
                        widget.list[widget.index].user.image,
                        scale: 1.0,
                      )
                    : null,
                child: widget.list[widget.index].user.image == null
                    ? const Icon(
                        Icons.person,
                        color: Constants.grey,
                        size: 25,
                      )
                    : null,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.list[widget.index].user.name,
                    style: const TextStyle(
                      color: Constants.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    '5 dayse ago',
                    style: TextStyle(
                      color: Constants.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Center(
        //             child: Icon(
        //               _controller.value.isPlaying
        //                   ? Icons.pause
        //                   : Icons.play_arrow,
        //             ),
        //           ),
        Stack(
          children: [
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return Container(
                    color: Constants.grey,
                    height: widget.size.height * 0.6,
                  );
                }
              },
            ),
            Positioned(
              right: 10,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Constants.white,
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Icon(
            //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            //   ),
            // )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.list[widget.index].description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Constants.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
