import 'dart:io';

import 'package:camera/camera.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/nav/home_screen.dart';
import 'package:twitter_clone/features/thread/view_models/upload_thread_view_model.dart';
import 'package:twitter_clone/utils/util.dart';
import 'package:twitter_clone/views/camera_screen.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> {
  XFile? _picture;

  final _textController = TextEditingController();
  String _wordContents = '';
  final faker = Faker();
  //final profile = getImage();
  late String username;

  @override
  void initState() {
    username = faker.person.name();
    super.initState();
    _textController.addListener(() {
      setState(() {
        _wordContents = _textController.text;
      });
    });
  }

  void _onPostTap() async {
    if (_picture != null) {
      print("onPost tapped");
      await ref.read(uploadThreadProvider.notifier).uploadThread(
            img: File(_picture!.path),
            context: context,
            contents: _wordContents,
          );
      print("back on screen");
      context.pop();
      context.pushReplacement(NavHomeScreen.routeURL);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaHeight(context) * 0.5,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Center(
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: Sizes.size16),
              ),
            ),
          ),
          leadingWidth: 80,
          backgroundColor: Colors.transparent,
          title: const Text('New thread'),
          centerTitle: true,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              height: 24,
              thickness: 1,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CircleAvatar(
                          foregroundImage: NetworkImage(
                            //profile,
                            faker.image.image(),
                          ),
                          radius: 24,
                        ),
                        Expanded(
                          child: VerticalDivider(
                            width: Sizes.size32,
                            thickness: 0.5,
                            color: Colors.grey.shade600,
                            indent: 5,
                            endIndent: 5,
                          ),
                        ),
                        CircleAvatar(
                          foregroundImage: NetworkImage(
                            //profile,
                            faker.image.image(),
                          ),
                          radius: 12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            hintText: "Start a thread...",
                            border: InputBorder.none,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: GestureDetector(
                            onTap: () async {
                              final picture = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CameraScreen(),
                                ),
                              );

                              setState(() {
                                _picture = picture;
                              });
                              print(_picture!.path);
                              //ref.read upload picture
                            },
                            child: Icon(
                              FontAwesomeIcons.paperclip,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        _picture != null
                            ? SizedBox(
                                height: Sizes.size96,
                                child: Stack(
                                  children: [
                                    Image.file(
                                      File(_picture!.path),
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      top: 5,
                                      right: 5,
                                      child: GestureDetector(
                                        onTap: () => setState(() {
                                          _picture = null;
                                        }),
                                        child: Icon(
                                          FontAwesomeIcons.solidCircleXmark,
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _onPostTap,
              child: Padding(
                padding: const EdgeInsets.only(bottom: Sizes.size30),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Post",
                    style: TextStyle(
                      color: Colors.blue
                          .withOpacity(_textController.text.isEmpty ? 0.3 : 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // bottomSheet: BottomAppBar(
        //   elevation: 0,
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 12,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         "Anyone can reply",
        //         style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        //       ),
        //       Text(
        //         "Post",
        //         style: TextStyle(
        //           color: Colors.blue
        //               .withOpacity(_textController.text.isEmpty ? 0.3 : 1),
        //           fontSize: 16,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
