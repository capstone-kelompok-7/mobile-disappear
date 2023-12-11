import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/cart/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatefulWidget {
  static const String routePath = '/wishlist';

  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    
    cartViewModel.getCart();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.5,
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 32,
        ),
        backgroundColor: primary40,
        title: Text(
          'Keranjang',
          style: semiBoldBody1.copyWith(
            color: whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: neutral00,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<CartViewModel>(
                  builder: (context, state, _) {
                    return Text(
                      '${state.selectedItems.length} produk dipilih',
                      style: regularBody7,
                    );
                  }
                ),
                Consumer<CartViewModel>(
                  builder: (context, state, _) {
                    return InkWell(
                      onTap: state.selectedItems.isNotEmpty ? state.removeSelectedItems : null,
                      child: const Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: primary40,
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
          Consumer<CartViewModel>(
            builder: (context, state, _) {
              if (state.isLoading) {
                  return const Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          color: primary40,
                          strokeWidth: 3,
                        ),
                      ),
                    ),
                  );
                }

                if (state.cart != null && state.cart!.cartItems.isNotEmpty) {
                  return ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(12),
                    itemCount: state.cart!.cartItems.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10,),
                    itemBuilder: (context, index) {
                      final cartItem = state.cart!.cartItems[index];

                      return Container(
                        width: double.infinity,
                        height: 100,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: primary40,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                value: state.selectedItems.contains(cartItem),
                                onChanged: (value) => state.toggleSelectedItem(value, cartItem),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (cartItem.product.productPhotos[0].url != '') {
                                      return Image.network(
                                        cartItem.product.productPhotos[0].url,
                                        width: 70,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      );
                                    }
                                    
                                    return Image.asset(
                                      'assets/img/totebeg_kanvas.png',
                                      width: 70,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    );
                                  }
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartItem.product.name,
                                      maxLines: 1,
                                      style: mediumBody6,
                                      overflow: TextOverflow.ellipsis
                                    ,),
                                    Text('${cartItem.gramPlastic} gram', style: regularBody8),
                                    Text(cartItem.formattedPrice, style: mediumBody6, overflow: TextOverflow.ellipsis,),
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: primary40),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () => state.reduceItemQuantity(cartItem),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                          child: Icon(
                                            Icons.remove,
                                            size: 16,
                                            color: primary40,
                                          ),
                                        ),
                                      ),
                                      Text(cartItem.quantity.toString(), style: semiBoldBody7),
                                      GestureDetector(
                                        onTap: () => state.addItemQuantity(cartItem),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                          child: Icon(
                                            Icons.add,
                                            size: 16,
                                            color: primary40,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                }

                return const Text('Tidak ada produk yang disimpan');
            }
          ),
        ],
      ),
    );
  }
}