import 'package:disappear/screens/search_product/components/filter.dart';
import 'package:disappear/screens/search_product/components/placeholders/products_placeholder.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/search_product/filter_view_model.dart';
import 'package:disappear/view_models/search_product/search_field_view_model.dart';
import 'package:disappear/view_models/search_product/search_products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  static const String routePath = '/search-products';

  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void _showFilterBottomDialog() {
    final searchFieldViewModel = Provider.of<SearchFieldViewModel>(context, listen: false);
    final searchProductsViewModel = Provider.of<SearchProductViewModel>(context, listen: false);
    final filterViewModel = Provider.of<FilterViewModel>(context, listen: false);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Filter();
      },
    )
    .whenComplete(() {
      searchProductsViewModel.getProducts(searchFieldViewModel.keyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 48,
              child: ListView(
                padding: const EdgeInsets.only(top: 20),
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 20,),
                  const Icon(
                    Icons.filter_alt,
                    size: 24,
                    color: primary40,
                  ),
                  const SizedBox(width: 10,),
                  Consumer3<
                    FilterViewModel,
                    SearchProductViewModel,
                    SearchFieldViewModel
                  >(
                    builder: (context, filterState, searchProductState, searchFieldState, _) {
                      return GestureDetector(
                        onTap: () {
                          filterState.withPromo = !filterState.withPromo;
                          searchProductState.getProducts(searchFieldState.keyword);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                          decoration: BoxDecoration(
                            color: filterState.withPromo ? primary40 : primary00,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Text('Promo', style: regularBody6.copyWith(color: filterState.withPromo ? whiteColor : blackColor),),
                        ),
                      );
                    }
                  ),
                  const SizedBox(width: 10,),
                  Consumer<FilterViewModel>(
                    builder: (context, state, _) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                        decoration: BoxDecoration(
                          color: state.selectedFilter != 0 ? primary40 : primary00,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        constraints: const BoxConstraints(minWidth: 200),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: _showFilterBottomDialog,
                              child: Builder(
                                builder: (context) {
                                  if (state.selectedFilter == 1) {
                                    return Text('Abjad', style: regularBody6.copyWith(color: state.selectedFilter != 0 ? whiteColor : blackColor),);
                                  }
                        
                                  if (state.selectedFilter == 2) {
                                    return Text('Terbaru', style: regularBody6.copyWith(color: state.selectedFilter != 0 ? whiteColor : blackColor),);
                                  }
                        
                                  if (state.selectedFilter == 3) {
                                    return Text('Termahal', style: regularBody6.copyWith(color: state.selectedFilter != 0 ? whiteColor : blackColor),);
                                  }
                        
                                  if (state.selectedFilter == 4) {
                                    return Text('Termurah', style: regularBody6.copyWith(color: state.selectedFilter != 0 ? whiteColor : blackColor),);
                                  }
                        
                                  return Text('Urutkan berdasarkan', style: regularBody6.copyWith(color: blackColor),);
                                }
                              ),
                            ),
                            GestureDetector(
                              onTap: () => state.isAsc = !state.isAsc,
                              child: Icon(
                                state.isAsc ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                                size: 16,
                                color: state.selectedFilter != 0 ? whiteColor : blackColor
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  ),
                  const SizedBox(width: 20,),
                ],
              ),
            ),
            Consumer<SearchProductViewModel>(
              builder: (context, state, _) {
                return Visibility(
                  visible: !state.isSearching && state.products.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text('${state.products.length} produk berhasil ditemukan'),
                  ),
                );
              }
            )
          ],
        ),
        Consumer<SearchProductViewModel>(
          builder: (context, state, _) {
            if (state.isSearching) {
              return const ProductsPlaceholder();
            }

            if (state.products.isNotEmpty) {
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.products.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 280,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        children: [
                          Image.network(
                            state.products[index].thumbnail!.imageUrl,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.products[index].name,
                                  style: regularBody7,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 3,),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: state.products[index].rating >= 1 ? Colors.orange : neutral00
                                    ),
                                    const SizedBox(width: 2,),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: state.products[index].rating >= 2 ? Colors.orange : neutral00
                                    ),
                                    const SizedBox(width: 2,),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: state.products[index].rating >= 3 ? Colors.orange : neutral00
                                    ),
                                    const SizedBox(width: 2,),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: state.products[index].rating >= 4 ? Colors.orange : neutral00
                                    ),
                                    const SizedBox(width: 2,),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: state.products[index].rating >= 5 ? Colors.orange : neutral00
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3,),
                                Text(
                                  state.products[index].formattedPrice,
                                  style: regularBody7,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(child: Text('Tidak ada produk ditemukan'));
          }
        )
      ],
    );
  }
}