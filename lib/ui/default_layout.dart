import 'package:flutter/material.dart';
import 'package:tabichizu/domain/responsive.dart';
import 'package:tabichizu/ui/common/icon/custom_icon.dart';
import 'package:tabichizu/ui/pages/Travel.dart';
import 'package:tabichizu/ui/pages/account.dart';
import 'package:tabichizu/ui/pages/home.dart';

class DefaultLayout extends StatefulWidget {
  const DefaultLayout({super.key});

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  int _selectedNavigationBarItemIndex = 1;

  PageController? _pageController;

  static const _pages = [Account(), Home(), Travel()];

  void _onItemTap(int index) {
    setState(() {
      _selectedNavigationBarItemIndex = index;
    });

    _pageController?.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Responsive.isSmallScreen(context)
            ? null
            : AppBar(
                title: const Text("large"),
              ),
        body: PageView(
          controller: _pageController,
          children: _pages,
        ),
        bottomNavigationBar: Responsive.isSmallScreen(context)
            ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: BottomNavigationBar(
                  currentIndex: _selectedNavigationBarItemIndex,
                  onTap: _onItemTap,
                  items: const [
                    BottomNavigationBarItem(
                        icon: CustomIcon(icon: Icons.person, size: 36),
                        label: 'アカウント'),
                    BottomNavigationBarItem(
                        icon: CustomIcon(icon: Icons.home, size: 36),
                        label: 'ホーム'),
                    BottomNavigationBarItem(
                        icon: CustomIcon(icon: Icons.tour, size: 36),
                        label: '訪れた場所'),
                  ],
                  type: BottomNavigationBarType.fixed,
                ),
              )
            : null);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
}
