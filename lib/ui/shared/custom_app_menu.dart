import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';


class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu ({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration( milliseconds: 200));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 310 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              
              if( isOpen )
              ...[
                  CustomMenuItem(text: 'Home',    delay: 100, onPressed: () => pageProvider.goTo( 0 )),
                  CustomMenuItem(text: 'About',   delay: 200, onPressed: () => pageProvider.goTo( 1 )),
                  CustomMenuItem(text: 'Pricing', delay: 300, onPressed: () => pageProvider.goTo( 2 )),
                  CustomMenuItem(text: 'Contact', delay: 400, onPressed: () => pageProvider.goTo( 3 )),
                  CustomMenuItem(text: 'Location',delay: 500, onPressed: () => pageProvider.goTo( 4 )),
                  const SizedBox( height: 8,)
                ]
            ],
          ),
        ),
        onTap: () {
          if ( isOpen ) {
            controller.reverse();
          } else {
            controller.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration( milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 30 : 0, 
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto( color: Colors.white, fontSize: 18)
          ),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close, 
            color: Colors.white,
            progress: controller,
          ),
        ],
      ),
    );
  }
}