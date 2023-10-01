import 'package:animate_gradient/animate_gradient.dart';
import 'package:floating_frosted_bottom_bar/app/frosted_bottom_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 4, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FrostedBottomBar(
        opacity: 0.5,
        sigmaX: 5,
        sigmaY: 5,
        borderRadius: BorderRadius.circular(500),
        duration: const Duration(milliseconds: 800),
        hideOnScroll: true,
        body: (context, controller) => AnimateGradient(
          duration: const Duration(seconds: 5),
          primaryColors: const [
            Color(0xff42b351),
            Color(0xFFADDFA9),
            Color(0XFFded3ee),
            Color(0Xffffffeb),
          ],
          secondaryColors: const [
            Color(0Xffffffeb),
            Color(0XFFded3ee),
            Color(0xFFADDFA9),
            Color(0xff42b351),
          ],
          child: TabBarView(
              controller: tabController,
              dragStartBehavior: DragStartBehavior.down,
              physics: const BouncingScrollPhysics(),
              children: const [
                Center(child: Text('Home')),
                Center(
                  child: Text('Proyectos'),
                ),
                Center(
                  child: Text('Eventos'),
                ),
                Center(
                  child: Text('Perfil'),
                ),
              ]),
        ),
        child: TabBar(
          indicatorPadding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
          controller: tabController,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.green, width: 4),
            insets: EdgeInsets.fromLTRB(8, 0, 8, 4),
          ),
          tabs: [
            TabsIcon(
                icons: Icons.home,
                color:
                    currentPage == 0 ? Colors.lightGreenAccent : Colors.white),
            TabsIcon(
                icons: Icons.account_tree_outlined,
                color:
                    currentPage == 1 ? Colors.lightGreenAccent : Colors.white),
            TabsIcon(
                icons: Icons.event_note,
                color:
                    currentPage == 2 ? Colors.lightGreenAccent : Colors.white),
            TabsIcon(
                icons: Icons.person,
                color:
                    currentPage == 3 ? Colors.lightGreenAccent : Colors.white),
          ],
        ),
      ),
    );
  }
}

class TabsIcon extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final IconData icons;

  const TabsIcon(
      {Key? key,
      this.color = Colors.white,
      this.height = 60,
      this.width = 50,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: Icon(
          icons,
          color: color,
        ),
      ),
    );
  }
}
