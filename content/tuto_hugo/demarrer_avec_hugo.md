---
title: "Démarrer avec HUGO"
date: 2020-06-02T12:13:28+02:00
draft: false
---

# Démarrer avec HUGO

### HUGO, qu'est-ce que c'est ?

HUGO est un générateur de sites web statique open-source développé en Go. 
Le but de dernier est d'être le plus rapide et flexible possible et de rendre le 
développement de ce dernier agréable.

Installer HUGO
==
#### Installer sous Linux :
```bash
  mkdir $HOME/src
  cd $HOME/src
  git clone https://github.com/gohugoio/hugo.git
  cd hugo
  go install --tags extended
```

#### Installer sous MacOs :
```bash
brew install hugo
```

#### Vérification  
Pour voir si tout c'est bien passer, rentrz la commande : 
```
hugo version
```
Elle devrait renvoyer quelque chose comme : `Hugo Static Site ######`

### Créez votre premier site !

Une fois HUGO installé il vous suffit de créer votre site avec la commande : 
```
hugo new site nouveau_site
```
Cette commande va vous créer un nouveau dossier nommé :  
`nouveau_site`  
il aura cette architecture :  
```bash
.
├── archetypes
│   └── default.md
├── config.toml
├── content
├── data
├── layouts
├── static
└── themes
```
Nous allons faire le tour de ces différents dossier :  
- **archetype**  
Ce dossier contient les modeles utilisé pour la création de vos fichiers
le fichier `default.md` : 
> ```
> ---
> title: "{{ replace .Name "-" " " | title }}"
> date: {{ .Date }}
> draft: true
> ---
> ```
Ce fichier servira à déterminer le *Front Matter* (entête de formatage)  
de chacun des fichiers que vous allez créer.
- **assets**  
Quoi un dossier assets ? Je ne lái pas de mon coté, pas de panique, c'est un dossier 









