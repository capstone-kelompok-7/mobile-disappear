import 'dart:io';

import 'package:disappear/view_models/product_review/add_product_review_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({ super.key });

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  String? filename;

  void _pickFile() async {
    final addProductViewModel = Provider.of<AddProductReviewViewModel>(context, listen: false);

    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      addProductViewModel.files = result.files;
    }
    
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductReviewViewModel>(
      builder: (context, state, _) {
        if (state.files.isEmpty) {
          return GestureDetector(
            onTap: _pickFile,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)
              ),
              child: const Icon(Icons.add_a_photo),
            )
          );
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
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(state.files[index].path!),
                  fit: BoxFit.cover,
                ),
              );
            }

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)
              ),
              child: const Icon(Icons.add_a_photo),
            );
          },
        );
      }
    );
  }
}