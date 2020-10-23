---
Author: "thomas claudel"
Description: ""
Categories:
    - gitops
    - devops
Tags:
    - gitops
    - devops
title: "GitOps Introduction"
date: 2020-10-23T10:44:45+02:00
draft: False
---
# Introduction à GitOps

## Qu'est-ce que GitOps ?

GitOps est un concept introduit en 2017 par "Weave".
Le principe de GitOps rejoint celui d'infrastructure as code, avec des contraintes qui définissent des bonnes pratiques.  
Ces deux principes reposent en grande partie sur la formulation déclarative de l'infrastructure. Avec l'usage d'outils 
tels que Ansible, Chef/Puppet, Terraform, Salt, et bien sûr Kubernetes.

De ce fait, les opération manuelles via ssh ou kubectl sont proscrites. Tout changement doit être écrit de manière 
déclarative via un outils de provisionnement ou de déploiement.

## Les spécificitées de GitOps

GitOps se base sur Git, c'est-à-dire que notre dépôt git est notre source de vérité absolue, cela nous incite à utiliser
git pour effectuer nos déploiements habituels via du "Continuous Deployment"

La notion de convergence est également un point important du GitOps. Étant donné que notre dépôt git est notre source,
il faut faire en sorte que nos déploiements soit le plus proche de l'état décrit dans git. Cela passe par la supervision
 active de notre infrastructure et du report des divergences constatées.
 
## Les bonnes pratiques de git

Tous nos environnements sont écrits de manière déclarative. Cela apporte les avantages d'un VCS(Version Control System) 
classique, notamment la possibilité de rollback et d'avoir un historique clair de nos modifications.

On peut ajouter à cela le [1er point des 12 Factors](https://12factor.net/dev-prod-parity) interdisant de démultiplier 
les branches ou les dépôts décrivant plusieurs environnements d'un même déploiement. Par exemple, il est inconcevable de
maintenir une branche "pré-prod" avec les spécificités de votre environnement de préproduction à l'intérieur.

Les bonnes pratiques conseillent plûtot de décrire tous les environnements dans votre branche principale. Ainsi, vous 
devrez modifier tous vos environnements en même temps et vous n'aurez plus à maintenir les spécificités de votre 
environnement à part.

Attention cela n'interdit absolument pas de créer d'autres branches pour vos nouvelles fonctionnalités. Vous pouvez bien
entendu applikers des workflows tels que le Git Flow, le Github Flow, le GitLab flow ou bien tout autre dérivé collant 
plus à votre utilisation et votre équipe.

Sur Kubernetes, il est possible d'utiliser l'outil "Kustomize" pour faire ça. Il est natif à "kubectl" et propose un 
système d'overlay. Pour faire court : on décrit notre base et on vient appliquer des patchs. Souvent, on décrit un 
overlay décrivant différents patchs pour passer de notre base commune aux spécificités de notre environnement.

## Les différentes stratégies de Développement continu

Pour l'étape de "Contious Developement", il faut distinguer deux stratégies différentes:

- La stratégie ***push***, plus traditionnelle, consiste à se servir de sa forge pour "push" les modifications qu'on 
vient d'effectuer dans git.
- La stratégie ***pull*** consiste à laisser l'infrastructure s'auto-gérer et à tout seul "pull" le dépot git et se 
l'auto-appliquer. Cela permet notamment de s'abstraire de la forge pour la partie CD ce qui implique moins de vendors 
[lock-in](https://fr.wikipedia.org/wiki/Enfermement_propri%C3%A9taire). Certaines solutions imposent néanmoins la 
plateforme sur laquelle notre dépot git doit être hébergé, comme GitHub ou GitLab par exemple.
 


