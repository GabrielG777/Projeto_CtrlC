# Projeto_CtrlFit

# Estrutura do Git Flow

## Branches principais

### `main`

# Como usar na prática

## 1. Inicializar Git Flow

Instale:

```bash id="m5d9vf"
npm install -g git-flow-cli <- copie e cole no teminal
```

# Criando uma feature

## 2. Criar feature

```bash id="n4y1ce"
git flow feature start cadastro-aluno
```

Isso cria:

```text id="a8u2lw"
feature/cadastro-aluno
```

---

## 3. Trabalhar normalmente

```bash id="e6f7mn"
git add .
git commit -m "feat: cria cadastro de aluno"
```

---

## 4. Finalizar feature

```bash id="g9p5xd"
git flow feature finish cadastro-aluno
```

Ele:

* faz merge na `develop`
* remove a feature branch

---

# Criando release

## Iniciar release

```bash id="u2r8ja"
git flow release start 1.0.0
```

## Finalizar release

```bash id="v5k1qs"
git flow release finish 1.0.0
```

Ele:

* mergeia em `main`
* mergeia em `develop`
* cria tag

---

# Criando hotfix

## Iniciar

```bash id="d7w3lb"
git flow hotfix start corrige-api
```

## Finalizar

```bash id="c4m9ze"
git flow hotfix finish corrige-api
```

---

