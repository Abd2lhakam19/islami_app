import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/myThemeData.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {


  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {

  @override
  Widget build(BuildContext context) {
    var pro  = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          InkWell(
            onTap: (

                ){
              showModalBottomSheet(context: context, builder: (BuildContext){
                return Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
                          pro.changLanguge("en");
                        },
                        child: Row(
                          children: [
                            Text(AppLocalizations.of(context)!.engTitle,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: pro.languuageCode=="en"?MyThemeData.primaryColor:Colors.black
                            )),
                            Spacer(),
                            pro.languuageCode=="en"?Icon(Icons.check,color: MyThemeData.primaryColor,):SizedBox.shrink()
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: ()
                        {
                          pro.changLanguge("ar");
                        },
                        child: Row(
                          children: [
                            Text(AppLocalizations.of(context)!.arabicTitle,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: pro.languuageCode=="ar"?MyThemeData.primaryColor:Colors.black
                            )),
                            Spacer(),
                           pro.languuageCode=="ar"? Icon(Icons.check,color: MyThemeData.primaryColor,):SizedBox.shrink()
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height*0.16,
                  minWidth: MediaQuery.of(context).size.width
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(20),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(

                )
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(pro.languuageCode=="en"?AppLocalizations.of(context)!.engTitle:AppLocalizations.of(context)!.arabicTitle,style:Theme.of(context).textTheme.bodySmall ,),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              showModalBottomSheet(context: context, builder: (BuildContext){
                return Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Light",style: Theme.of(context).textTheme.bodySmall),
                          Spacer(),
                          Icon(Icons.check,color: MyThemeData.primaryColor,)
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text("Dark ",style: Theme.of(context).textTheme.bodySmall),
                          Spacer(),
                          Icon(Icons.check,color: MyThemeData.blackColor,)
                        ],
                      )
                    ],
                  ),
                );
              },
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height*0.16,
                    minWidth: MediaQuery.of(context).size.width
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(20),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(

                  )
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text("Theming",style:Theme.of(context).textTheme.bodySmall ,),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
