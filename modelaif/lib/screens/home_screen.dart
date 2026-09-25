import 'package:flutter/material.dart';
import '../models/molde.dart';
import 'pattern_screen.dart'; // Import da tela de detalhes
import '../components/nav_bar.dart';
import '../components/home_header.dart';
import '../components/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controle de estado e navegação
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Moldes do Grid
  final List<Molde> _moldes = moldesExemplo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: theme.colorScheme.surface,
      extendBody: true,

      // DRAWER (Menu Lateral de Hambúrguer)
      drawer: const Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ),

      // APP BAR (Barra Superior Fixa)
      appBar: HomeHeader(scaffoldKey: _scaffoldKey) as PreferredSizeWidget,

      // BODY (Corpo principal com rolagem ativada)
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: GridView.builder(
          itemCount: _moldes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final Molde molde = _moldes[index];
            return AnimatedCategoryCard(
              title: molde.modelo,
              onTap: () {
                // Navegação para a PatternScreen passando o nome da categoria
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatternScreen(molde),
                  ),
                );
              },
            );
          },
        ),
      ),

      // Botão de ação flutuante (FAB)
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        width: 226,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            return;
          },
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          elevation: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.add, size: 23),
              Text('Importar molde', style: TextStyle(fontSize: 16))
            ],
          )
        )
      ),

      // BOTTOM NAVIGATION BAR (Barra Inferior Fixa)
      bottomNavigationBar: Navbar(),
    );
  }
}
