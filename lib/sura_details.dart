import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/myThemeData.dart';
import 'package:islami_app/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routName = "suraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(
      children: [
        Image.asset("assets/images/background.png"),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  color: MyThemeData.primaryColor,
                  width: 2
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    indent: 40,
                    endIndent: 40,
                    thickness: 1,
                    color: MyThemeData.primaryColor,
                  ),
                  itemBuilder: (context, index) {
                    return Center(
                        child: Text(verses[index],style: Theme.of(context).textTheme.bodySmall,textAlign: TextAlign.center,));
                  },
                  itemCount: verses.length,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  loadFile(int index) async {
    String file = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> liens = file.split("\n");
    verses = liens;
    setState(() {});
  }
}
