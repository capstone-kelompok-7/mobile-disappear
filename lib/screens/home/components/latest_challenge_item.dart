import 'package:flutter/material.dart';

class LatestChallengeItem extends StatelessWidget {
  const LatestChallengeItem({super.key});

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