import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class GeminiService extends GetxService {
  final String apiKey = "AIzaSyB6S37AGbquyNYS76ZbxISkueJdXftqWvQ"; // Replace with your actual API key

  Future<String> summarizeText(String input) async {
    final url = Uri.parse("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "contents": [
          {
            "role": "user",
            "parts": [{"text": "Summarize this: $input"}]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['candidates'][0]['content']['parts'][0]['text'].trim();
    } else {
      return "Error: ${response.statusCode}";
    }
  }
}
