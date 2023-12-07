import 'package:disappear/screens/product_review/components/product_review_item.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatefulWidget {
  static const String routePath = '/product-reviews';

  const ProductReviewsScreen({super.key});

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulasan'),
      ),
      body: ListView(
        children: const [
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                Text('4.9', style: TextStyle(fontSize: 40),),
                SizedBox(height: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_border, size: 23,),
                    SizedBox(width: 2,),
                    Icon(Icons.star_border, size: 23,),
                    SizedBox(width: 2,),
                    Icon(Icons.star_border, size: 23,),
                    SizedBox(width: 2,),
                    Icon(Icons.star_border, size: 23,),
                    SizedBox(width: 2,),
                    Icon(Icons.star_border, size: 23,),
                  ],
                ),
                SizedBox(height: 2,),
                Text('berdasarkan 19 ulasan', style: TextStyle(fontSize: 12),),
              ],
            ),
          ),
          SizedBox(height: 24,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Sangat baik', style: TextStyle(fontSize: 12),)
                    ),
                    Expanded(
                      flex: 3,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        value: 0.4,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Baik', style: TextStyle(fontSize: 12),)
                    ),
                    Expanded(
                      flex: 3,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        value: 0.7,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Rata-rata', style: TextStyle(fontSize: 12),)
                    ),
                    Expanded(
                      flex: 3,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Buruk', style: TextStyle(fontSize: 12),)
                    ),
                    Expanded(
                      flex: 3,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        value: 0.3,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Text('13 Ulasan', style: TextStyle(fontSize: 14),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
              // SizedBox(height: 24,),
              // ProductReviewItem(),
              // SizedBox(height: 24,),
              // ProductReviewItem(),
              // SizedBox(height: 24,),
              // ProductReviewItem(),
              // SizedBox(height: 24,),
              ],
            ),
          ),
        ],
      )
    );
  }
}