import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/summarizer_viewmodel.dart';

class SummarizerView extends StatelessWidget {
  final SummarizerViewModel controller = Get.put(SummarizerViewModel());

  SummarizerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Smart Notes Summarizer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => controller.inputText.value = value,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter text to summarize...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: controller.summarizeText,
              child: Text('Summarize'),
            )),
            SizedBox(height: 20),
            Obx(() => Text(
              controller.summary.value,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
}
