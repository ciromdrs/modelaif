/// Representa um molde de roupa.
///
/// Guarda informações como nome e referência do modelo e a lista de partes
/// que o compõem.
class Molde {
  /// Nome do tipo de peça representado pelo molde. Ex.: Saia reta.
  String modelo;

  /// Nome do modelista ou responsável pela criação do molde. Ex.: Ana Silva.
  String modelista;

  /// Lista de partes que compõem o molde.
  List<Parte> partes;

  /// Código ou referência única para identificar o molde. Ex.: S2020.
  String referencia;

  /// Caminho para a imagem principal do molde.
  String imagem;

  /// Cria uma instância de [Molde].
  Molde({
    required this.modelo,
    required this.modelista,
    required this.referencia,
    required this.imagem,
    required this.partes,
  });
}

/// Representa uma parte individual de um molde.
///
/// A propriedade [cortar] indica a quantidade de vezes que a peça deve ser
/// recortada, enquanto [imagem] guarda o caminho ou identificador do recurso
/// visual relacionado à parte.
class Parte {
  /// Nome da parte do molde. Ex.: Frente, Costas, Manga.
  String nome;

  /// Quantidade de cortes da parte no processo de produção.
  int quantidade;

  /// Caminho ou referência da imagem da parte do molde.
  String imagem;

  /// A descrição de como cortar a parte.
  String descricao;

  /// Cria uma instância de [Parte].
  Parte({
    required this.nome,
    required this.quantidade,
    required this.imagem,
    required this.descricao,
  });
}

final List<Molde> moldesExemplo = [
  Molde(
    modelo: 'Saia Reta',
    modelista: "Ana Silva",
    referencia: "S2020",
    imagem: "moldes/saia_reta/saia_reta__Principal.png",
    partes: [
      Parte(
        nome: "Frente",
        quantidade: 1,
        imagem: 'moldes/saia_reta/saia_reta__Frente.png',
        descricao: """1. Traçar uma reta do Ponto 1 ao Ponto 2 de tamanho ¼ do Quadril + 1 cm, isto é: 1 x 100 = 25 + 1 = 26cm

2. Traçar uma reta do Ponto 1 ao Ponto 3 do Ponto 2 ao Ponto 4 e unir o Ponto 3 ao Ponto 4. Tamanho = Comprimento da Saia + 1,5 cm, isto é: 54 + 1, 5 = 55,5cm

3. Marcar do Ponto 1 ao Ponto 5 = ¼ da Cintura +1 cm, isto é: ¼ x 78 = 19,5 + 1 = 20,5cm

4. Marcar do Ponto 1 ao 7 e do Ponto 2 ao 6 = ALTURA DO QUADRIL"""
      ),
      Parte(
        nome: "Costas",
        quantidade: 1,
        imagem: 'moldes/saia_reta/saia_reta__Costas.png',
        descricao: """1. Traçar uma reta do Ponto 1 ao Ponto 2 = ¼ DO QUADRIL + 1cm, isto é:
1 x 100 = 25 + 1 = 26cm
1. Traçar uma reta do Ponto 1 ao 3 e do 2 ao 4 e unir o Ponto 3 ao 4 = COMPRIMENTO DA SAIA + 2 cm, isto é:
54 + 2 = 56cm

3. Marcar do Ponto 1 ao 5 = ¼ da CINTURA +1cm, isto é:
1 x 78 = 19,5 + 1 = 20,5cm

4. Marcar do Ponto 1 ao 7 e do Ponto 2 ao 6 = ALTURA DO QUADRIL              

5. Ligar o Ponto 6 ao 7

6. Marcar o Ponto 1 ao 8 = 2 cm
                                                                                                   
7. PENCE = Marcar o centro entre o Ponto 1 e o Ponto 2 e marcar 3cm e comprimento 12 cm
(1 x 3)/2 = 6""",
      ),
      Parte(
        nome: "Cós",
        quantidade: 1,
        imagem: 'moldes/saia_reta/saia_reta__Cos.png',
        descricao: """1. Ponto 1 ao Ponto 2 = CINTURA + 2cm, isto é:
78 + 2 = 80cm

2. Ponto 1 ao 3 e 2 ao 4 = 6cm"""
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
        descricao: "1. Traçar uma reta do Ponto 1 ao Ponto 2..."
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
        descricao: "1. Traçar uma reta do Ponto 1 ao Ponto 2..."
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
        descricao: "1. Traçar uma reta do Ponto 1 ao Ponto 2..."
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
        descricao: "1. Traçar uma reta do Ponto 1 ao Ponto 2..."
      ),
    ],
  ),
];