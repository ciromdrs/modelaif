/// MedidasModel representa as medidas de uma pessoa.
class MedidasModel {
  final String nome;
  final DateTime dataCriacao;
  final DateTime ultimaModificacao;
  final double? busto;
  final double? cintura;
  final double? quadril;
  final double? comprimentoCorpoFrente;
  final double? centroFrente;
  final double? cavaACavaFrente;
  final double? alturaDoBusto;
  final double? separacaoDoBusto;
  final double? baseDoBojo;
  final double? comprimentoCorpoCostas;
  final double? ombro;
  final double? alturaDoCotovelo;
  final double? comprimentoDaManga;
  final double? circunferenciaDoBraco;
  final double? circunferenciaDoCotovelo;
  final double? circunferenciaDoPulso;
  final double? punho;
  final double? alturaDoGancho;
  final double? alturaDoQuadril;
  final double? entrepernas;
  final double? circunferenciaDaCoxa;
  final double? circunferenciaDoJoelho;
  final double? circunferenciaDoTornozelo;
  final double? alturaDoJoelho;
  final double? circunferenciaDaCabeca;

  const MedidasModel({
    this.nome = 'Sem nome',
    required this.dataCriacao,
    required this.ultimaModificacao,
    this.busto,
    this.cintura,
    this.quadril,
    this.comprimentoCorpoFrente,
    this.centroFrente,
    this.cavaACavaFrente,
    this.alturaDoBusto,
    this.separacaoDoBusto,
    this.baseDoBojo,
    this.comprimentoCorpoCostas,
    this.ombro,
    this.alturaDoCotovelo,
    this.comprimentoDaManga,
    this.circunferenciaDoBraco,
    this.circunferenciaDoCotovelo,
    this.circunferenciaDoPulso,
    this.punho,
    this.alturaDoGancho,
    this.alturaDoQuadril,
    this.entrepernas,
    this.circunferenciaDaCoxa,
    this.circunferenciaDoJoelho,
    this.circunferenciaDoTornozelo,
    this.alturaDoJoelho,
    this.circunferenciaDaCabeca,
  });

  factory MedidasModel.fromJson(Map<String, dynamic> json) {
    return MedidasModel(
      nome: json['nome'] ?? 'Sem nome',
      dataCriacao: DateTime.parse(json['dataCriacao'] ?? DateTime.now().toUtc().toIso8601String()),
      ultimaModificacao: DateTime.parse(json['ultimaModificacao'] ?? DateTime.now().toUtc().toIso8601String()),
      busto: _toDouble(json['busto']),
      cintura: _toDouble(json['cintura']),
      quadril: _toDouble(json['quadril']),
      comprimentoCorpoFrente: _toDouble(json['comprimentoCorpoFrente']),
      centroFrente: _toDouble(json['centroFrente']),
      cavaACavaFrente: _toDouble(json['cavaACavaFrente']),
      alturaDoBusto: _toDouble(json['alturaDoBusto']),
      separacaoDoBusto: _toDouble(json['separacaoDoBusto']),
      baseDoBojo: _toDouble(json['baseDoBojo']),
      comprimentoCorpoCostas: _toDouble(json['comprimentoCorpoCostas']),
      ombro: _toDouble(json['ombro']),
      alturaDoCotovelo: _toDouble(json['alturaDoCotovelo']),
      comprimentoDaManga: _toDouble(json['comprimentoDaManga']),
      circunferenciaDoBraco: _toDouble(json['circunferenciaDoBraco']),
      circunferenciaDoCotovelo: _toDouble(json['circunferenciaDoCotovelo']),
      circunferenciaDoPulso: _toDouble(json['circunferenciaDoPulso']),
      punho: _toDouble(json['punho']),
      alturaDoGancho: _toDouble(json['alturaDoGancho']),
      alturaDoQuadril: _toDouble(json['alturaDoQuadril']),
      entrepernas: _toDouble(json['entrepernas']),
      circunferenciaDaCoxa: _toDouble(json['circunferenciaDaCoxa']),
      circunferenciaDoJoelho: _toDouble(json['circunferenciaDoJoelho']),
      circunferenciaDoTornozelo: _toDouble(json['circunferenciaDoTornozelo']),
      alturaDoJoelho: _toDouble(json['alturaDoJoelho']),
      circunferenciaDaCabeca: _toDouble(json['circunferenciaDaCabeca']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'dataCriacao': dataCriacao.toUtc().toIso8601String(),
      'ultimaModificacao': ultimaModificacao.toUtc().toIso8601String(),
      'busto': busto,
      'cintura': cintura,
      'quadril': quadril,
      'comprimentoCorpoFrente': comprimentoCorpoFrente,
      'centroFrente': centroFrente,
      'cavaACavaFrente': cavaACavaFrente,
      'alturaDoBusto': alturaDoBusto,
      'separacaoDoBusto': separacaoDoBusto,
      'baseDoBojo': baseDoBojo,
      'comprimentoCorpoCostas': comprimentoCorpoCostas,
      'ombro': ombro,
      'alturaDoCotovelo': alturaDoCotovelo,
      'comprimentoDaManga': comprimentoDaManga,
      'circunferenciaDoBraco': circunferenciaDoBraco,
      'circunferenciaDoCotovelo': circunferenciaDoCotovelo,
      'circunferenciaDoPulso': circunferenciaDoPulso,
      'punho': punho,
      'alturaDoGancho': alturaDoGancho,
      'alturaDoQuadril': alturaDoQuadril,
      'entrepernas': entrepernas,
      'circunferenciaDaCoxa': circunferenciaDaCoxa,
      'circunferenciaDoJoelho': circunferenciaDoJoelho,
      'circunferenciaDoTornozelo': circunferenciaDoTornozelo,
      'alturaDoJoelho': alturaDoJoelho,
      'circunferenciaDaCabeca': circunferenciaDaCabeca,
    };
  }

  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    return double.tryParse(value.toString());
  }
}
