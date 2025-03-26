import 'package:get/get.dart';

class SummarizerViewModel extends GetxController {
  var inputText = ''.obs;
  var summary = ''.obs;
  var isLoading = false.obs;

  void summarizeText() {
    if (inputText.value.isEmpty) return;
    isLoading.value = true;

    // Simulate AI response (replace with API call later)
    Future.delayed(Duration(seconds: 2), () {
      summary.value = "This is a summarized version of: ${inputText.value}";
      isLoading.value = false;
    });
  }
}