---
Author: "thomas claudel"
Description: ""
Categories:
    -
Tags:
    -
title: "FluxCD"
date: 2020-10-23T10:44:45+02:00
draft: true
---
# FluxCD

## Qu'est-ce que GitOps ?

GitOps est un concept introduit en 2017 par "Weave".
Le principe de GitOps rejoint celui d'infrastructure as code, avec des contraintes qui définissent des bonnes pratiques.  
Ces deux principes reposent en grande partie sur la formulation déclarative de l'infrastructure. Avec l'usage d'outils 
tels que Ansible, Chef/Puppet, Terraform, Salt, et bien sûr Kubernetes.

De ce fait, les opération manuelles via ssh ou kubectl sont proscrites. Tout changement doit être écrit de manière 
déclarative via un outils de provisionnement ou de déploiement.
[https://12factor.net/dev-prod-parity](https://12factor.net/dev-prod-parity)

## Les spécificitées de GitOps

GitOps se base sur Git, c'est-à-dire que notre dépôt git est notre source de vérité absolue, cela nous incite à utiliser
git pour effectuer nos déploiements habituels via du "Continuous Deployment"

La notion de convergence est également un point important du GitOps. Étant donné que notre dépôt git est notre source,
il faut faire en sorte que nos déploiements soit le plus proche de l'état décrit dans git. Cela passe par la supervision
 active de notre infrastructure et du report des divergences constatées.
 
##
 


