import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/api/quran_reponse/quran_response.dart';

class ApiManager {
 static Future<QuranResponse?> fetchAudioUrl() async {
   try {
     final response = await http.get(Uri.parse('https://mp3quran.net/api/v3/radios'));
     if (response.statusCode == 200) {
       var bodyString = response.body;
       var json = jsonDecode(bodyString);
       return QuranResponse.fromJson(json);
     } else {
       print('Failed to fetch audio URL: ${response.statusCode}');
       return null;
     }
   } catch (error) {
     print('Error fetching audio URL: $error');
     return null;
   }
 }

}