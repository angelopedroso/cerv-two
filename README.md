# 📦 Cadastro de Produtos --- Flutter

Aplicação Flutter para cadastro e listagem de produtos utilizando
**MVVM**, **Provider** e **Dependency Injection**.

------------------------------------------------------------------------

## 🧱 Arquitetura

- MVVM (Model -- View -- ViewModel)
- Repository Pattern
- Dependency Injection (DI)
- Provider

------------------------------------------------------------------------

## 📁 Estrutura de Pastas

    lib/
    │── core/
    │   ├── configs/
    │   ├── database/
    │   ├── entities/
    │   ├── errors/
    │   ├── helpers/
    │   ├── models/
    │   ├── utils/
    │   └── widgets/
    │
    │── features/
    │   └── product/
    │       ├── model/
    │       ├── repositories/
    │       ├── services/
    │       ├── view/
    │       └── viewmodel/
    │
    │── dependency_injection.dart
    │── main.dart

------------------------------------------------------------------------

## ▶️ Como rodar o projeto

### 1️⃣ Pré-requisitos

    flutter doctor

### 2️⃣ Clonar o repositório

    git clone https://github.com/seu-usuario/seu-repo.git
    cd seu-repo

### 3️⃣ Instalar dependências

    flutter pub get

### 4️⃣ Executar

    flutter run

------------------------------------------------------------------------

## 🧩 Funcionalidades

- Cadastro de produtos
- Listagem de produtos
- Exclusão de produtos
- Alteração de produtos
- Estado reativo
