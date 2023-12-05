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
  void initState() {
    final provider = Provider.of<AddToCartViewModel>(context, listen: false);
    
    provider.addListener(_successListener);

    super.initState();
  }

  void _successListener() {
    if (mounted && context.mounted) {
      final provider = Provider.of<AddToCartViewModel>(context, listen: false);
      
      if (provider.isSuccess == true) {
        _showSuccessMessage();
      }

      if (provider.isSuccess == false) {
        _showFailedMessage();
      }

      provider.isSuccess = null;
    }
  }

  void _showSuccessMessage() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AddToCartSuccessDialog()
    );
  }

  void _showFailedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Gagal menambah produk ke keranjang'))
    );
  }

  @override
  void dispose() {
    if (mounted && context.mounted) {
      final provider = Provider.of<AddToCartViewModel>(context, listen: false);
      provider.removeListener(_successListener);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
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
                      state.product!.thumbnail!.imageUrl,
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
                        state.product!.name,
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
                  minimumSize: const Size(double.infinity, 30),
                  padding: const EdgeInsets.all(10)
                ),
                child: state.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
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