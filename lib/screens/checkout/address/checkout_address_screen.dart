import 'package:disappear/screens/address/add_new_address_screen.dart';
import 'package:disappear/screens/checkout/address/components/checkout_address_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/checkout/checkout_address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_edge_listener/scroll_edge_listener.dart';

class CheckoutAddressScreen extends StatefulWidget {
  static const String routePath = '/checkout-address-screen';

  const CheckoutAddressScreen({super.key});

  @override
  State<CheckoutAddressScreen> createState() => _CheckoutAddressScreenState();
}

class _CheckoutAddressScreenState extends State<CheckoutAddressScreen> {
  @override
  void initState() {
    final checkoutAddressViewModel = Provider.of<CheckoutAddressViewModel>(context, listen: false);

    checkoutAddressViewModel.addressFuture ??= checkoutAddressViewModel.getAddress();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutAddressViewModel>(
      builder: (context, state, _) {
        return ScrollEdgeListener(
            edge: ScrollEdge.end,
            edgeOffset: 100,
            continuous: false,
            debounce: const Duration(milliseconds: 500),
            listener: state.addAddress,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: primary40,
                leading: IconButton(
                  icon: const Icon(Icons.keyboard_arrow_left, size: 32, color: whiteColor,),
                  onPressed: () => Navigator.of(context).pop(),
                ), 
                title: Text('Alamat', style: semiBoldBody1.copyWith(color: whiteColor),),
                centerTitle: true,
              ),
              body: Builder(
                builder: (context) {
                  if (state.isLoading) {
                    return const Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          color: primary40,
                          strokeWidth: 3,
                        ),
                      ),
                    );
                  }

                  if (state.addresses.isNotEmpty) {
                    return Column(
                      children: [
                        ListView.separated(
                          padding: const EdgeInsets.all(10),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.addresses.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 10,),
                          itemBuilder: (context, index) => CheckoutAddressItem(address: state.addresses[index])
                        ),
                        const SizedBox(height: 20,),
                        Visibility(
                          visible: state.isAddingMoreAddress,
                          child: const Center(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                color: primary40,
                                strokeWidth: 3,
                              ),
                            ),
                          )
                        )
                      ],
                    );
                  }

                  return const Center(child: Text('Kamu belum punya alamat untuk dipakai'));
                }
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(
                  left: 26,
                  right: 26,
                  bottom: 15,
                  top: 15,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AddNewAddresScreen.routePath);
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(primary30),
                    minimumSize:
                        MaterialStateProperty.all(const Size(double.infinity, 41)),
                  ),
                  child: const Text(
                    'Tambah Alamat',
                    style: semiBoldBody6,
                  ),
                ),
              ),
            ),
        );
      }
    );
  }
}