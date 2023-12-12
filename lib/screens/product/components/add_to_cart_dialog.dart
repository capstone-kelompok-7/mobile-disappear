import 'package:disappear/screens/product/components/add_to_cart_success_dialog.dart';
import 'package:disappear/screens/product/components/quantity_control.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/product/add_to_cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartDialog extends StatefulWidget {
  const AddToCartDialog({super.key});

  @override
  State<AddToCartDialog> createState() => _AddToCartDialogState();
}

class _AddToCartDialogState extends State<AddToCartDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Consumer<AddToCartViewModel>(
                  builder: (context, state, _) {
                    return Image.network(
                      state.product!.thumbnail != null
                        ? state.product!.thumbnail!.imageUrl
                        : 'https://picsum.photos/130/130',
                      width: 130,
                      height: 130,
                      fit: BoxFit.fitHeight,
                    );
                  }
                ),
              ),
              const SizedBox(width: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<AddToCartViewModel>(
                    builder: (context, state, _) {
                      return Text(
                        state.product!.name!,
                        style: semiBoldBody5,
                      );
                    }
                  ),
                  const SizedBox(height: 8),
                  Consumer<AddToCartViewModel>(
                    builder: (context, state, _) {
                      return Text(
                        'Stock : ${state.product!.stock}',
                        style: regularBody6,
                      );
                    }
                  ),
                  const SizedBox(height: 14),
                  const QuantityControl()
                ],
              )
            ],
          ),
          const SizedBox(height: 10,),
          Consumer<AddToCartViewModel>(
            builder: (context, state, _) {
              return ElevatedButton(
                onPressed: state.isLoading ? null : state.addProductToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary30,
                  minimumSize: const Size(double.infinity, 40),
                  padding: const EdgeInsets.all(10)
                ),
                child: state.isLoading
                  ? const SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(
                        color: whiteColor,
                        strokeWidth: 3,
                      ),
                    )
                  : const Text(
                      'Masukkan Keranjang',
                      style: semiBoldBody6
                    ),
              );
            }
          ),
        ],
      ),
    );
  }
}