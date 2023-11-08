import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  static const String routePath = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disappear'),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.notifications, color: Colors.white,),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.shopping_cart, color: Colors.white,)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(),
            ),
            const SizedBox(height: 14,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CarouselSlider(
                  options: CarouselOptions(height: 150.0),
                  items: [1,2,3,4,5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.grey
                          )
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 14,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: DotsIndicator()
            ),
            const SizedBox(height: 19,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Kategori',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Lihat semua',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Category(),
                      Category(),
                      Category(),
                      Category(),
                      Category(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 34,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Produk terlaris',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 180,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: const [
                      SizedBox(width: 12,),
                      BestSellerProduct(),
                      BestSellerProduct(),
                      BestSellerProduct(),
                      BestSellerProduct(),
                      BestSellerProduct(),
                      SizedBox(width: 12,)
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 34,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Tantangan',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 100,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: const [
                      SizedBox(width: 12,),
                      LatestChallenge(),
                      SizedBox(width: 12,),
                      LatestChallenge(),
                      SizedBox(width: 12,),
                      LatestChallenge(),
                      SizedBox(width: 12,),
                      LatestChallenge(),
                      SizedBox(width: 12,),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 34,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Artikel',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16,),
                  Article(),
                  SizedBox(height: 10,),
                  Article(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Container(
            color: Colors.grey,
            width: 7,
            height: 7,
          ),
        ),
        const SizedBox(width: 5,),
        ClipOval(
          child: Container(
            color: Colors.grey,
            width: 7,
            height: 7,
          ),
        ),
        const SizedBox(width: 5,),
        ClipOval(
          child: Container(
            color: Colors.grey,
            width: 7,
            height: 7,
          ),
        ),
        const SizedBox(width: 5,),
        ClipOval(
          child: Container(
            color: Colors.grey,
            width: 7,
            height: 7,
          ),
        ),
        const SizedBox(width: 5,),
        ClipOval(
          child: Container(
            color: Colors.grey,
            width: 7,
            height: 7,
          ),
        ),
      ],
    );
  }
}

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5)
      ),
      child: const Text(
        'Kategori',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12
        ),
      )
    );
  }
}

class BestSellerProduct extends StatelessWidget {
  const BestSellerProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Image.network('https://picsum.photos/110'),
            const Padding(
              padding: EdgeInsets.only(top: 5, right: 6.5, bottom: 10, left: 6.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Totebag Kanvas', style: TextStyle(fontSize: 12),),
                  SizedBox(height: 3,),
                  Row(
                    children: [
                      Icon(Icons.star_border, size: 10,),
                      SizedBox(height: 2,),
                      Icon(Icons.star_border, size: 10,),
                      SizedBox(height: 2,),
                      Icon(Icons.star_border, size: 10,),
                      SizedBox(height: 2,),
                      Icon(Icons.star_border, size: 10,),
                      SizedBox(height: 2,),
                      Icon(Icons.star_border, size: 10,),
                    ],
                  ),
                  SizedBox(height: 3,),
                  Text('Rp 20.000-', style: TextStyle(fontSize: 12),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LatestChallenge extends StatelessWidget {
  const LatestChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network('https://picsum.photos/130/70')
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 5),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Column(
                  children: [
                    Text('150'),
                    Text('EXP'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          const Text(
            'Tantangan menanam pohon',
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

class Article extends StatelessWidget {
  const Article({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 188,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('24 Oktober 2023', style: TextStyle(fontSize: 12),),
                  SizedBox(height: 3,),
                  Text('Berapa Banyak Sampah Plastik yang Ada di Lautan?', style: TextStyle(fontSize: 14),),
                  SizedBox(height: 3,),
                  Text('Peneliti memperkirakan jumlah sampah plastik yang...', style: TextStyle(fontSize: 10),),
                  SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('1 minggu yang lalu', style: TextStyle(fontSize: 8),),
                      Icon(Icons.more_horiz)
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: Image.network('https://picsum.photos/110/95'),
            )
          ],
        ),
      ),
    );
  }
}