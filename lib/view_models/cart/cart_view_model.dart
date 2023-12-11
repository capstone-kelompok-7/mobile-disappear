import 'package:disappear/main.dart';
import 'package:disappear/models/cart/cart_model.dart';
import 'package:disappear/screens/cart/components/loading_dialog.dart';
import 'package:disappear/services/cart_service.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:intl/intl.dart';

class CartViewModel extends ChangeNotifier {
  Cart? _cart;

  set cart(Cart? cart) {
    _cart = cart;
    notifyListeners();
  }

  Cart? get cart => _cart;

  bool _isLoading = true;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  Future<void> getCart() async {
    final cartService = CartService();
    cart = await cartService.fetchCart();

    isLoading = false;
  }

  List<CartItem> _selectedItems = [];

  set selectedItems(List<CartItem> selectedItems) {
    _selectedItems = selectedItems;
    notifyListeners();
  }

  List<CartItem> get selectedItems => _selectedItems;

  void toggleSelectedItem(bool? checked, CartItem item) {
    if (checked == true) {
      selectedItems = [...selectedItems, item];
    } else {
      final selectedItemsClone = selectedItems;
      selectedItemsClone.removeWhere((element) => element == item);
      selectedItems = selectedItemsClone;
    }
  }

  // List<CartItem> modifiedQuantityCartItems = [];

  void addItemQuantity(CartItem cartItem) async {
    cartItem.quantity++;
    notifyListeners();
    
    final cartService = CartService();
    await cartService.addCartItemQuantity(cartItem.product.id);
  }

  void reduceItemQuantity(CartItem cartItem) async {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      notifyListeners();

      final cartService = CartService();
      await cartService.reduceCartItemQuantity(cartItem.cartItemId);
    }
  }

  void selectAllItems(bool? checked) {
    if (checked == true) {
      if (cart != null && cart!.cartItems.isNotEmpty) {
        selectedItems = cart!.cartItems;
      }
    } else {
      selectedItems = [];
    }
  }

  bool _isRemovingSelectedItems = false;

  set isRemovingSelectedItems(bool isRemovingSelectedItems) {
    _isRemovingSelectedItems = isRemovingSelectedItems;
    notifyListeners();
  }

  bool get isRemovingSelectedItems => _isRemovingSelectedItems;

  void removeSelectedItems() async {
    showDeletingSelectedItemsLoading();

    final cartService = CartService();

    await Future.wait(
      selectedItems
        .map((selectedItem) => cartService.removeCartItem(selectedItem.cartItemId))
        .toList()
    );
    
    Navigator.of(navigatorKey.currentContext!).pop();

    showDeletingSelectedItemsSuccessMessage();

    selectedItems = [];

    isLoading = true;

    getCart();
  }

  void showDeletingSelectedItemsLoading() {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => const LoadingDialog(),
    );
  }

  void showDeletingSelectedItemsSuccessMessage() async {
    await Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: const Color(0xffE3FFF1),
      messageColor: neutral40,
      borderColor: const Color(0xff04C800),
      borderWidth: 1,
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(5),
      message: 'Keranjang berhasil dihapus',
      duration: const Duration(seconds: 3),
    ).show(navigatorKey.currentContext!);
  }

  String get totalPrice {
    int price = 0;

    for (CartItem item in selectedItems) {
      price += (item.price * item.quantity);
    }

    var f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return f.format(price);
  }
}