import 'package:flutter/material.dart';

class PhotoThumb extends StatelessWidget {
  const PhotoThumb({
    Key? key,
    required this.id,
    required this.name,
    required this.photoLow,
    this.isEven = false,
  }) : super(key: key);
  final int id;
  final String name;
  final String photoLow;
  final bool isEven;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Hero(
        tag: id,
        transitionOnUserGestures: true,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: Colors.grey,
              child: SizedBox(
                width: 150,
                height: 250,
                child: FadeInImage.assetNetwork(
                  placeholderFit: BoxFit.none,
                  placeholderScale: 5,
                  placeholder: 'assets/images/loading.gif',
                  image: photoLow,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 150,
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    stops: const [0.3, 1],
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Column(
        children: [
          SizedBox(
            height: 220,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                '$name \n id: $id',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Pixel',
                  color: Colors.white,
                ),
              )),
        ],
      ),
    ]);
  }
}
