import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ahadeth_details.dart';
import 'package:islami_app/myThemeData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';
import '../hadeth_model.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel>AllAhadeth = [];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    if(AllAhadeth.isEmpty) {
      loadHadethFile();
    }
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/ahadeth_image.png"),
          Divider(
            thickness: 2,
            color: MyThemeData.primaryLight,
          ),
          Text(
            AppLocalizations.of(context)!.hadeth_name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: provider.isDarkMode()?MyThemeData.whiteColor:MyThemeData.blackColor),
          ),
          Divider(
            thickness: 2,
            color: MyThemeData.primaryLight,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                indent: 40,
                endIndent: 40,
                color: MyThemeData.primaryLight,
              ),
              itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, AhadethDetails.routName,
                      arguments:HadethModel(AllAhadeth[index].title,AllAhadeth[index].content)  );
                },
                  child: Center(child: Text(AllAhadeth[index].title,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color:  provider.isDarkMode()?MyThemeData.whiteColor:MyThemeData.blackColor
                  ),)));
            },
            itemCount:AllAhadeth.length ,),
          )
        ],
      ),
    );
  }

  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> AhadethList = ahadeth.split("#");
      for (int i = 0; i < AhadethList.length; i++) {
        List<String> Hadeth = AhadethList[i].trim().split("\n");
        String title = Hadeth[0];
        Hadeth.removeAt(0);
        List<String> content = Hadeth;
        HadethModel hadethModel = HadethModel(title, content);
        AllAhadeth.add(hadethModel);
        setState(() {});
      }
    }).catchError((e){
      print(e);
    });
  }
}
