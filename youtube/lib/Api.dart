import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyDdSv8lCBh_HTubxj_uO-T5CX22OLPqBzE";
const ID_CANAL_YOUTUBE = "UCwXdFgeE9KYzlDdR7TG9cMw";
const URL_BASE_YOUTUBE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {

    http.Response response = await http.get(
      URL_BASE_YOUTUBE+"search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&channelId=$ID_CANAL_YOUTUBE"
          "&key=$CHAVE_YOUTUBE_API"
          "&q=$pesquisa"
    );

    if(response.statusCode == 200){
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();
      return videos;
    }else{

    }

  }
}