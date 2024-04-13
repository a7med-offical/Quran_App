import 'package:app/Constant.dart';
import 'package:app/Model/Soar_Model.dart';
import 'package:app/Pages/home_page.dart';
import 'package:app/Provider/Service_provider.dart';
import 'package:app/Services/Surahs_Service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:core';
import 'package:audioplayers/audioplayers.dart';

class SaouraDetails extends StatelessWidget {
  SaouraDetails(
      {super.key,
      required this.surahDetails,
      required this.enName,
      required this.arName,
      required this.revelationName});
  final String enName;
  final String arName;
  final String revelationName;

  final SoarModel surahDetails;
  Ayahs? ayah;
  @override
  AudioPlayer audioPlayer = AudioPlayer();

  Widget build(BuildContext context) {
    var Data = Provider.of<ServiceProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: !Data.isDark ? Colors.white : kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_outlined,
                          color: Data.isDark ? Colors.white : kPrimaryColor)),
                  Text(enName,
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                height: 300,
                decoration: BoxDecoration(
                    color: !Data.isDark ? Colors.white : kPrimaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Text(
                      enName,
                      style: TextStyle(
                          color: Data.isDark ? Colors.white : kPrimaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      arName,
                      style: TextStyle(
                          color: Data.isDark ? Colors.white : kPrimaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '$revelationName- ${surahDetails.ayahs.length} VERSES',
                      style: TextStyle(
                        color: Data.isDark ? Colors.white : kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.network(image),
                  ],
                ),
              ),
              FutureBuilder<List<SoarModel>>(
                  future: SuarhsService().getSuarhsData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.green),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('Empty Data');
                    } else {
                      return Expanded(
                          child: ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: surahDetails
                            .ayahs.length, // Use the length of ayahs list
                        itemBuilder: (context, index) {
                          if (index < surahDetails.ayahs.length) {
                            Ayahs ayah = surahDetails.ayahs[index];
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  // child: Card(
                                  //     color: !Data.isDark
                                  //         ? Colors.grey[200]
                                  //         : Colors.grey[200],
                                  //     child: Row(
                                  //       children: [
                                  //         index < surahDetails.ayahs.length
                                  //             ? CircleAvatar(
                                  //                 backgroundColor: Colors.green,
                                  //                 radius: 15,
                                  //                 child: Text('${index + 1}',
                                  //                     style: const TextStyle(
                                  //                         color: Colors.white)))
                                  //             : const SizedBox(),
                                  //         const Spacer(),
                                  //         const IconButton(
                                  //             onPressed: null,
                                  //             icon: Icon(
                                  //               Icons.share,
                                  //               size: 25,
                                  //               color: Colors.green,
                                  //             )),
                                  //         IconButton(
                                  //             onPressed: () async{
                                  //                    final player = AudioPlayer();
                                  //              await  player.play(UrlSource("${ayah.Audio}"));

                                  //             },
                                  //             icon: Icon(
                                  //               Icons.play_arrow_rounded,
                                  //               size: 30,
                                  //               color: Colors.green,
                                  //             )),
                                  //       ],
                                  //     )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                  child: Align(
                                    
                                    alignment: Alignment.center,
                                    child: Text(
                                      textDirection: TextDirection.rtl,
                                      ayah.text,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Data.isDark
                                              ? Colors.white
                                              : kPrimaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              
                              ],
                            );
                          } else {
                            return Container();
                          }
                        },
                      ));
                    }
                  }),
                  
                             Column(children: [   Text('صدق الله العظيم ',style: TextStyle(fontWeight:FontWeight.bold,color: kPrimaryColor,fontSize: 22),),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('Back',style: TextStyle(color:Colors.green,fontSize: 20,fontWeight: FontWeight.bold),))],)
            ],
          ),
        ),
      ),
    );
  }
}