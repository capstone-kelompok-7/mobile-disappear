import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/cart/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const String routePath = '/cart';

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    
    cartViewModel.getCart();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: primary40,
      leading: IconButton(
        icon: const Icon(Icons.keyboard_arrow_left, size: 32, color: whiteColor,),
        onPressed: () => Navigator.of(context).pop(),
      ), 
      title: Text('Keranjang', style: semiBoldBody1.copyWith(color: whiteColor),),
      centerTitle: true,
    );

    return Consumer<CartViewModel>(
      builder: (context, state, _) {
        if (state.isLoading) {
          return Scaffold(
            appBar: appBar,
            body: const Expanded(
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
            )
          );
        }

        if (state.cart != null && state.cart!.cartItems.isNotEmpty) {
          return Scaffold(
            appBar: appBar,
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
                      Text(
                        '${state.selectedItems.length} produk dipilih',
                        style: regularBody7,
                      ),
                      InkWell(
                        onTap: state.selectedItems.isNotEmpty ? state.removeSelectedItems : null,
                        child: const Icon(
                          Icons.delete_outline,
                          size: 20,
                          color: primary40,
                        ),
                      )
                    ],
                  ),
                ),
                ListView.separated(
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
                ),
                const SizedBox(height: 70,),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    padding: const EdgeInsets.only(right: 15),
                    decoration: const BoxDecoration(color: neutral00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                          value: state.selectedItems.length == state.cart?.cartItems.length,
                          onChanged: state.selectAllItems
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Spacer(),
                            const Text('Total', style: mediumBody7,),
                            const SizedBox(height: 3,),
                            Text(state.totalPrice, style: boldBody6,),
                            const Spacer(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.selectedItems.isNotEmpty ? () {} : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary30,
                        shape: const BeveledRectangleBorder(),
                      ),
                      child: const Text('Lanjutkan', style: semiBoldBody6,)
                    ),
                  ),
                )
              ],
            ),
          );
        }

        return Scaffold(
          appBar: appBar,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/img/EmptyCart.svg', width: 200, height: 200,),
                const SizedBox(height: 40,),
                const Text('Oops.. Keranjang masih kosong, nih.', style: mediumBody3, textAlign: TextAlign.center,)
              ],
            ),
          )
        );
      },
    );
  }
}