import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/theme_custom.dart';
import 'package:flutter_practice/utils.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

class TextFieldValidation extends StatefulWidget {
  const TextFieldValidation({Key? key}) : super(key: key);

  @override
  State<TextFieldValidation> createState() => _TextFieldValidationState();
}

class _TextFieldValidationState extends State<TextFieldValidation> {
  final _formKey = GlobalKey<FormState>();
  CroppedFile? imageFile;

  @override
  Widget build(BuildContext context) {
    final quantityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onDoubleTap: () async {
                  await cropImage();
                },
                child: SizedBox(
                  height: 250,
                  width: 300,
                  child: imageFile == null
                      ? Image.asset(
                          'assets/editor.png',
                          fit: BoxFit.contain,
                        )
                      : _image(),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              //Form with a text and a button
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                controller: quantityController,
                // decoration: const InputDecoration(
                //     labelText: 'Cantidad', border: OutlineInputBorder()),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'No puede estar vacio';
                  }
                  if (text.length < 2) {
                    return 'Demasiado corto';
                  }

                  return null;
                },
                // update the state variable when the text changes
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    showModalBottomSheet(
                        backgroundColor: ThemeCustom.primarySwatch,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        )),
                        context: context,
                        builder: (context) {
                          return CustomModal(
                            quantity: quantityController.text.toString(),
                          );
                        });
                  }
                },
                child: const Text(
                  'Aceptar',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> cropImage() async {
    await Utils.selectImage().then((selectedFile) async {
      if (selectedFile == null) return;
      await Utils.cropSelectedImage(selectedFile.path).then((value) {
        Utils.showSnackbar();
        setState(() {
          imageFile = value;
        });
      });
    });
  }

  Widget _image() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;

    if (imageFile != null) {
      final path = imageFile!.path;
      return Container(
        color: Colors.transparent,
        constraints: BoxConstraints(
          maxWidth: 0.5 * screenWidth,
          maxHeight: 0.5 * screenHeigth,
        ),
        child: Image.file(
          File(path),
          //fit: BoxFit.contain,
        ),
      );
    } else {
      return Container();
    }
  }
}

class CustomModal extends StatelessWidget {
  const CustomModal({Key? key, required this.quantity}) : super(key: key);
  final String quantity;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Movimiento',
              style: TextStyleCustom.regular20(),
            ),
            const SizedBox(
              height: 20,
            ),
            //Form with a text and a button
            TextFormField(
              initialValue: quantity,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              //controller: quantityController,
              decoration: const InputDecoration(
                  labelText: 'Cantidad', border: OutlineInputBorder()),

              // update the state variable when the text changes
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Utils.showSnackbar();
              },
              child: const Text(
                'Aceptar',
              ),
            )
          ],
        ),
      ),
    );
  }
}
