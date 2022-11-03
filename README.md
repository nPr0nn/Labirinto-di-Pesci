# Ativer

Projeto da disciplina de engenharia de software (MC426) feito no segundo semestre de 2022. Jogo 2D de exploração submarina feito com a Godot engine


## Arquitetura
A arquitetura se baseia no estilo de quatro camadas do nível mais próximo ao usuário até o nível mais distante dele. Dessa forma, torna -se necessário a utilização do estilo mediador para realizar a interface dos dados entre componentes, de forma a diminuir o conteúdo transmitido entre elas. Além disso, toda a arquitetura é baseada em orientação de objetos para ser construída. Para as partes mais profundas da arquitetura, também foi necessário a utilização de uma fábrica abstrata para poder realizar abstrações de objetos do jogo.
Assim, os padrões utilizados no projeto foram: *Camadas*, *Mediador*, *Abstract factory* e *Orientação à objetos*.



### Nível 1  
No primeiro nível do diagrama C4 observamos o contexto em que a aplicação se situa, note que somente ocorre a interação entre o jogador e o sistema do jogo. Também é possível perceber que não há interação do sistema do jogo ou do usuário com quaisquer sistemas externos a aplicação.   
![Nível 1](img/arquitetrua-1-Level.png)  
### Nível 2
Seguindo para o nível 2 mostra-se o diagrama de conteiners da aplicação. Perceba que aqui já está sendo considerado o estilo de arquitetura princiapal seguido pala equipe, esse sendo arquitetura em camadas. aqui o sistema tem como sua base
![Nível 2](img/arquitetrua-2-Level.png)  
### Nível 3
Para o nível 3 o diagrama apresenta os componentes da aplicação mais detalhadamente, apresentando as interações mais próximas entre os containers. As interações são bem complexas então as imagens explicam melhor por si só.
Vale a pena ressaltar, que as posições dos componentes apresentam o formato de camadas, sendo elas 4: Do nível mais próximo ao usuário até o nível mais distante. 
![Nível 3](img/arquitetrua-3-Level.png)
