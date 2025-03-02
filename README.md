# fabrica_software_dasafio

# Cat App

## Visão Geral
Cat App é um aplicativo Flutter que permite aos usuários gerenciar uma lista de gatos. Os usuários podem adicionar, editar e excluir registros de gatos, bem como visualizar imagens aleatórias de gatos obtidas de uma API externa.

## Funcionalidades
- **Adicionar Gato**: Usuários podem adicionar um novo gato com detalhes como nome, idade, cor, raça e peso.
- **Editar Gato**: Usuários podem editar os detalhes de um gato existente.
- **Excluir Gato**: Usuários podem excluir um gato da lista.
- **Visualizar Imagens de Gatos**: Usuários podem visualizar imagens aleatórias de gatos obtidas de uma API externa.

## Estrutura do Projeto
O projeto está estruturado da seguinte forma:
- `lib/Screens/Home.dart`: A tela principal que exibe a lista de gatos e opções de navegação.
- `lib/Screens/CatRegistration.dart`: A tela para adicionar e editar detalhes dos gatos.
- `lib/Screens/ImageCatScreen.dart`: A tela para visualizar imagens aleatórias de gatos.
- `lib/models/CatModel.dart`: A classe modelo que representa um gato.
- `lib/database/Database_helper.dart`: A classe auxiliar de banco de dados para gerenciar operações do SQLite.
- `lib/main.dart`: O ponto de entrada do aplicativo.

## Dependências
- `cupertino_icons`: Biblioteca de design de material do Flutter.
- `sqflite`: Plugin SQLite para Flutter.
- `path_provider`: Biblioteca de manipulação de caminhos para Dart.
- `http`: Cliente HTTP para Dart.

## Começando
1. **Clone o repositório**:
    ```sh
    git clone <repository-url>
    ```
2. **Navegue até o diretório do projeto**:
    ```sh
    cd fabrica_software_dasafio
    ```
3. **Instale as dependências**:
    ```sh
    flutter pub get 
    ```
4. **Execute o aplicativo**:
    ```sh
    flutter run
    ```