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

  /// Cria uma instância de [Parte].
  Parte({
    required this.nome,
    required this.quantidade,
    required this.imagem,
  });
}