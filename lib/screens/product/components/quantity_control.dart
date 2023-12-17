import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/product/add_to_cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuantityControl extends StatefulWidget {
  const QuantityControl({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuantityControlState createState() => _QuantityControlState();
}

class _QuantityControlState extends State<QuantityControl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: neutral20,
          width: 1,
        ),
      ),
      child: Consumer<AddToCartViewModel>(
        builder: (context, state, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => state.quantity--,
                child: const Icon(
                  Icons.remove,
                  size: 14,
                ),
              ),
              const SizedBox(width: 10,),
              Text(
                '${state.quantity}',
                style: semiBoldBody6,
              ),
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  if (state.quantity < state.product!.stock!.toInt()) {
                    state.quantity++;
                  }
                },
                child: const Icon(
                  Icons.add,
                  size: 14,
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}