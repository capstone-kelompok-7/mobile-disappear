import 'package:disappear/models/product/product_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProductReviewItem extends StatefulWidget {
  final Review review;

  const ProductReviewItem({super.key, required this.review});

  @override
  State<ProductReviewItem> createState() => _ProductReviewItemState();
}

class _ProductReviewItemState extends State<ProductReviewItem> {
  String showDate() {
    return timeago.format(widget.review.date, locale: 'id');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    widget.review.photoProfile.isNotEmpty
                      ? widget.review.photoProfile
                      : 'https://picsum.photos/30',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  )
                ),
                const SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.review.name.isNotEmpty ? widget.review.name : 'User'),
                    const SizedBox(width: 5,),
                    Row(
                      children: [
                        Icon(
                          color: widget.review.rating >= 1 ? warning30 : neutral00,
                          Icons.star,
                          size: 18,
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          color: widget.review.rating >= 2 ? warning30 : neutral00,
                          Icons.star,
                          size: 18,
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          color: widget.review.rating >= 3 ? warning30 : neutral00,
                          Icons.star,
                          size: 18,
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          color: widget.review.rating >= 4 ? warning30 : neutral00,
                          Icons.star,
                          size: 18,
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          color: widget.review.rating >= 5 ? warning30 : neutral00,
                          Icons.star,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text('${widget.review.rating}')
                      ],
                    ),
                  ],
                )
              ],
            ),
            Text(showDate(), style: regularBody8,)
          ],
        ),
        const SizedBox(height: 12,),
        Visibility(
          visible: widget.review.photo!.isNotEmpty,
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        widget.review.photo![index].photo,
                        width: 120,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(width: 10,),
                  itemCount: widget.review.photo!.length
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
        Text(
          widget.review.description,
          style: const TextStyle(fontSize: 12, height: 1.5),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}