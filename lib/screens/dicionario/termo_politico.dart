class TermoPolitico {
  final String nome;
  final String definicao;

  const TermoPolitico({required this.nome, required this.definicao});
}

const List<TermoPolitico> dicionarioPolitico = [
  TermoPolitico(
    nome: "Boca de urna",
    definicao: "Tentativa de convencer o eleitor a votar em um candidato no dia da votação, perto dos locais de votação. É proibida pela lei eleitoral e pode ser punida como crime.",
  ),
  TermoPolitico(
    nome: "Primeiro turno",
    definicao: "Primeira rodada de votação de uma eleição majoritária. Vence já nessa etapa quem obtiver mais da metade dos votos válidos.",
  ),
  TermoPolitico(
    nome: "Segundo turno",
    definicao: "Nova votação entre os dois candidatos mais votados, quando ninguém atinge mais de 50% dos votos válidos no primeiro turno. Vale para Presidente, governadores e prefeitos de cidades com mais de 200 mil eleitores.",
  ),
  TermoPolitico(
    nome: "Senador",
    definicao: "Representante de um estado no Senado Federal. Cada estado e o Distrito Federal elegem 3 senadores, que têm mandato de 8 anos. Eles votam leis, fiscalizam o governo, aprovam autoridades indicadas (como ministros do STF) e julgam o Presidente em processos de impeachment.",
  ),
  TermoPolitico(
    nome: "Deputado federal",
    definicao: "Representante do povo na Câmara dos Deputados, com mandato de 4 anos. Propõe e vota leis nacionais, fiscaliza o governo e analisa o orçamento da União. São 513 cadeiras, distribuídas entre os estados conforme a população.",
  ),
  TermoPolitico(
    nome: "Deputado estadual",
    definicao: "Representante do povo na Assembleia Legislativa do estado, com mandato de 4 anos. Cria leis estaduais, fiscaliza o governador e discute o orçamento do estado.",
  ),
  TermoPolitico(
    nome: "Vereador",
    definicao: "Representante do povo na Câmara Municipal, com mandato de 4 anos. Cria leis municipais, fiscaliza a prefeitura e analisa o orçamento da cidade.",
  ),
  TermoPolitico(
    nome: "Prefeito",
    definicao: "Chefe do Poder Executivo do município, com mandato de 4 anos. Administra a cidade, executa o orçamento e cuida de serviços como saúde básica, escolas de ensino infantil e fundamental, e transporte local.",
  ),
  TermoPolitico(
    nome: "Governador",
    definicao: "Chefe do Poder Executivo do estado, com mandato de 4 anos. Administra o estado e comanda áreas como segurança pública (polícias), rodovias estaduais e parte da saúde e da educação.",
  ),
  TermoPolitico(
    nome: "Presidente da República",
    definicao: "Chefe de Estado e de governo do Brasil, eleito para mandato de 4 anos. Administra a União, sanciona ou veta leis, nomeia ministros e comanda as Forças Armadas.",
  ),
  TermoPolitico(
    nome: "Vice",
    definicao: "Candidato que concorre na mesma chapa do titular (Presidente, governador ou prefeito). Substitui o titular em caso de impedimento ou o sucede se o cargo ficar vago.",
  ),
  TermoPolitico(
    nome: "Suplente",
    definicao: "Pessoa que assume a vaga de um parlamentar quando ele se afasta ou deixa o cargo. Nas eleições proporcionais, são os candidatos mais votados logo depois dos eleitos. No Senado, cada senador é eleito com 2 suplentes.",
  ),
  TermoPolitico(
    nome: "Mandato",
    definicao: "Período em que o eleito exerce legalmente o cargo para o qual foi escolhido pelo voto.",
  ),
  TermoPolitico(
    nome: "Reeleição",
    definicao: "Possibilidade de o ocupante de um cargo no Executivo (Presidente, governador ou prefeito) disputar novamente o mesmo cargo para o período seguinte. É permitida uma única vez consecutiva.",
  ),
  TermoPolitico(
    nome: "Voto em branco",
    definicao: "Voto em que o eleitor aperta a tecla \"branco\" na urna, sem escolher nenhum candidato. Não é contado como voto válido.",
  ),
  TermoPolitico(
    nome: "Voto nulo",
    definicao: "Voto em que o eleitor digita um número que não corresponde a nenhum candidato. É invalidado e não entra no cálculo do vencedor. Muitos votos nulos não anulam a eleição.",
  ),
  TermoPolitico(
    nome: "Votos válidos",
    definicao: "Soma dos votos dados a candidatos e legendas. Os votos em branco e nulos não entram nessa conta, que é a base para saber quem venceu.",
  ),
  TermoPolitico(
    nome: "Abstenção",
    definicao: "Quando o eleitor deixa de comparecer para votar. Não é um voto, e a ausência precisa ser justificada à Justiça Eleitoral.",
  ),
  TermoPolitico(
    nome: "Voto obrigatório e facultativo",
    definicao: "O voto é obrigatório para quem tem de 18 a 70 anos. É facultativo (opcional) para jovens de 16 e 17 anos, pessoas com 70 anos ou mais e analfabetos.",
  ),
  TermoPolitico(
    nome: "Título de eleitor",
    definicao: "Documento que comprova o alistamento eleitoral e habilita o cidadão a votar. Informa a zona e a seção onde ele vota.",
  ),
  TermoPolitico(
    nome: "Zona eleitoral",
    definicao: "Divisão territorial da Justiça Eleitoral, que reúne vários locais de votação e é responsável pelo cadastro e pela organização das eleições naquela região.",
  ),
  TermoPolitico(
    nome: "Seção eleitoral",
    definicao: "Local específico, dentro de um local de votação, onde fica a urna e onde um grupo determinado de eleitores vota.",
  ),
  TermoPolitico(
    nome: "Urna eletrônica",
    definicao: "Equipamento em que o eleitor registra o voto digitando o número do candidato. Ao final, ela emite o boletim de urna com o total de votos daquela seção.",
  ),
  TermoPolitico(
    nome: "Justiça Eleitoral",
    definicao: "Ramo do Judiciário que organiza e fiscaliza as eleições, cuida do cadastro de eleitores, registra candidaturas, apura os votos e julga conflitos eleitorais. É formada pelo TSE, pelos TREs, por juízes e por juntas eleitorais.",
  ),
  TermoPolitico(
    nome: "TSE",
    definicao: "Tribunal Superior Eleitoral, órgão máximo da Justiça Eleitoral. Define regras de aplicação da lei eleitoral, coordena as eleições nacionais e divulga os resultados.",
  ),
  TermoPolitico(
    nome: "Ministério Público Eleitoral",
    definicao: "Parte do Ministério Público que fiscaliza o cumprimento da lei eleitoral, atua contra crimes eleitorais e defende a regularidade do processo de votação.",
  ),
  TermoPolitico(
    nome: "Partido político",
    definicao: "Organização de pessoas que compartilham ideias e projetos para o país e que disputa eleições. No Brasil, é obrigatório ser filiado a um partido para se candidatar.",
  ),
  TermoPolitico(
    nome: "Coligação",
    definicao: "Aliança temporária entre partidos para disputar uma eleição. Hoje só é permitida nas eleições majoritárias (Presidente, governador, prefeito e senador), e não mais nas proporcionais.",
  ),
  TermoPolitico(
    nome: "Federação partidária",
    definicao: "União de dois ou mais partidos que passam a atuar como um só, em todo o país, por no mínimo 4 anos. Vale tanto para a eleição quanto para a atuação no Legislativo.",
  ),
  TermoPolitico(
    nome: "Fundo partidário",
    definicao: "Recurso público distribuído aos partidos para manter suas atividades ao longo do ano, como aluguel de sedes, formação política e pagamento de despesas.",
  ),
  TermoPolitico(
    nome: "Fundo eleitoral",
    definicao: "Recurso público repassado aos partidos para financiar as campanhas eleitorais. Seu nome oficial é Fundo Especial de Financiamento de Campanha (FEFC).",
  ),
  TermoPolitico(
    nome: "Horário eleitoral gratuito",
    definicao: "Espaço no rádio e na TV, durante a campanha, cedido gratuitamente a partidos e candidatos para apresentar propostas. O tempo de cada um depende do tamanho da bancada do partido na Câmara.",
  ),
  TermoPolitico(
    nome: "Propaganda eleitoral",
    definicao: "Conjunto de ações usadas por candidatos e partidos para pedir votos, como comícios, materiais impressos, anúncios e publicações. Só pode ser feita no período e da forma que a lei permite.",
  ),
  TermoPolitico(
    nome: "Santinho",
    definicao: "Pequeno material impresso de campanha com foto, nome e número do candidato, distribuído aos eleitores.",
  ),
  TermoPolitico(
    nome: "Cabo eleitoral",
    definicao: "Pessoa que trabalha na campanha de um candidato ou partido para conseguir votos, distribuindo materiais e conversando com eleitores.",
  ),
  TermoPolitico(
    nome: "Pesquisa eleitoral",
    definicao: "Levantamento que mede a intenção de voto da população. Precisa ser registrada na Justiça Eleitoral antes de ser divulgada, e mostra uma estimativa, não o resultado da eleição.",
  ),
  TermoPolitico(
    nome: "Sistema majoritário",
    definicao: "Modelo em que vence quem recebe mais votos. É usado para Presidente, governador, prefeito e senador.",
  ),
  TermoPolitico(
    nome: "Sistema proporcional",
    definicao: "Modelo em que as cadeiras são distribuídas entre os partidos conforme os votos que recebem, e depois ocupadas pelos candidatos mais votados de cada um. É usado para deputados federais, estaduais e vereadores.",
  ),
  TermoPolitico(
    nome: "Quociente eleitoral",
    definicao: "Número obtido dividindo-se os votos válidos pelo total de vagas em disputa. Serve de base para definir quantas cadeiras cada partido ou federação conquistou na eleição proporcional.",
  ),
  TermoPolitico(
    nome: "Cláusula de barreira",
    definicao: "Regra que exige um desempenho mínimo nas eleições (em votos e em número de deputados) para o partido ter acesso ao fundo partidário e ao tempo gratuito de rádio e TV. Também é chamada de cláusula de desempenho.",
  ),
  TermoPolitico(
    nome: "Ficha Limpa",
    definicao: "Lei Complementar 135/2010, que torna inelegíveis por determinado período pessoas condenadas por órgão colegiado ou que tiveram o mandato cassado, entre outros casos, para evitar candidaturas de quem tem histórico de irregularidades.",
  ),
  TermoPolitico(
    nome: "Plebiscito",
    definicao: "Consulta feita à população antes de uma lei ou decisão ser criada, para que o povo decida se concorda com a ideia.",
  ),
  TermoPolitico(
    nome: "Referendo",
    definicao: "Consulta feita à população depois de uma lei ou decisão já ter sido aprovada, para que o povo a confirme ou rejeite.",
  ),
  TermoPolitico(
    nome: "Impeachment",
    definicao: "Processo político e jurídico que pode afastar do cargo autoridades acusadas de crime de responsabilidade. No caso do Presidente, a Câmara autoriza a abertura do processo e o Senado faz o julgamento.",
  ),
  TermoPolitico(
    nome: "Poder Executivo",
    definicao: "Poder responsável por administrar o país, o estado ou o município e executar as leis. É exercido pelo Presidente, governadores e prefeitos, com seus ministros e secretários.",
  ),
  TermoPolitico(
    nome: "Poder Legislativo",
    definicao: "Poder que cria as leis e fiscaliza o Executivo. É formado pelo Congresso Nacional (Câmara e Senado), pelas Assembleias Legislativas e pelas Câmaras Municipais.",
  ),
  TermoPolitico(
    nome: "Poder Judiciário",
    definicao: "Poder que interpreta as leis e julga conflitos. Inclui o Supremo Tribunal Federal (STF), os tribunais superiores, os tribunais estaduais e federais e os juízes de primeira instância.",
  ),
  TermoPolitico(
    nome: "Emenda constitucional",
    definicao: "Proposta aprovada pelo Congresso para alterar o texto da Constituição. Exige votação em dois turnos em cada Casa, com apoio de pelo menos três quintos dos parlamentares.",
  ),
  TermoPolitico(
    nome: "Medida provisória",
    definicao: "Norma com força de lei editada pelo Presidente em casos de urgência e relevância. Vale imediatamente, mas precisa ser aprovada pelo Congresso em até 120 dias, senão perde a validade.",
  ),
  TermoPolitico(
    nome: "CPI",
    definicao: "Comissão Parlamentar de Inquérito, criada pelo Legislativo para investigar um fato determinado por um prazo certo. Tem poderes de investigação, como convocar testemunhas e pedir documentos, e envia suas conclusões ao Ministério Público.",
  ),
];
