import 'package:flutter/material.dart';

class LatestArticleItem extends StatelessWidget {
  const LatestArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network('https://picsum.photos/110/125')
              ),
            ),
            const Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('24 Oktober 2023', style: TextStyle(fontSize: 12),),
                    SizedBox(height: 10,),
                    Text('Berapa Banyak Sampah Plastik yang Ada di Lautan?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text('1 minggu yang lalu', style: TextStyle(fontSize: 8),),
                            SizedBox(width: 10,),
                            Icon(Icons.visibility, size: 15,),
                            SizedBox(width: 5,),
                            Text('1045', style: TextStyle(fontSize: 8),),
                          ],
                        ),
                        Icon(Icons.bookmark_outline, size: 15,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}