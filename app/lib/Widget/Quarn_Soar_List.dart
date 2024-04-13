// ignore_for_file: must_be_immutable

import 'dart:js';
import 'package:app/Constant.dart';
import 'package:provider/provider.dart';
import 'package:app/Model/Soar_Model.dart';
import 'package:app/Pages/Soaura_Details.dart';
import 'package:app/Provider/Service_provider.dart';
import 'package:app/Services/Surahs_Service.dart';
import 'package:flutter/material.dart';

class QuranSourList extends StatelessWidget {
  QuranSourList({
    super.key,
  });
  SoarModel? surahDetails;
  List<SoarModel>? surahs;
  Ayahs ? aa;
  @override
  Widget build(BuildContext context) {
    var Data = Provider.of<ServiceProvider>(context);
    return FutureBuilder<List<SoarModel>>(
        future: SuarhsService().getSuarhsData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green,),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('Empty Data');
          } else {
            List<SoarModel> filteredList = snapshot.data!
                .where((model) =>
                    model.name
                        .toLowerCase()
                        .contains(Data.searchQuery.toLowerCase()) ||
                    model.enName
                        .toLowerCase()
                        .contains(Data.searchQuery.toLowerCase()))
                .toList();
            return Expanded(
              child: ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    SoarModel model = filteredList[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SaouraDetails(
                                enName: model.enName,
                                arName: model.name,
                                revelationName: model.revelationName,
                                surahDetails: model);
                          }));
                        },
                        child: ListTile(
                          leading: const Icon(
                            Icons.brightness_high_outlined,
                            color: Colors.green,
                            size: 35,
                          ),
                          title: Text(
                            model.enName,
                            style:  TextStyle(
                                color: Data.isDark ?Colors.white:kPrimaryColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 20),
                          ),
                          subtitle: Text(
                            '${model.revelationName}-${model.ayahs.length}',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            model.name,
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
          // ignore: curly_braces_in_flow_control_structures
        });
  }
}
