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

_source :_ [_https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker/6211306-decouvrez-les-conteneurs#/id/r-6231662_](https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker/6211306-decouvrez-les-conteneurs#/id/r-6231662 "https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker/6211306-decouvrez-les-conteneurs#/id/r-6231662")

Sur le schéma si dessus vous pouvez voir la différence entre les machines virtuelles (VM) et un conteneurs, il y a des **différences fondamentales** qui n'apparaissent pas forcément au premier regard.

Avec une VM, on recrée un système complet dans le système de son hôte, la machine met donc du temps pour démarrer et réserve des ressources (CPU/RAM) sur le système hôte, ceci possède des avantages et des inconvénients. Les avantages sont que **la VM est totalement isolée de son hôte** et d'autres part les ressources réservées lui sont garanties. Cependant d'un autre côté les VM mettent du temps pour démarrer et sont beaucoup plus lourdes car des ressources de la machines lui sont réservées même si elles sont inutilisées

Au contraire les conteneurs sont des processus isolés du système et très léger. De plus les conteneurs **partagent le même système kernel**, il n'y a donc pas besoin d'installer un système d'exploitation complet. Les conteneurs ne réservent que les ressources nécessaires ainsi si nous allouons 10 Go de RAM au conteneur mais qu'il n'en a besoin que de 4, le reste sera toujours disponible pour d'autres tâches. Au niveau du démarrage, les ressources sont isolées et non virtualisée ce qui permet de démarrer beaucoup plus rapidement !

#### Pourquoi utiliser des conteneurs ?

Les conteneurs sont de plus en plus utilisés car ils permettent de réduire les coûts, être plus scalable tout en raccourcissant le cycle de développement

Cependant bien qu'étant des technologies proches l'une de l'autre, celles-ci restent des outils complémentaires à utiliser à bon escient

# Vous allez voir c'est genial !