---
author: thomas claudel
Description: Démarrer avec Hugo
categories:
- Hugo
- CMS
tags:
- Hugo
- CMS
title: Démarrer avec HUGO
date: 2020-06-02T12:13:28.000+02:00

---
![https://gohugo.io/](/img/hugo_logo.png)

HUGO est un générateur de site web statique open-source développé en Go.
Le but de ce dernier est d'être le plus rapide et flexible possible et de rendre le
développement de ce dernier agréable.

# Installer HUGO

#### Installer sous Linux :

```bash
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
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

Pour voir si tout c'est bien passer, rentrez la commande :

    hugo version

Elle devrait renvoyer quelque chose comme : `Hugo Static Site ######`

# Créez votre premier site !

Une fois HUGO installé il vous suffit de créer votre site avec la commande :

    hugo new site nouveau_site
    cd nouveau_site

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

Faisons le tour des dossiers principalement utilisés

* **archetype**  
  Ce dossier contient les modèles utilisé pour la création de vos fichiers
  le fichier `default.md` :

>     ---
>     title: "{{ replace .Name "-" " " | title }}"
>     date: {{ .Date }}
>     draft: true
>     ---

Ce fichier servira à déterminer le _Front Matter_ (entête de formatage)  
de chacun des fichiers que vous allez créer.

* **assets**  
  Quoi un dossier assets ? Je ne l'ai pas de mon côté, pas de panique, c'est un dossier
  optionnel, où vous pourrez mettre vos photos, etc.
* **config**  
  C'est ici que vous trouverez tous les fichiers de configurations JSON, YAML ou TOML.
* **content**
  C'est le dossier principal du projet, vous écrirez tout ce qui sera publié sur ce site ici,
  vous aurez des catégories représentée par les différents dossiers ci-dessous par exemple content/articles,
  content/contact

Pour vérifier que tout c'est bien passé nous allons lancer notre site pour la première fois !

```bash
hugo server
```

Vous pouvez voir la construction de votre site :

```bash
Building sites … WARN 2020/06/02 15:29:01 found no layout file for "HTML" for kind "home": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
WARN 2020/06/02 15:29:01 found no layout file for "HTML" for kind "taxonomyTerm": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
WARN 2020/06/02 15:29:01 found no layout file for "HTML" for kind "taxonomyTerm": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.

                   | EN  
-------------------+-----
  Pages            |  3  
  Paginator pages  |  0  
  Non-page files   |  0  
  Static files     |  0  
  Processed images |  0  
  Aliases          |  0  
  Sitemaps         |  1  
  Cleaned          |  0  

Built in 2 ms
Watching for changes in /home/tclaudel/blog/nouveau_site/{archetypes,content,data,layouts,static}
Watching for config changes in /home/tclaudel/blog/nouveau_site/config.toml
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

rendez vous sur l'addresse localhost indiquée, par défaut : [http://localhost:1313/](http://localhost:1313/).
Elle est pas belle cette magnifique page blanche ? Pas de soucis à vous faire c'est tout à fait normal, regardez plus haut
les WARN affichés dans votre console, ils vous indiquent qu'il ne trouve pas de template, alors ajoutons lui en un !

# Installer un template

Nous allons découvrir comment ajouter un thème à votre site en HUGO, vous pouvez en trouver de partout sur internet,
cependant je vous conseille de trouver le vôtre sur [https://themes.gohugo.io/](https://themes.gohugo.io/), c'est le
répertoire officiel des thèmes HUGO, c'est un gage de compatibilité et de qualité. Choisissez en un et cliquez sur
download, vos allez-vous retrouver sur le dossier _github_ où est présent le code source du thème, pas de panique vous
aurez juste besoin de récupérer cet url.
pour cet exemple nous allons utiliser : [https://github.com/budparr/gohugo-theme-ananke](https://github.com/budparr/gohugo-theme-ananke)
Pour installer ce thème :

* Rendez-vous à la racine de votre projet
* Rentre les commandes suivantes en remplaçant l'URL par celle de la page github :

```bash
# Initialisation de git
git init
# Importation du thème dans notre dossier thème
git submodule add https://github.com/budparr/gohugo-theme-ananke themes/ananke
```

A présent nous allons toucher à la configuration pour indiquer le thème. À la racine du projet, il y a un fichier `config.toml`
c'est le fichier de configuration principal de notre site :  `cat ./config.toml`

```toml
baseURL = "http://example.org/" # Nom de l'hote pour la mise en production
languageCode = "en-us"
title = "My New Hugo Site"
```

Nous allons changer le contenu par :

```toml
baseURL = "http://example.org/" # Nom de l'hote pour la mise en production
languageCode = "fr" # Passage du site en français
title = "Mon site" # Changement du titre
theme = "ananke" # nom du dossier du theme tout juste importé
```

Pour voir le résultat :

```bash
hugo server
```

Normalement vous obtenez un site vide mais avec le thème visible.

# Création du premier article

La commande principale pour créer du contenu est la suivante :

```bash
hugo new articles/premier_article.md
```

cette commande va créer une page premier_article dans la catégorie articles avec une extension **.md**, cette extension
indique que ce fichier est markdown, qui permet de générer du code html à partir de code très comprehensible, je vous
renvoie vers cet excellent tutoriel d'openclassroom sur le sujet : [cours markdown](https://openclassrooms.com/fr/courses/1304236-redigez-en-markdown)

Une fois ceci fait allons voir le fichier crée à : `./content/articles/premier_article.md`

>     ---
>     title: "Premier_article"
>     date: 2020-06-02T18:12:54+02:00
>     draft: true
>     ---

Comme vous pouvez le voir il y a un en-tête déjà présent, il contient différentes informations, le titre, la date de la
dernière modification et le status : draft, si `draft: true` votre page est un brouillon et ne les plus si vous modifiez
par  `draft: false`.

Vous pouvez écrire en dessous le contenu de la pages en utilisant la syntaxe markdown :

>     ---
>     title: "Premier_article"
>     date: 2020-06-02T18:12:54+02:00
>     draft: true
>     ---
>     
>     Bienvenu sur mon premier article

Vous pouvez relancer votre serveur pour voir votre magnifique article apparaitre !

```bash
hugo server -D
```

le -D sers à signifier que vous voulez voir tous les articles y compris ceux au status de brouillon.

Vous verrez ainsi apparaitre votre premier article !  
et votre application à une arborescence semblable à ceci :

```bash 
.
├── archetypes
│   └── default.md
├── config.toml
├── content
│   └── articles
│       └── premier_article.md
├── data
├── layouts
├── resources
│   └── _gen
│       ├── assets
│       └── images
├── static
└── themes
    └── ananke
        ***
```

Vous avez désormais toutes les bases pour créer votre premier site en HUGO