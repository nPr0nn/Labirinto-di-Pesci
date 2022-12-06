# Fish! Ball! CAT!!

Projeto da disciplina de engenharia de software (MC426) do segundo semestre de 2022. 
Jogo 2D de puzzle e exploração sobre um peixe de estimação de cientistas do mal, feito com a Godot engine.


## Estilos Arquiteturais

A arquitetura decidida tem como base o estilo de camadas (Layering), e para sua implementação foi adicionado aspectos tanto do estilo
mediador, no que tange a interface entre os arquivos de dados guardados em um diretório de database e as componentes do jogo, quanto
do estilo de objetos na estrutura dos principais componentes do jogo, como entidades que interagem com o jogador. Assim, os estilos arquiteturais utilizados foram: *Camadas*, *Mediador*, *Orientação à objetos* 

## Padrão de Projeto
Com o intuito de resolver um problema geral de projeto um dos principais padrões de projeto adotados foi o *State* pelo qual foi implementado um sistema
de Máquina de Estado Finito no personagem do player no arquivo PlayerScript.gd, de forma a organizar a classe do personagem pois desta forma ela assume comportamentos
diferentes caso o player esteja com o peixe dentro ou fora da água.

## Diagrama de Componentes
Para melhor apresentação da arquitetura utilizada foi usado o modelo C4.

### Nível 1  
No primeiro nível do diagrama é possível observar o contexto em que a aplicação se situa, note que somente ocorre a interação entre o jogador 
e o sistema do jogo. Também é possível perceber que não há interação do sistema do jogo ou do usuário com quaisquer sistemas externos 
à aplicação, visto que o jogo foi desenvolvido dentro de uma Game Engine como o Godot, e portanto o sistema do Godot atua como uma tecnologia para desenvolvimento do software.
Nesse diagrama é possível ver a existencia de um *Software System* chamado Game System, este representa todo o processo realizado pelo jogo.

![Nível 1](img/arquitetrua-1-Level.png) 

### Nível 2

Seguindo para o nível 2 é possível ver o diagrama de conteiners da aplicação. Perceba que aqui já está sendo considerado o estilo de arquitetura principal seguido pela equipe, esse sendo arquitetura em camadas.
Na camada que tem contato com o player (usuário) está a User Interface (UI) que lida com as interações do player
referentes ao menu e suas configurações, permitindo o usuário selecionar suas preferências para customizar o jogo as suas necessidades,
e também referentes aos inputs de controles, teclados e mouses que podem ser usados no jogo. Logo abaixo
existem o Scene manager e o Game Manager que se responsabilizam respectivamente pela organização posicional de cenas e objetos e 
pela renderização do jogo na câmera e progressão da história, os dois containers passam informações entre si para modificar cenas e variaveis constantes entre elas. 
Abaixo está a camada dos Game Objects e suas interações, esses objetos podem receber, das duas databases, assets e 
informações necessarias para a sua construção, eles compõem as cenas dos jogo e podem ser desde leveis, mapas e items até o personagem do player e inimigos.
\
\
De forma resumida, a UI coleta entradas pelo menu e controles e repassa para o Game Manager e o Scene Manager.
O Game Manager apresenta o jogo e registra seu estado, enquanto Scene Manager organiza os objetos do jogo na cenas que está sendo apresentada ao player. 
Ambas classes trocam dados com Game Object, uma abstração de objetos para as entidades do jogo. 
Esse último container recebe dados dos datasets de levels e assets.

![Nível 2](img/arquitetrua-2-Level.png)

### Nível 3

Por fim, para o nível 3, o diagrama quebra os containers em componentes da aplicação e os 
apresenta mais detalhadamente, com uma descrição textual da responsabilidade de cada um e da interação entre dois quaisquer componentes. 
As interações são bem complexas então as imagens e os textos nela explicam melhor por si só. Vale a pena ressaltar também, que as posições verticais dos componentes representam o formato de camadas, sendo elas 4, indo 
do nível mais próximo ao usuário até o nível mais distante.

![Nível 3](img/arquitetrua-3-Level.png)

