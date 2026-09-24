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
  final List<Molde> _moldes = _moldesExemplo;

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

      // BOTTOM NAVIGATION BAR (Barra Inferior Fixa)
      bottomNavigationBar: Navbar(),
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