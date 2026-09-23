import 'package:flutter/material.dart';
import 'pattern_screen.dart'; // Import da tela de detalhes

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controle de estado e navegação
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Dados das categorias do Grid (incluindo o Short)
  final List<Map<String, String>> _categories = [
    {'title': 'Camiseta'},
    {'title': 'Calça'},
    {'title': 'Saia'},
    {'title': 'Vestido'},
    {'title': 'Short'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: theme.scaffoldBackgroundColor,

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              children: [
                // Botão de Menu Hambúrguer
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black87),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
                const SizedBox(width: 4),

                // Campo de Busca centralizado
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xffdddddd),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Buscar molde',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.black87),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 4),

                // Botão de Filtro
                IconButton(
                  icon: const Icon(Icons.tune, color: Colors.black87),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),

      // BODY (Corpo principal com rolagem ativada)
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: GridView.builder(
          itemCount: _categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final category = _categories[index];
            return _AnimatedCategoryCard(
              title: category['title']!,
              onTap: () {
                // Navegação para a PatternScreen passando o nome da categoria
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatternScreen(
                      title: '${category['title']} Reta',
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),

      // BOTTOM NAVIGATION BAR (Barra Inferior Fixa)
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: theme.primaryColorLight,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: Colors.black87, size: 28);
            }
            return const IconThemeData(color: Colors.black54, size: 26);
          }),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: theme.secondaryHeaderColor,
          elevation: 0,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.checkroom_outlined),
              selectedIcon: Icon(Icons.checkroom),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.square_foot_outlined),
              selectedIcon: Icon(Icons.square_foot),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

// WIDGET AUXILIAR (Caixa clicável com animação de encolher ao toque)
class _AnimatedCategoryCard extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _AnimatedCategoryCard({
    required this.title,
    required this.onTap,
  });

  @override
  State<_AnimatedCategoryCard> createState() => _AnimatedCategoryCardState();
}

class _AnimatedCategoryCardState extends State<_AnimatedCategoryCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0, // Encolhe levemente ao pressionar
        duration: const Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            color: theme.primaryColorLight,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Área reservada para a imagem
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: const Color.fromARGB(255, 225, 221, 228),
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // Título da categoria
              Padding(
                padding: const EdgeInsets.only(left: 6.0, bottom: 4.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}