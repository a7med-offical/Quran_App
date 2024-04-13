import 'dart:convert';

import 'package:app/Model/Soar_Model.dart';
import 'package:http/http.dart' as http;

class SuarhsService {
  Future<List<SoarModel>> getSuarhsData() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.alquran.cloud/v1/quran/ar.alafasy'));

      Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        List<dynamic> sauraList = data['data']['surahs'];

        List<SoarModel> surahModels = [];

        for (var saura in sauraList) {
          surahModels.add(SoarModel.fromJson(saura));

          
        }
       
        print('Sucessfull');

        return surahModels;
      } else {
        throw Exception('Error on status  code  ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error $error');
    }

  }
  
}
