import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/api/api_manager/api_manager.dart';
import 'package:islami_app/api/quran_reponse/quran_response.dart';
import 'package:islami_app/myThemeData.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final AudioPlayer audioPlayer = AudioPlayer();

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Center(
        child: Column(
          children: [
            Image.asset("assets/images/radio_image.png"),
            SizedBox(
              height: 20,
            ),
            Text(
              "إذاعة القران الكريم",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color:provider.isDarkMode()? MyThemeData.whiteColor: MyThemeData.blackColor),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ImageIcon(AssetImage("assets/images/prev.png",),color: MyThemeData.primaryColor,),
                !selected
                    ? IconButton(
                        onPressed: () {
                          playAudio();
                          selected = true;
                          setState(() {});
                        },
                        icon: ImageIcon(
                          AssetImage(
                            "assets/images/play.png",
                          ),
                          color: MyThemeData.primaryLight,
                        ))
                    : IconButton(
                        onPressed: () {
                          stopAudio();
                          selected = false;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.pause,
                          color: MyThemeData.primaryLight,
                          size: 30,
                        ))
                //ImageIcon(AssetImage("assets/images/next.png"),color: MyThemeData.primaryColor,)
              ],
            )
          ],
        ),
      ),
    );
  }

  void playAudio() async {
    QuranResponse? audioUrl = await ApiManager.fetchAudioUrl();
    List<Radios> url = audioUrl?.radios ?? [];
    audioPlayer.play(UrlSource(url[1].url ?? ""));
  }

  void stopAudio() {
    audioPlayer.stop();
  }
}
