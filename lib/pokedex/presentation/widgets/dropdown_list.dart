import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pokedex/domain/entities/pokemon.dart';

import 'photo_thumb.dart';

typedef CheckCallback = void Function(int id, Pokemon pokemon);

class DropDownDoubleList extends StatelessWidget {
  const DropDownDoubleList({
    Key? key,
    required this.imageList,
    required this.onTap,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;
  final CheckCallback onTap;
  final List<Pokemon> imageList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: imageList.length + 1,
                itemBuilder: (_, index) {
                  if (index < imageList.length) {
                    return GestureDetector(
                      onTap: () {
                        onTap(imageList[index].id!, imageList[index]);
                      },
                      child: PhotoThumb(
                        name: imageList[index].name ?? '',
                        photoLow: imageList[index].img!,
                        id: imageList[index].id ?? 0,
                      ),
                    );
                  } else {
                    return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Colors.white,
                        )));
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
