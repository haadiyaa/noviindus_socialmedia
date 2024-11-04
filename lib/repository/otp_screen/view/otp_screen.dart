import 'package:flutter/material.dart';
import 'package:noviindus_machinetest/core/constants.dart';
import 'package:noviindus_machinetest/repository/home_screen/view/home_screen.dart';
import 'package:noviindus_machinetest/repository/otp_screen/widgets/customtextfield.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final TextEditingController country = TextEditingController(text: '+91');
  final TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.greyBG,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter Your\nMobile Number',
                style: TextStyle(color: Constants.white, fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Lorem ipsum dolor sit amet consectetur. Porta at id hac vitae. Et tortor at vehicula euismod mi viverra.',
                style: TextStyle(
                  color: Constants.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: globalKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomTextField(
                            controller: country,
                            text: '',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 6,
                          child: CustomTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your phone number';
                              }
                              return null;
                            },
                            controller: phone,
                            text: 'Enter your phone number',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        backgroundColor: Constants.grey,
                        foregroundColor: Constants.white,
                      ),
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Countinue'),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.red,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Constants.white,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
