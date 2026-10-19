import 'package:flutter/material.dart';
import '../../core/rotas/rotas.dart';

class TelaInteresses extends StatefulWidget {
  const TelaInteresses({super.key});
  @override
  State<TelaInteresses> createState() =>
      _TelaInteressesState();
}

class _TelaInteressesState
    extends State<TelaInteresses> {
  List<String> interessesSelecionados = []; //array para selecionar os interesses do usuário
  final List<Map<String, dynamic>> interesses = [ 
    {
      "nome": "Saúde",
      "icone": Icons.favorite
    },
    {
      "nome": "Educação",
      "icone": Icons.school
    },
    {
      "nome": "Segurança",
      "icone": Icons.shield
    },
    {
      "nome": "Transporte",
      "icone": Icons.directions_bus
    },
    {
      "nome": "Emprego",
      "icone": Icons.work
    },
    {
      "nome": "Meio Ambiente",
      "icone": Icons.eco
    },
    {
      "nome": "Moradia",
      "icone": Icons.home
    },
    {
      "nome": "Corrupção",
      "icone": Icons.gavel
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF4F4F4,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () { //direcionamento
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Quais assuntos são mais importantes para você?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.builder(
                  itemCount: interesses.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //qtd colunas
                    crossAxisSpacing: 15, //espaço horizontal entre os cards
                    mainAxisSpacing: 15, //espaço vertical entre os cards
                    childAspectRatio: 1.3, //proporção entre largura e altura
                  ),
                  itemBuilder: (context, index) {
                    final interesse = //recupera o item atual
                        interesses[index];
                    final selecionado = //verifica se esta selecionado
                        interessesSelecionados.contains(
                      interesse["nome"],
                    );
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selecionado) {
                            interessesSelecionados.remove(
                              interesse["nome"],
                            );
                          } else {
                            if (interessesSelecionados.length < 4) { //escolher até 4 itens
                              interessesSelecionados.add(
                                interesse["nome"],
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar( //msg para o usuário 
                                  const SnackBar(
                                    content: Text(
                                      "Você pode selecionar no máximo 4 interesses.",
                                    ),
                                    duration: Duration(
                                      seconds: 5,
                                    ),
                                  ),
                                ),
                            },
                          },
                        },
                        ),
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(16),
                          border: Border.all(
                            color: selecionado
                                ? Colors.green
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            Icon(
                              interesse["icone"],
                              size: 40,
                              color: selecionado
                                  ? Colors.green
                                  : Colors.black,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              interesse["nome"],
                              textAlign:
                                  TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.bold,
                                color: selecionado
                                    ? Colors.green
                                    : Colors.black,
                              ),
                            ),
                            if (selecionado)
                              const Padding(
                                padding:
                                    EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(

                    backgroundColor:
                        const Color(
                      0xFF4B8D63,
                    ),
                    shape:
                        RoundedRectangleBorder(

                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (interessesSelecionados.length < 2) { //min 2 interesses
                      ScaffoldMessenger.of(context)
                        .showSnackBar(
                          const SnackBar(
                            content: Text(
                            "Selecione pelo menos 2 interesses.",
                          ),
                        ),
                      );
                      return;
                    }
                    print(interessesSelecionados);
                    Navigator.pushNamed(
                      context,
                      RotasApp.home,
                    );
                  },
                  child: const Text(
                    "Continuar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
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