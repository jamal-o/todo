// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/feat/auth/presentation/home_page.dart';
import 'package:todo/src/feat/auth/presentation/sign_in_page_provider.dart';
import 'package:todo/src/feat/auth/presentation/widgets/reactive_text_field.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(signInPageProvider.select((value) {
      return value.isloading;
    }));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sign In Page"),

              SizedBox(
                height: 20,
              ),

              ReactiveTextField(
                  label: "Email",
                  onChanged: (value) {
                    ref.read(signInPageProvider.notifier).setEmail(value);
                  }),

              SizedBox(
                height: 20,
              ),
              ReactiveTextField(
                  label: "Password",
                  onChanged: (value) {
                    ref.read(signInPageProvider.notifier).setPassword(value);
                  }),

              SizedBox(
                height: 20,
              ),
              //sign in Button
              ElevatedButton(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Sign In"),
                onPressed: () async {
                  try {
                    final response =
                        await ref.read(signInPageProvider.notifier).login();

                    if (response != null && response.success) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response!.message)));
                    }
                  } catch (e) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UIResponse {
  final bool success;
  final String message;

  UIResponse(this.success, this.message);
}
