import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/view_models/search_product/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 4,
                      offset: Offset(0, 4)
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<FilterViewModel>(
                      builder: (context, state, _) {
                        return TextButton(
                          onPressed: () => state.selectedFilter = 0,
                          child: const Text('Clear'),
                        );
                      }
                    ),
                    const Text('Urutkan berdasarkan'),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.clear)
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              Consumer<FilterViewModel>(
                builder: (context, state, _) {
                  return GestureDetector(
                    onTap: () => state.selectedFilter = 1,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 54),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: state.selectedFilter == 1
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primary40,
                            border: Border.all(color: primary40, width: 1)
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primary40, width: 1)
                          ),
                      child: Center(
                        child: Text('Abjad', style: TextStyle(color: state.selectedFilter == 1 ? whiteColor : blackColor, fontSize: 14),)
                      ),
                    ),
                  );
                }
              ),
              const SizedBox(height: 20,),
              Consumer<FilterViewModel>(
                builder: (context, state, _) {
                  return GestureDetector(
                    onTap: () => state.selectedFilter = 2,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 54),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: state.selectedFilter == 2
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primary40,
                            border: Border.all(color: primary40, width: 1)
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primary40, width: 1)
                          ),
                      child: Center(
                        child: Text('Terbaru', style: TextStyle(color: state.selectedFilter == 2 ? whiteColor : blackColor, fontSize: 14),)
                      ),
                    ),
                  );
                }
              ),
              const SizedBox(height: 20,),
              Consumer<FilterViewModel>(
                builder: (context, state, _) {
                  return GestureDetector(
                    onTap: () => state.selectedFilter = 3,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 54),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: state.selectedFilter == 3
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primary40,
                            border: Border.all(color: primary40, width: 1)
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primary40, width: 1),
                          ),
                      child: Center(
                        child: Text('Termahal', style: TextStyle(color: state.selectedFilter == 3 ? whiteColor : blackColor, fontSize: 14),)
                      ),
                    ),
                  );
                }
              ),
              const SizedBox(height: 20,),
              Consumer<FilterViewModel>(
                builder: (context, state, _) {
                  return GestureDetector(
                    onTap: () => state.selectedFilter = 4,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 54),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: state.selectedFilter == 4
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primary40,
                            border: Border.all(color: primary40, width: 1)
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primary40, width: 1)
                          ),
                      child: Center(
                        child: Text('Termurah', style: TextStyle(color: state.selectedFilter == 4 ? whiteColor : blackColor, fontSize: 14),)
                      ),
                    ),
                  );
                }
              ),
              const SizedBox(height: 40,),
            ],
          ),
        ),
      ],
    );
  }
}