# Eventos

Aplicativo para que as pessoas possam ver os eventos que estão acontecendo.

Para este projeto foi utilizado o Cocoapods, para gerenciar a biblioteca utilizada. No projeto foi utilizada a seguinte biblioteca:

- Kingfisher: Biblioteca para fazer o downlod das imagens.

## Instrução

Acessar a pasta do projeto e executar o seguinte comando:

pod install

Com isso a biblioteca será instalada.

Após a instalação abra o xcode -> File -> Open -> Selecione a pasta onde o projeto foi salvo -> Abra o arquivo Events.xcworkspace

Após o projeto aberto é só executar.

### Objetivo do Aplicativo

O aplicativo tem como objetivo de apresentar eventos que estão ocorrendo ou já ocorerram.

### Breve Descrição

Ao abrir o app, demorará alguns segundos para que os eventos apareceram. O usuário, pode clicar em qualquer evento, quando fizer isso será mostrada as informações do mesmo. Na tela dos detalhes o usuário também poderá realizar a rolagem, para que possa visualizar mais informações.

### Funcionalidades Implementadas

- Listagem de Eventos;

- Detalhes de um evento específico;

### Tomadas de Decições

Como o aplicativo não teve um layout definido, então tive que tomar algumas decisões.

- Na tela principal do aplicativo, se o título for muito grande, que ultrapasse os limites da tela, ele é cortado e aparecerá os "..." ao final;

- As fontes e cores do aplicativo deixei as padrões do sistema, isso facilitou a opção de dark mode, quando o usuário estiver com ela habilitada;

- As informações que o aplicativo apresenta, acredito ser as mais importantes;

- Como a API não trás a informação do endereço do evento, apenas as coordenadas geográficas, e a API do google é paga, então optei por utilizar a API nominatim.openstreetmap.org, que me trás várias informações de endereço para a coordenada geográfica;

- Para esse projeto, optei em desenvolver em view code, para não haver problemas de conflito com a storyboard e nem com a xib, e para ter um controle melhor sobre os componentes que estou colocando na tela;

- Optei por não colocar nenhum efeito, pois o tempo do projeto não daria tempo, pois teria que estudar efeitos visuais em view code;

- Para este projeto optei por não separar as classes por cenas, então todas as views controllers estão em ViewController, as views models estão em ViewModel, por não achei necessário difidir em mais pastas, por ser um projeto pequeno.

### Testes

Para executar os testes, com o projeto aberto no Xcode é só pressionar as teclas Command + u.

### Melhorias

Existe uma issue aberta para este projeto, onde podem ser implementada para melhorar a experiência do usuário.
