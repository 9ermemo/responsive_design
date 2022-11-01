import 'package:flutter/material.dart';

class ResponsiveLayer extends StatelessWidget {
  const ResponsiveLayer({Key? key}) : super(key: key);

  // final double screenSize = MediaQuery.of(context).size.width ;
  double screenSize(BuildContext context, int size) {
    return MediaQuery.of(context).size.width / size;
  }

  bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text('Responsive Design'),
        leading: isMobile(context) ? const Icon(Icons.menu) : const SizedBox(),
      ),
      body: Row(
        children: [
          isDesktop(context)
              // we imagine this 'Container' below is a set of screens and widgets
              ? Container(
                  color: Colors.yellowAccent,
                  width: screenSize(context, 4),
                  child: const Center(child: Text('Slider')),
                )
              : const SizedBox(),
          // we imagine this 'Expanded' below is a set of screens and widgets
          Expanded(
            child: Container(
              color: Colors.greenAccent,
              width: screenSize(context, 2),
              child: const Center(child: Text('Content')),
            ),
          )
        ],
      ),
    );
  }
}
