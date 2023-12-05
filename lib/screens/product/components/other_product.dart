import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class OtherProduct extends StatelessWidget {
  const OtherProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 200,
      child: Card(
        color: secondary00,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Image.network(
                'https://picsum.photos/130/120',
                fit: BoxFit.cover,
                width: 130,
                height: 120,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, right: 6.5, bottom: 10, left: 6.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Totebag Kanvas',
                      style: mediumBody6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: blackColor),
                        SizedBox(width: 2,),
                        Icon(Icons.star, size: 14, color: blackColor),
                        SizedBox(width: 2,),
                        Icon(Icons.star, size: 14, color: blackColor),
                        SizedBox(width: 2,),
                        Icon(Icons.star, size: 14, color: blackColor),
                        SizedBox(width: 2,),
                        Icon(Icons.star, size: 14, color: blackColor),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Text('Rp20.000-', style: semiBoldBody7),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}