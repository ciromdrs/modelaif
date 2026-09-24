import 'package:flutter/material.dart';
import '../models/molde.dart';
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

  // Moldes do Grid
  final List<Molde> _moldes = _moldesExemplo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              children: [
                // Botão de Menu Hambúrguer
                IconButton(
                  icon: const Icon(Icons.menu),
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
                      color: theme.colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Buscar molde',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
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
                  icon: Icon(Icons.filter_list),
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
          itemCount: _moldes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final Molde molde = _moldes[index];
            return _AnimatedCategoryCard(
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

      // BOTTOM NAVIGATION BAR (Barra Inferior Fixa)
      bottomNavigationBar: UnconstrainedBox(
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
        duration: Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Área reservada para a imagem
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // Título da categoria
              Padding(
                padding: EdgeInsets.only(left: 6.0, bottom: 4.0),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onPrimaryContainer,
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

final List<Molde> _moldesExemplo = [
  Molde(
    modelo: 'Saia Reta',
    modelista: "Ana Silva",
    referencia: "S2020",
    imagem: "saia_reta__Principal.png",
    partes: [
      Parte(
        nome: "Frente",
        quantidade: 1,
        imagem: "saia_reta__Frente.png",
      ),
      Parte(
        nome: "Costas",
        quantidade: 1,
        imagem: "saia_reta__Costas.png",
      ),
      Parte(
        nome: "Cós",
        quantidade: 1,
        imagem: "saia_reta__Cós.png",
      )
    ],
  ),
  Molde(
    modelo: 'Calça Jeans',
    modelista: "Bottini",
    referencia: "C2020",
    imagem: "exmplo.png",
    partes: [
      Parte(
        nome: "Exemplo",
        quantidade: 1,
        imagem: "exemplo.png",
      ),
    ],
  ),
  Molde(
    modelo: 'Camiseta',
    modelista: "Modelista Exemplo",
    referencia: "C2020",
    imagem: "exmplo.png",
    partes: [
      Parte(
        nome: "Exemplo",
        quantidade: 1,
        imagem: "exemplo.png",
      ),
    ],
  ),
  Molde(
    modelo: 'Vestido',
    modelista: "Modelista Exemplo",
    referencia: "V2020",
    imagem: "exmplo.png",
    partes: [
      Parte(
        nome: "Exemplo",
        quantidade: 1,
        imagem: "exemplo.png",
      ),
    ],
  ),
  Molde(
    modelo: 'Short',
    modelista: "Modelista Exemplo",
    referencia: "S2020",
    imagem: "exmplo.png",
    partes: [
      Parte(
        nome: "Exemplo",
        quantidade: 1,
        imagem: "exemplo.png",
      ),
    ],
  ),
];