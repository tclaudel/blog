---
author: thomas claudel
description: Introduction à Docker
categories:
- Docker
- Conteneurisation
tags:
- Docker
- Conteneurisation
title: Introduction à Docker
date: 2020-09-25T09:48:05.000+02:00

---
# Découverte des conteneurs

Dans cette partie nous allons découvrir la notion de conteneurs et la différence avec les machines virtuelles.

### La différence entre machine virtuelle et conteneur

![](/15577645779374_vm-vs-conteneur.png)

*source : [_https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker/6211306-decouvrez-les-conteneurs#/id/r-6231662_](https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker/6211306-decouvrez-les-conteneurs#/id/r-6231662 "https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker/6211306-decouvrez-les-conteneurs#/id/r-6231662")*

Sur le schéma si dessus vous pouvez voir la différence entre les machines virtuelles (VM) et un conteneurs, il y a des 
**différences fondamentales** qui n'apparaissent pas forcément au premier regard.

Avec une VM, on recrée un système complet dans le système de son hôte, la machine met donc du temps pour démarrer et 
réserve des ressources (CPU/RAM) sur le système hôte, ceci possède des avantages et des inconvénients. Les avantages sont que **la VM est totalement isolée de son hôte** et d'autres part les ressources réservées lui sont garanties. Cependant d'un autre côté les VM mettent du temps pour démarrer et sont beaucoup plus lourdes car des ressources de la machines lui sont réservées même si elles sont inutilisées

Au contraire les conteneurs sont des processus isolés du système et très léger. De plus les conteneurs **partagent le même système kernel**, il n'y a donc pas besoin d'installer un système d'exploitation complet. Les conteneurs ne réservent que les ressources nécessaires ainsi si nous allouons 10 Go de RAM au conteneur mais qu'il n'en a besoin que de 4, le reste sera toujours disponible pour d'autres tâches. Au niveau du démarrage, les ressources sont isolées et non virtualisée ce qui permet de démarrer beaucoup plus rapidement !

#### Pourquoi utiliser des conteneurs ?

Les conteneurs sont de plus en plus utilisés car ils permettent de réduire les coûts, être plus scalable tout en raccourcissant le cycle de développement

Cependant bien qu'étant des technologies proches l'une de l'autre, celles-ci restent des outils complémentaires à utiliser à bon escient

# Installer Docker

##### Linux

```bash
$ sudo apt-cache search socker.io
$ sudo apt-get install docker.io
```

##### MacOs

https://docs.docker.com/docker-for-mac/install/

##### Windows

https://docs.docker.com/docker-for-windows/install/

Pour vérifier si l'instalation c'est bien passée
```bash
$ docker
```
Le retour de cette fonction devrait être la liste des commandes possibles avec docker

le commande de base pour lister les conteneurs docker presents sur la machine :
```
$ docker ps
```

Pour débuter rendez vous sur [docker hub](https://hub.docker.com/), c'est le site de partage d'image docker.
Pour bien comprendre le fonctionnement, nous allons créer des images à partir de l'image la plus légère qui soit : alpine linux
Pour télécharger cette image :
```bash
$ docker pull alpine:latest # :latest faisant appel à la dernière version
```
pour lancer votre premier conteneur avec l'image alpine exécutez :
```bash
$ docker run alpine:latest
```
Et là que se passe t'il ?
rien en apparence même un `docker ps` ne nous indique rien, cependant un `docker ps -a` nous indique ceci :
```bash
$ docker ps -a # -a pour all
CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS
df83aceb384a        alpine:latest       "/bin/sh"                About a minute ago   Exited (0) About a minute ago
```
Le retour de cette commande nous indique qu'il y a une minute, le conteneur a été lancé, a éxécuté "/bin/sh", puis a exit.
Comment faire pour utiliser cette image ?
nous allons ajouter des flags à l'éxécution pour pouvoir interagir avec notre conteneur
```bash
$ docker run -d -i --name exemple alpine:latest
# -d indique d'éxécuter le conteneur en arrière plan
# -i pour interactif pour pouvoir interagir avec ce conteneur
# --name "nom" pour nommer le conteneur comme l'on le souhaite
714a760b608f25f87233ede1f9ec839958b7712c394b8188f258ac6914648d65
```
la chaine de caractère retournée est l'identifiant du conteneur, on peut désormais vérifier que le conteneur existe.
```bash
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
714a760b608f        alpine:latest       "/bin/sh"           3 minutes ago       Up 3 minutes                            exemple

```
Et là on peut voir que son status est à Up, on peut donc commencer à interagir avec lui !


