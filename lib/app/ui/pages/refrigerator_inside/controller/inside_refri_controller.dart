import 'package:flutter/services.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:video_player/video_player.dart';


class InsideRefriController extends SimpleNotifier {
  // final _patientRepository = Get.i.find<PacientRepository>();
  late VideoPlayerController controller;
  
  InsideRefriController(){
    controller=VideoPlayerController.asset("assets/video/refri1.MOV");
  }

  //gets


  //sets


  //methods

  
}