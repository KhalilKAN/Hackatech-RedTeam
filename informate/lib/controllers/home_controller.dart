import 'dart:convert';

import 'package:get/get.dart';
import 'package:informate/models/construction.dart';
import 'package:informate/models/institution.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Future<List<Institution>> getInstitutionsWithBraille() async {
    List<Institution> institutions = [];
    String url = 'http://10.0.2.2:4000/points?cat=instituciones&filter=braille';
    var resp = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'accept': 'application/json',
    });
    if (resp.statusCode == 200) {
      final jsonData = json.decode(utf8.decode(resp.bodyBytes));

      for (int i = 0; i <= jsonData.length - 1; i++) {
        Institution inst = Institution(
            nombre: jsonData[i]["nombre"],
            direccion: jsonData[i]["direccion"],
            lat: jsonData[i]["latitud"],
            lng: jsonData[i]["longitud"],
            tipo: jsonData[i]["tipo"]);
        institutions.add(inst);
      }

      String url2 =
          'http://10.0.2.2:4000/points?cat=instituciones&filter=señas';
      var resp2 = await http.get(Uri.parse(url2), headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
      });

      if (resp2.statusCode == 200) {
        final jsonData2 = json.decode(utf8.decode(resp.bodyBytes));
        for (int i = 0; i <= jsonData2.length - 1; i++) {
          Institution inst = Institution(
              nombre: jsonData2[i]["nombre"],
              direccion: jsonData2[i]["direccion"],
              lat: jsonData2[i]["latitud"],
              lng: jsonData2[i]["longitud"],
              tipo: jsonData2[i]["tipo"]);
          institutions.add(inst);
        }
      }
    }
    return institutions;
  }

  Future<List<Institution>> getInstitutionsWithLanguage() async {
    List<Institution> institutions = [];
    String url = 'http://10.0.2.2:4000/points?cat=instituciones&filter=señas';
    var resp = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'accept': 'application/json',
    });
    if (resp.statusCode == 200) {
      final jsonData = json.decode(utf8.decode(resp.bodyBytes));

      for (int i = 0; i <= jsonData.length - 1; i++) {
        Institution inst = Institution(
            nombre: jsonData[i]["nombre"],
            direccion: jsonData[i]["direccion"],
            lat: jsonData[i]["latitud"],
            lng: jsonData[i]["longitud"],
            tipo: jsonData[i]["tipo"]);
        institutions.add(inst);
      }
    }
    update();
    return institutions;
  }

  Future<List<Construction>> getPointsObras() async {
    String url = 'http://10.0.2.2:4000/points?cat=obras';

    var resp = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'accept': 'application/json',
    });
    List<Construction> constructions = [];
    if (resp.statusCode == 200) {
      final jsonData = json.decode(utf8.decode(resp.bodyBytes));
      for (int i = 0; i <= jsonData.length - 1; i++) {
        List<double> pointsConstr = [];
        pointsConstr.add(jsonData[i]["punto1"]["latitud"]);
        pointsConstr.add(jsonData[i]["punto1"]["longitud"]);
        pointsConstr.add(jsonData[i]["punto2"]["latitud"]);
        pointsConstr.add(jsonData[i]["punto2"]["longitud"]);
        Construction constr = Construction(
          points: pointsConstr,
          calle: jsonData[i]["calle"],
          tipo_obra: jsonData[i]["tipo_obra"],
        );
        constructions.add(constr);
        print(jsonData[i].toString());
      }
    }

    return constructions;
  }
}
