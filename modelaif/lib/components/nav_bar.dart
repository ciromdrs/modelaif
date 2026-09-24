import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return UnconstrainedBox(
      child: Container(
        width: mediaQuery.size.width * .48,
        height: 80,
        margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(48),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(160, 12, 12, 12),
              offset: Offset(0, 3),
              blurRadius: 5
            )
          ]
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          elevation: 4,
          destinations: const [
            // TODO: criar constante para armazenar o tamanho dos ícones (size)
            NavigationDestination(
              icon: Icon(Icons.checkroom_outlined, size: 38),
              selectedIcon: Icon(Icons.checkroom, size: 38),
              label: 'Moldes',
            ),
            NavigationDestination(
              icon: Icon(Icons.design_services_outlined, size: 38),
              selectedIcon: Icon(Icons.design_services, size: 38),
              label: 'Medidas',
            ),
          ]
        )
      ),
    );
  }
}