import 'package:disappear/screens/product/product_screen.dart';
import 'package:disappear/screens/search_product/components/products_filter.dart';
import 'package:disappear/screens/search_product/components/placeholders/products_placeholder.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/product/product_view_model.dart';
import 'package:disappear/view_models/search_product/filter_view_model.dart';
import 'package:disappear/view_models/search_product/search_field_view_model.dart';
import 'package:disappear/view_models/search_product/search_products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_edge_listener/scroll_edge_listener.dart';

class ProductsScreen extends StatefulWidget {
  static const String routePath = '/search-products';

  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    final filterViewModel = Provider.of<FilterViewModel>(context, listen: false);

    filterViewModel.addListener(_getProducts);

    super.initState();
  }

  void _getProducts() {
    if (mounted && context.mounted) {
      final searchFieldViewModel = Provider.of<SearchFieldViewModel>(context, listen: false);
      final searchProductViewModel = Provider.of<SearchProductViewModel>(context, listen: false);
      final filterViewModel = Provider.of<FilterViewModel>(context, listen: false);
      
      searchProductViewModel.getProducts(
        keyword: searchFieldViewModel.keyword,
        withPromo: filterViewModel.withPromo,
        filterType: filterViewModel.selectedFilter,
      );
    }
  }

  void _getMoreProducts() {
    final searchFieldViewModel = Provider.of<SearchFieldViewModel>(context, listen: false);
    final searchProductViewModel = Provider.of<SearchProductViewModel>(context, listen: false);
    final filterViewModel = Provider.of<FilterViewModel>(context, listen: false);
    
    searchProductViewModel.getMoreProducts(
      keyword: searchFieldViewModel.keyword,
      withPromo: filterViewModel.withPromo,
      filterType: filterViewModel.selectedFilter,
    );
  }

  void _goToDetailProductScreen(int id) {
    final productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    productViewModel.productId = id;

    Navigator.pushNamed(context, ProductScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool isPopped) {
        if (isPopped) {
          final searchProductViewModel = Provider.of<SearchProductViewModel>(context, listen: false);
          searchProductViewModel.products = [];
        }
      },
      child: ScrollEdgeListener(
        edge: ScrollEdge.end,
        edgeOffset: 100,
        continuous: false,
        debounce: const Duration(milliseconds: 500),
        listener: _getMoreProducts,
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Filter(),
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
                if (state.products.isNotEmpty) {
                  return GridView.builder(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.products.length,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 280,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _goToDetailProductScreen(state.products[index].id),
                        child: Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Column(
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (state.products[index].thumbnail != null) {
                                      return Image.network(
                                        state.products[index].thumbnail!.imageUrl,
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      );
                                    }
                        
                                    return Image.asset(
                                      'assets/img/alat_makan.png',
                                      fit: BoxFit.cover,
                                      width: 200,
                                      height: 200,
                                    );
                                  }
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
                                            color: state.products[index].rating >= 1 ? warning20 : neutral20
                                          ),
                                          const SizedBox(width: 2,),
                                          Icon(
                                            Icons.star,
                                            size: 16,
                                            color: state.products[index].rating >= 2 ? warning20 : neutral20
                                          ),
                                          const SizedBox(width: 2,),
                                          Icon(
                                            Icons.star,
                                            size: 16,
                                            color: state.products[index].rating >= 3 ? warning20 : neutral20
                                          ),
                                          const SizedBox(width: 2,),
                                          Icon(
                                            Icons.star,
                                            size: 16,
                                            color: state.products[index].rating >= 4 ? warning20 : neutral20
                                          ),
                                          const SizedBox(width: 2,),
                                          Icon(
                                            Icons.star,
                                            size: 16,
                                            color: state.products[index].rating >= 5 ? warning20 : neutral20
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
                        ),
                      );
                    },
                  );
                }
      
                if (!state.isSearching) {
                  return const Column(
                    children: [
                      SizedBox(height: 200,),
                      Text('Produk tidak ditemukan')
                    ],
                  );
                }
      
                return const SizedBox.shrink();
              }
            ),
            Consumer<SearchProductViewModel>(
              builder: (context, state, _) {
                if (state.isSearching) {
                  if (state.page == 1) {
                    return const ProductsPlaceholder(count: 4,);
                  }
      
                  return const ProductsPlaceholder(count: 2,);
                }
      
                return const SizedBox.shrink();
              }
            ),
          ],
        ),
      ),
    );
  }
}

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  void _getProducts() {
    final searchFieldViewModel = Provider.of<SearchFieldViewModel>(context, listen: false);
    final searchProductViewModel = Provider.of<SearchProductViewModel>(context, listen: false);
    final filterViewModel = Provider.of<FilterViewModel>(context, listen: false);
    
    searchProductViewModel.getProducts(
      keyword: searchFieldViewModel.keyword,
      withPromo: filterViewModel.withPromo,
      filterType: filterViewModel.selectedFilter,
    );
  }

  void _showFilterBottomDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ProductsFilter(),
    )
    .whenComplete(_getProducts);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                onTap: filterState.togglePromo,
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
              return GestureDetector(
                onTap: _showFilterBottomDialog,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  decoration: BoxDecoration(
                    color: state.selectedFilter != 0 ? primary40 : primary00,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  constraints: const BoxConstraints(minWidth: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
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
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: state.selectedFilter != 0 ? whiteColor : blackColor
                      )
                    ],
                  ),
                ),
              );
            }
          ),
          const SizedBox(width: 20,),
        ],
      ),
    );
  }
}