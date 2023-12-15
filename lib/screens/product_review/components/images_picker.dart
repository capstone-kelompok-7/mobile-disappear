import 'dart:io';

import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/product_review/add_product_review_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  String? filename;

  void _pickFile() async {
    final addProductViewModel =
        Provider.of<AddProductReviewViewModel>(context, listen: false);

    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      addProductViewModel.files = result.files;
    }

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductReviewViewModel>(builder: (context, state, _) {
      if (state.files.isEmpty) {
        return GestureDetector(
            onTap: _pickFile,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo),
                    Text(
                      'Tambah Foto',
                      style: regularBody8,
                    ),
                  ],
                ),
              ),
            ));
      }

      return GridView.builder(
        shrinkWrap: true,
        itemCount: state.files.length + 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 100,
        ),
        itemBuilder: (context, index) {
          if (index < state.files.length) {
            return Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(state.files[index].path!),
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => state.removeFile(index),
                      icon: const Icon(
                        Icons.delete,
                        color: whiteColor,
                      ),
                    ))
              ],
            );
          }

          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            child: Column(
              children: [
                const Icon(Icons.add_a_photo),
              ],
            ),
          );
        },
      );
    });
  }
}
