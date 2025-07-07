import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';
import '../controllers/contact_controller.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Get.find<NavController>();
    final contact = Get.put(ContactController());
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      key: nav.sectionKeys['contact'],
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Contact Me", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isMobile ? 400 : 600),
            child: Form(
              key: contact.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: contact.nameController,
                    decoration: const InputDecoration(labelText: "Your Name"),
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  TextFormField(
                    controller: contact.emailController,
                    decoration: const InputDecoration(labelText: "Your Email"),
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  TextFormField(
                    controller: contact.messageController,
                    decoration: const InputDecoration(labelText: "Your Message"),
                    maxLines: 5,
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 20),
                  Obx(() => ElevatedButton(
                    onPressed: (){
                      try{
                        if(contact.formKey.currentState!.validate()){
                          contact.sendEmail();
                          contact.isLoading.value=false;
                        }
                      } catch(e){
                        Get.showSnackbar(GetSnackBar(
                          title: 'Failed to Send Email $e',
                        ));
                      }
                    },
                    child: contact.isLoading.value
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : const Text("Send"),

                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
