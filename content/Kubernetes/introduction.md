---
author: thomas claudel
description: Introduction à Kubernetes
Categories:
- Kubernetes
- Clusterisation
- Conteneurisation
tags:
- Kubernetes
- Clusterisation
- Conteneurisation
title: Intro Kubernetes
date: 2020-06-03T12:34:58.000+02:00

---
![](/img/k8s_logo.png)

# Kubernetes, qu'est-ce que c'est ?

Kubernetes aussi appelé k8s est un système d'orchestration de conteneurs, il permet notamment d'automatiser le déploiement de conteneurs et de gérer facilement votre cluster. Quel est l’intérêt d'utiliser kubernetes ?  
Kubernetes permet de gagner beaucoup de temps pour la mise en place d'une application et d'avoir un contrôle le
contrôle sans avoir à bidouiller à la main.

L'objectif de cet intro est de créer votre propre machine virtuelle sur laquelle un cluster minimal avec un node master
et une node slave, ne vous inquiétez pas si tout ceci vous est étranger, nous allons voir tout ça ensemble

## Vagrant

Vagrant ? Je croyais que c'était un tuto kubernetes ?! Pas de panique, ce sera l'outil que l'on va utiliser pour créer notre machine virtuelle, une alternative est d'utiliser Minikube fourni par kubernetes, cependant, c'est littéralement la version démo de kubernetes, c'est pour ceci que nous allons créer une infrastructure plus proche de la réalité : 