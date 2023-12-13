import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VoucherPlaceholder extends StatelessWidget {
  const VoucherPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: neutral00,
        highlightColor: neutral20,
        child: Container(
          height: 100,
          width: 332,
          margin: const EdgeInsets.only(
            left: 29,
            right: 29,
            bottom: 12,
          ),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.black,
          )),
          child: Row(
            children: [
              SizedBox(
                height: 113,
                width: 100,
                child: Image.network(
                  'https://s3.amazonaws.com/thumbnails.venngage.com/template/5456834b-ba95-41a9-85b2-4abd4d313c11.png',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: 219,
                height: 100,
                padding: const EdgeInsets.only(
                  left: 7,
                  top: 19.5,
                  bottom: 19.5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Kupon Potongan Harga Rp',
                        style: mediumBody7,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Min. Blj Rp ',
                        style: mediumBody8,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Expanded(
                      child: Text(
                        'Berakhir dalam : ',
                        style: regularBody8,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
