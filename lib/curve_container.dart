import 'package:flutter/material.dart';

class CurveContainer extends StatefulWidget {
  const CurveContainer(
      {super.key, required this.height, this.goBack = false, this.tab = null});

  final double height;
  final bool goBack;
  final Widget? tab;

  @override
  State<CurveContainer> createState() => _CurveContainerState();
}

class _CurveContainerState extends State<CurveContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.hardEdge, children: [
      Container(
        height: MediaQuery.of(context).size.height * widget.height,
        decoration: BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/background.png')),
            color: Colors.teal.shade400,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      widget.goBack
          ? Positioned(
              top: 20,
              left: 5,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            )
          : const Text(''),
      widget.goBack && widget.tab != null
          ? Transform.translate(
              offset: const Offset(0, 100), child: widget.tab!)
          : const Text('')
    ]);
  }
}
