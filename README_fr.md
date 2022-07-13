# MEBOOX

## Présentation du projet

Nous voulons sortir une version allégée de Nextory qui permettrait de gérer
un petit catalogue de livres.

Pour cela, nous avons commencé le développement d'une petite API qui permet de
lister nos livres.

En l'état actuel du projet, nous sommes en mesure de lister tous les livres
avec leur auteur et commentaires.

Nous voulons maintenant apporter de nouvelles fonctionnalités et en améliorer
certaines.


## Mise en place du projet

Pour mettre en place ce projet, il faut avoir une version `2.6.5` de Ruby
fonctionnelle et avoir installé la gem Bundler 2.0.2.

Le SGBD utilisé sera `sqlite`.

Pour faciliter le développement, des données de tests peuvent être générées en
utilisant la commande `rails db:seed`.

Un workspace pour le client REST [Insomnia](https://insomnia.rest/) est
également disponible pour pouvoir rapidement requêter l'API. Il pourra être
utilisé pour valider les endpoints.


## Tâches à réaliser

Nous attendons que chacune des tâches suivantes soient effectuées dans
des branches GIT distinctes et qu'elles ne soient fusionnées
dans la branche `master` qu'une fois terminées.

Les tâches bonus peuvent figurer soit dans la même branche que la
tâche principale (pensez à séparer vos commits), soit dans une nouvelle branche.


### Afficher le nom complet des auteurs

Nous souhaiterions afficher le nom complet (sous la forme : `Nom Prénom`)
des auteurs dans le serializer pour plus de lisibilité.

Pour cette tâche, nous souhaitons:

- Avoir une nouvelle méthode `full_name` de disponible dans le modèle `Author`
- `full_name` ne doit pas être un nouveau champ dans la base de données
- `full_name` doit apparaître dans le serializer


### Ajouter de la pagination

Pour le moment, nous renvoyons tous les livres. Cela risque de devenir
beaucoup trop lourd pour la charge de notre serveur et nous voulons donc
ajouter de la pagination.

Pour cette tâche, nous attendons que le endpoint `GET /books` accepte les
paramètres suivants:

- `page`: qui correspond à la page que nous souhaitons afficher
- `per`: qui correspond au nombre de résultats par page

Maintenant que la pagination est en place, il faudrait également l'appliquer
aux endpoints suivants : `GET /authors` et `GET /books/:book_id/comments`


### Permettre l'ajout de commentaires

Nous n'avons pas encore de endpoint pour ajouter de commentaires à un livre.

Cette tâche consiste donc à créer cet endpoint avec les contraintes suivantes:

- L'URI du endpoint doit être: `POST /books/:book_id/comments`
- Les champs que l'on authorise à renseigner sont: `nickname` et `content`
- En cas de succès, le endpoint doit renvoyer uniquement le status HTTP `200`
- En cas d'erreur, le endpoint doit renvoyer le status HTTP `422` avec
  les messages d'erreurs correspondants
- Nous ne voulons pas qu'une même personne puisse commenter 2 fois le même livre


### Permettre l'attribution d'une note

Pour l'instant, nos commentaires ne permettent que de laisser... un commentaire !
Nous aimerions que les utilisateurs puissent également noter un livre au moment
de la rédaction du commentaire.

Pour cette tâche:

- Nous voulons que le modèle `Comment` ait un nouvel attribut `stars`
- Cet attribut doit être un chiffre compris entre `0` et `5`
- Il n'est pas obligatoire
- Il doit apparaître dans le serializer des commentaires (laisser vide si
  non remplit)
- Nous aimerions que les commentaires soient triés de la meilleure note
  à la moins bonne dans le endpoint `GET /books/:book_id/comments`


### Améliorer le serializer des livres

Nous avons 2 types de livres: les ebooks et les livres audio. Mais actuellement,
nous n'avons aucun moyen de les distinguer dans notre serializer.

Cette tâche va donc consister à améliorer le serializer des livres en faisant
apparaitre les champs suivants :

- `type` pour pouvoir distinguer les livres ebooks des audios
- `duration` mais uniquement pour les livres audio (il ne doit pas être présent
  pour les ebooks)
- Nous ne voulons pas avoir d'attributs spécifiques aux livres audios dans
  le serializer de livres.


### Ajout de suggestions

Nous souhaiterions mettre en place un petit système de suggestion de livres
suivant le livre consulté.

La suggestion d'un livre doit retourner les 3 livres les mieux notés
du même auteur et compléter les livres manquants par les livres les mieux notés
de manière globale. Bien entendu, nous ne devrions pas avoir le livre consulté
en tant que suggestion.

Pour cette tâche, nous voulons obtenir les choses suivantes :

- Rajouter un attribut `suggestions` dans le serializer d'un livre
- Ne faire apparaître les suggestions que sur le endpoint d'un livre
  et non pas sur la liste des livres

Il ne faudrait pas que les temps de réponse soient doublés par les suggestions.

En dehors de ces contraintes, vous êtes libre dans l'implémentation !
