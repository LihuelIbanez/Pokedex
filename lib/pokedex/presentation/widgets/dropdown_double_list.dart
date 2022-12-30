import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

import 'photo_thumb.dart';

typedef CheckCallback = void Function(int id, Pokemon pokemon);

class DropDownDoubleList extends StatelessWidget {
  DropDownDoubleList({
    Key? key,
    required this.imageList,
    required this.onTap,
  }) : super(key: key);
  final CheckCallback onTap;
  final List<Pokemon> imageList;
  final List<Pokemon> evenList = [];
  final List<Pokemon> oddList = [];

  void makingLists() {
    for (int i = 0; i < imageList.length; i++) {
      if (i % 2 == 0) {
        oddList.add(imageList[i]);
      } else {
        evenList.add(imageList[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    makingLists();
    return Stack(
      children: [
        SingleChildScrollView(
          child: Stack(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: oddList.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          onTap(oddList[index].id!, oddList[index]);
                        },
                        child: PhotoThumb(
                          name: oddList[index].name ?? '',
                          photoLow: oddList[index].img!,
                          index: index,
                          id: oddList[index].id!,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: evenList.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () =>
                            onTap(evenList[index].id!, evenList[index]),
                        child: PhotoThumb(
                          name: evenList[index].name ?? '',
                          photoLow: evenList[index].img!,
                          index: index,
                          isEven: true,
                          id: evenList[index].id!,
                        ),
                      );
                    },
                  ),
                ),
              ]),
            ],
          ),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.0),
                Colors.white.withOpacity(0.5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
