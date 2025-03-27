import 'package:get/get.dart';

import '../../core/services/gemini_service.dart';

class SummarizerViewModel extends GetxController {
  var inputText = ''.obs;
  var summary = ''.obs;
  var isLoading = false.obs;

  final GeminiService _geminiService = Get.put(GeminiService());

  Future<void> summarizeText() async {
    if (inputText.value.isEmpty) return;
    isLoading.value = true;

    final result = await _geminiService.summarizeText(inputText.value);

    // Simulate AI response (replace with API call later)
    Future.delayed(Duration(seconds: 2), () {
      summary.value = result;
      isLoading.value = false;
    });
  }
}