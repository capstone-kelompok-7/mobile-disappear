import 'package:flutter/material.dart';

import 'package:disappear/models/order_detail_by_id_model.dart';
import 'package:disappear/themes/text_theme.dart';

class AddressComponents extends StatefulWidget {
  final OrderDetailByIdModel orderDetail;
  const AddressComponents({
    Key? key,
    required this.orderDetail,
  }) : super(key: key);

  @override
  State<AddressComponents> createState() => _AddressComponentsState();
}

class _AddressComponentsState extends State<AddressComponents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(width: 0.5, color: Color(0xffAFAFAF)),
        bottom: BorderSide(width: 0.25, color: Color(0xffAFAFAF)),
      )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alamat Pengiriman',
                style: mediumBody7,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                widget.orderDetail.address.acceptedName,
                style: regularBody8,
              ),
              Text(
                widget.orderDetail.address.phone,
                style: regularBody8,
              ),
              Text(
                widget.orderDetail.address.address,
                style: regularBody8,
              ),
              Text(
                'KAB. BANDUNG, JAWA BARAT, 40111',
                style: regularBody8,
              ),
            ],
          )
        ],
      ),
    );
  }
}
