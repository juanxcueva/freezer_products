import 'package:flutter/material.dart';
import 'package:freezer_products/app/ui/global_widgets/custom_button.dart';
import 'package:freezer_products/app/ui/theme/app_colors.dart';
import 'package:video_player/video_player.dart';

class InsideRefriPage extends StatefulWidget {
  const InsideRefriPage({Key? key}) : super(key: key);

  @override
  State<InsideRefriPage> createState() => _InsideRefriPageState();
}

class _InsideRefriPageState extends State<InsideRefriPage> {
  VideoPlayerController controller =
      VideoPlayerController.asset("assets/video/refri1.mp4");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.asset("assets/video/refri1.mp4")
      ..addListener(() {
        if (controller.value.isPlaying) {
          setState(() {});
        }
      })
      ..setLooping(true)
      ..initialize().then((value) => controller.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Interior del Refrigerador"),
        backgroundColor: AppColors.grassColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Text("Interior de la refrigeradora",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          SizedBox(
            height: size.height * 0.05,
          ),
          Center(
            child: controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  )
                : Container(),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            width: size.width * 0.8,
            height: size.height * 0.1,
            child: CustomButton(
                label: "",
                onTap: () {
                  setState(() {
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                  });
                },
                icon: controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          )
        ],
      ),
      
    );
  }
}
