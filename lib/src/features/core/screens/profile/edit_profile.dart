import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/models/users_model.dart';
import 'package:ez_grader/src/features/core/controllers/profile_controller.dart';
import 'package:ez_grader/src/features/core/models/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/image_string.dart';
import '../../../../constants/sizes.dart';
import '../../../authentication/screens/signup/validators/signup_validators.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: const AppBarWidget(
        title: tEditProfile,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tUpdateProfilePadding * 1.5),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UsersModel userData = snapshot.data as UsersModel;
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(
                                  image: AssetImage(tAvatarImage),
                                )),
                          ),
                          // Positioned(
                          //   bottom: 0,
                          //   right: 0,
                          //   child: GestureDetector(
                          //     onTap: () async {
                          //       ImagePicker imagePicker = ImagePicker();
                          //       XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                          //           print('pathhhhhhhhh ${file?.path}');
                          //       },
                          //     child: Container(
                          //       width: 30,
                          //       height: 30,
                          //       decoration: BoxDecoration(
                          //           borderRadius:
                          //           BorderRadius
                          //               .circular(100),
                          //           color: Colors.black
                          //               .withOpacity(0.1)),
                          //       child: const Icon(
                          //         LineAwesomeIcons.upload,
                          //         size: 20,
                          //         color: Colors.black,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: tDefaultSize + 20,
                      ),
                      Form(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width * 0.4,
                                child: TextFormField(
                                  initialValue: userData.first_name,
                                  style: Theme.of(context).textTheme.headlineSmall,
                                  decoration: InputDecoration(
                                    label: Text(
                                      tFirstName,
                                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.person_outline_rounded,
                                    ),
                                    hintText: tFirstName,
                                    hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                                    errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
                                  ),
                                  validator: (value) => SignUpValidators.validateName(value, tFirstName),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.4,
                                child: TextFormField(
                                  initialValue: userData.last_name,
                                  style: Theme.of(context).textTheme.headlineSmall,
                                  decoration: InputDecoration(
                                    label: Text(
                                      tLastName,
                                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.person_outline_rounded,
                                    ),
                                    hintText: tLastName,
                                    hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                                    errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
                                  ),
                                  validator: (value) => SignUpValidators.validateName(value, tLastName),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: tFormHeight - 10),
                          TextFormField(
                            initialValue: userData.email,
                            style: Theme.of(context).textTheme.headlineSmall,
                            decoration: InputDecoration(
                              label: Text(
                                tEmail,
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                              ),
                              hintText: tEmail,
                              hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                              errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
                            ),
                            validator: (value) => SignUpValidators.validateEmail(value),
                          ),
                          const SizedBox(height: tFormHeight - 10),
                          TextFormField(
                            initialValue: userData.phone,
                            style: Theme.of(context).textTheme.headlineSmall,
                            decoration: InputDecoration(
                              label: Text(
                                tPhoneNumber,
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              prefixIcon: const Icon(
                                Icons.phone,
                              ),
                              hintText: tPhoneNumber,
                              hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                              errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) => SignUpValidators.validatePhoneNumber(value),
                          ),
                          const SizedBox(height: tFormHeight - 10),
                          TextFormField(
                            initialValue: userData.password,
                            style: Theme.of(context).textTheme.headlineSmall,
                            obscureText: true,
                            decoration: InputDecoration(
                              label: Text(
                                tPassword,
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                              ),
                              hintText: tPassword,
                              hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                              errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
                            ),
                            validator: (value) => SignUpValidators.validatePassword(value),
                          ),
                          const SizedBox(height: tFormHeight - 10),
                          TextFormField(
                            style: Theme.of(context).textTheme.headlineSmall,
                            obscureText: true,
                            decoration: InputDecoration(
                              label: Text(
                                tConfirmPassword,
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                              ),
                              hintText: tConfirmPassword,
                              hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                              errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
                            ),
                          ),
                          const SizedBox(
                            height: tFormHeight,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15), shape: const StadiumBorder()),
                              child: Text(
                                tEditSave.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: tFormHeight,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(0), backgroundColor: Colors.red.withOpacity(0.2), foregroundColor: Colors.red, shape: const StadiumBorder(), side: BorderSide.none),
                              child: const Text(
                                tDelete,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text('Something went wrong!'),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.red,),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
