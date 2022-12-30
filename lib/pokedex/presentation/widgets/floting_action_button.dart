import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FlotingActionButtonGalley extends StatelessWidget {
  const FlotingActionButtonGalley(
      {Key? key, required this.onPressed, this.asWhite = false})
      : super(key: key);

  final Function onPressed;
  final bool asWhite;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white.withOpacity(0.0),
      onPressed: () => onPressed(),
      elevation: 0,
      child: SvgPicture.asset(
        'assets/images/cross.svg',
        color: asWhite ? Colors.black : Colors.white,
      ),
    );
  }
}

class ButtonClose extends StatelessWidget {
  const ButtonClose({Key? key, required this.onPressed, this.asWhite = false})
      : super(key: key);

  final Function onPressed;
  final bool asWhite;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed(),
      icon: SvgPicture.asset(
        'assets/images/cross.svg',
        color: asWhite ? Colors.black : Colors.white,
      ),
    );
  }
}
