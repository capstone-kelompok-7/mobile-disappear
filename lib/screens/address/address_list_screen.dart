import 'package:disappear/screens/address/add_new_address_screen.dart';
import 'package:disappear/screens/address/edit_old_address_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/address/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressListScreen extends StatefulWidget {
  static const String routePath = '/address-list-screen';
  const AddressListScreen({Key? key}) : super(key: key);

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  late AddressViewModel addressViewModel;
  int userId = 0;

  @override
  void initState() {
    super.initState();
    addressViewModel = Provider.of<AddressViewModel>(context, listen: false);
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('userId') ?? 0;

    addressViewModel.getAddresses(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        title: Text(
          'Alamat',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 32,
            color: whiteColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 26,
          right: 26,
          bottom: 15,
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FutureBuilder(
            future: addressViewModel.getAddresses(userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return ListView.builder(
                  itemCount: addressViewModel.addresses.length,
                  itemBuilder: (context, index) {
                    final selectedAddress = addressViewModel.addresses[index];
                    return Container(
                      margin: const EdgeInsets.only(
                        top: 15,
                        left: 25,
                        right: 25,
                      ),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: primary40),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      width: 340,
                      height: 135,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Alamat',
                                        style: semiBoldBody7,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      if (selectedAddress.isPrimary)
                                        Container(
                                          width: 51,
                                          height: 21,
                                          decoration: ShapeDecoration(
                                            color: primary40,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Utama',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    selectedAddress.acceptedName,
                                    style: semiBoldBody6,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${selectedAddress.phone} | ${selectedAddress.address}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: mediumBody8,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                addressViewModel.addressId = selectedAddress.id;
                                Navigator.of(context).pushNamed(
                                  EditOldAddressScreen.routePath,
                                  arguments: selectedAddress.id,
                                );
                              },
                              child: SvgPicture.asset(
                                'assets/img/editProfileButton.svg',
                                colorFilter: const ColorFilter.mode(
                                  primary40,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
