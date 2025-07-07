import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  Future<void> sendEmail() async {
    isLoading.value = true;

    const serviceId = 'service_lp3xfmn';       // 🔁 Replace with your actual ID
    const templateId = 'template_pdon9qm';     // 🔁 Replace with your actual ID
    const userId = 'JQ1AdaeI3unv3vY2a';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'name': nameController.text,
            'email': emailController.text,
            'message': messageController.text,
            'title': "New Contact on Portfolio"
          },
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Email sent successfully!");
        nameController.clear();
        emailController.clear();
        messageController.clear();
      } else {
        Get.snackbar("Error", "Failed to send email: ${response.body}");
      }
    } catch (e) {
      Get.snackbar("Exception", "Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
