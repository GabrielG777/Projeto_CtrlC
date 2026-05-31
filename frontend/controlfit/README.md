# ControlFit

Aplicativo mobile desenvolvido em Flutter utilizando Clean Architecture + Feature First.

A ideia principal do projeto foi criar uma aplicação organizada, escalável e fácil de manter conforme o sistema crescer.

---

# Tecnologias Utilizadas

## Flutter

Framework utilizado para desenvolvimento mobile multiplataforma.

Escolhi Flutter porque:

* possui ótima performance
* permite reutilização de código
* desenvolvimento rápido
* UI extremamente customizável
* excelente para aplicações modernas

---

# Arquitetura Utilizada

## Clean Architecture

O projeto foi estruturado utilizando Clean Architecture para separar responsabilidades dentro da aplicação.

A principal ideia é:

* UI separada da regra de negócio
* regra de negócio separada da fonte de dados
* código desacoplado
* facilidade de manutenção
* maior escalabilidade

---

# Padrão Feature First

Além da Clean Architecture, o projeto também utiliza Feature First.

Ou seja:

cada módulo do sistema possui sua própria estrutura interna.

Exemplo:

* auth
* home
* trainer
* workouts

Isso evita:

* arquivos gigantes
* acoplamento excessivo
* dificuldade de manutenção

E facilita:

* organização
* localização de arquivos
* evolução do projeto
* trabalho em equipe

---

# Estrutura do Projeto

```bash id="nl9x4j"
lib/
│   main.dart
│
├───core
│   ├───constants
│   ├───errors
│   ├───theme
│   │       app_colors.dart
│   │
│   ├───utils
│   └───widgets
│
├───features
│   │
│   ├───auth
│   │   ├───data
│   │   │   ├───datasources
│   │   │   ├───models
│   │   │   └───repositories
│   │   │
│   │   ├───domain
│   │   │   ├───entities
│   │   │   ├───repositories
│   │   │   └───usecases
│   │   │
│   │   └───presentation
│   │       ├───controllers
│   │       ├───pages
│   │       │       login_page.dart
│   │       │       register_page.dart
│   │       │
│   │       ├───states
│   │       └───widgets
│   │               login_form.dart
│   │               login_header.dart
│   │               user_type_selector.dart
│   │
│   ├───home
│   │   └───presentation
│   │       ├───controllers
│   │       │       home_controller.dart
│   │       │
│   │       ├───pages
│   │       │       home_page.dart
│   │       │       profile_page.dart
│   │       │
│   │       └───widgets
│   │               app_bottom_navigation.dart
│   │               home_content.dart
│   │               home_header.dart
│   │               hydration_tip_card.dart
│   │               recent_workout_card.dart
│   │               stat_card.dart
│   │               workout_carousel.dart
│   │               workout_carousel_card.dart
│   │
│   ├───trainer
│   │   └───presentation
│   │       ├───pages
│   │       │       create_workout_page.dart
│   │       │       trainer_home_page.dart
│   │       │
│   │       └───widgets
│   │               activity_card.dart
│   │               quick_action_card.dart
│   │               student_card.dart
│   │               student_carousel.dart
│   │               trainer_header.dart
│   │               trainer_home_content.dart
│   │               trainer_stat_card.dart
│   │
│   └───workouts
│       ├───data
│       ├───domain
│       └───presentation
│           ├───pages
│           │       workout_detail_page.dart
│           │
│           └───widgets
│                   exercise_card.dart
│                   start_workout_button.dart
│                   workout_detail_content.dart
│                   workout_header_card.dart
│                   workout_info_chip.dart
```

---

# Motivo da Estrutura

Essa estrutura foi escolhida pensando em:

* crescimento do projeto
* facilidade de manutenção
* componentização
* reutilização
* organização
* escalabilidade
* legibilidade do código

---

# Próximos Passos da Estrutura

Estrutura preparada para:

* API REST
* Firebase
* banco local
* gerenciamento de estado
* injeção de dependência
* testes unitários
* persistência de sessão
* cache local
* notificações
* websocket
* CI/CD
