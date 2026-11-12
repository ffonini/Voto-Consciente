import 'package:flutter/material.dart';
import 'package:voto_consciente/screens/dicionario/termo_politico.dart';

import '../../core/rotas/rotas.dart';

class TelaDicionario extends StatefulWidget {
  const TelaDicionario({super.key});

  @override
  State<TelaDicionario> createState() => _TelaDicionarioState();
}

class _TelaDicionarioState extends State<TelaDicionario> {
  static const Color _azul = Color(0xFF1F3A5F);
  static const Color _verde = Color(0xFF087F5B);
  static const Color _fundo = Color(0xFFF7F9FC);
  static const Color _textoSecundario = Color(0xFF64748B);

  final TextEditingController _buscaController = TextEditingController();
  late final List<TermoPolitico> _termosOrdenados;
  String _busca = '';

  @override
  void initState() {
    super.initState();
    // copia a lista (ela é const) e ordena em ordem alfabética
    _termosOrdenados = List<TermoPolitico>.from(dicionarioPolitico)
      ..sort((a, b) => _normalizar(a.nome).compareTo(_normalizar(b.nome)));
  }

  @override
  void dispose() {
    _buscaController.dispose();
    super.dispose();
  }

  // remove acentos e deixa minúsculo, para a busca ignorar acento e maiúscula
  String _normalizar(String texto) {
    const comAcento = 'áàâãäéèêëíìîïóòôõöúùûüçÁÀÂÃÄÉÈÊËÍÌÎÏÓÒÔÕÖÚÙÛÜÇ';
    const semAcento = 'aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC';
    var resultado = texto;
    for (var i = 0; i < comAcento.length; i++) {
      resultado = resultado.replaceAll(comAcento[i], semAcento[i]);
    }
    return resultado.toLowerCase();
  }

  List<TermoPolitico> get _termosFiltrados {
    if (_busca.trim().isEmpty) return _termosOrdenados;
    final busca = _normalizar(_busca.trim());
    return _termosOrdenados.where((t) {
      return _normalizar(t.nome).contains(busca) ||
          _normalizar(t.definicao).contains(busca);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final termos = _termosFiltrados;

    return Scaffold(
      backgroundColor: _fundo,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'EXPLORAR',
                    style: TextStyle(
                      color: _verde,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Dicionário',
                    style: TextStyle(
                      color: _azul,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Entenda os principais termos\nda política e das eleições',
                    style: TextStyle(
                      color: _textoSecundario,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 22),
                  _campoBusca(),
                  const SizedBox(height: 14),
                  Text(
                    termos.length == 1 ? '1 termo' : '${termos.length} termos',
                    style: const TextStyle(
                      color: _textoSecundario,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: termos.isEmpty
                        ? _nenhumResultado()
                        : ListView.builder(
                            padding: const EdgeInsets.only(bottom: 18),
                            itemCount: termos.length,
                            itemBuilder: (context, index) {
                              return cardTermo(
                                context: context,
                                termo: termos[index],
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        // barra inferior
        selectedIndex: 2,
        height: 72,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE8F5EF),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded, color: _verde),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline_rounded),
            selectedIcon: Icon(Icons.people_rounded, color: _verde),
            label: 'Candidatos',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book_rounded, color: _verde),
            label: 'Dicionário',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded, color: _verde),
            label: 'Meu Perfil',
          ),
        ],
        onDestinationSelected: (indice) {
          if (indice == 0) {
            Navigator.pushReplacementNamed(context, RotasApp.home);
          }
          if (indice == 1) {
            Navigator.pushReplacementNamed(context, RotasApp.candidatos);
          }
          if (indice == 2) return;
          if (indice == 3) {
            Navigator.pushReplacementNamed(context, RotasApp.perfil);
          }
        },
      ),
    );
  }

  Widget _campoBusca() {
    return TextField(
      controller: _buscaController,
      onChanged: (valor) => setState(() => _busca = valor),
      style: const TextStyle(color: _azul, fontSize: 15),
      decoration: InputDecoration(
        hintText: 'Buscar termo...',
        hintStyle: const TextStyle(color: _textoSecundario, fontSize: 15),
        prefixIcon: const Icon(Icons.search_rounded, color: _verde),
        suffixIcon: _busca.isEmpty
            ? null
            : IconButton(
                tooltip: 'Limpar',
                icon: const Icon(Icons.close_rounded, color: _textoSecundario),
                onPressed: () {
                  _buscaController.clear();
                  setState(() => _busca = '');
                },
              ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE6EBF1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: _verde, width: 1.5),
        ),
      ),
    );
  }

  Widget _nenhumResultado() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off_rounded, color: _textoSecundario, size: 44),
            SizedBox(height: 12),
            Text(
              'Nenhum termo encontrado',
              style: TextStyle(
                color: _azul,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Tente buscar por outra palavra.',
              style: TextStyle(color: _textoSecundario, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardTermo({
    required BuildContext context,
    required TermoPolitico termo,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          // permite abrir o card inteiro
          borderRadius: BorderRadius.circular(18),
          onTap: () => mostrarDetalhesTermo(context: context, termo: termo),
          child: Container(
            constraints: const BoxConstraints(minHeight: 86),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE6EBF1)),
            ),
            child: Row(
              children: [
                Container(
                  // inicial do termo
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5EF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    termo.nome.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                      color: _verde,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        termo.nome,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: _azul,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        termo.definicao,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: _textoSecundario,
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: _verde,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void mostrarDetalhesTermo({
    required BuildContext context,
    required TermoPolitico termo,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // fecha clicando fora do card
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: _fundo,
          clipBehavior: Clip.antiAlias,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 520,
              maxHeight: MediaQuery.sizeOf(context).height * 0.88,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    // x no canto superior direito
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      tooltip: 'Fechar',
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_rounded, color: _azul),
                    ),
                  ),
                  Center(
                    // ícone
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE8F5EF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.menu_book_rounded,
                        color: _verde,
                        size: 42,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    // nome do termo
                    child: Text(
                      termo.nome,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: _azul,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    // definição
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(color: const Color(0xFFE6EBF1)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'O QUE SIGNIFICA',
                          style: TextStyle(
                            color: _verde,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          termo.definicao,
                          style: const TextStyle(
                            color: _azul,
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded),
                      label: const Text('Voltar ao dicionário'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _verde,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
