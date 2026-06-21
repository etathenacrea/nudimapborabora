# NudiMapBoraBora 🐚

Observatoire participatif des nudibranches du lagon de Bora Bora.
Contenu d'identification issu de la conférence de **Justine Certain** (Dive N' Smile Bora Bora).

**En ligne :** https://etathenacrea.github.io/nudimapborabora/

## Ouvrir l'appli en local

Double-clique sur **`index.html`** (il s'ouvre dans ton navigateur). Une connexion internet est nécessaire pour la carte satellite.

## Les 4 onglets

| Onglet | Ce que ça fait |
|---|---|
| **Carte** | Les observations sur le lagon. 🟢 vert = validée · 🟠 orange = en attente. Filtres par espèce / année / statut. Clique une épingle pour la fiche. La carte démarre **vide**. |
| **Identification** | La bibliothèque des espèces avec photos et noms scientifiques de référence. Recherche + fiche détaillée au clic. À consulter avant de proposer. |
| **Proposer** | Mini-inscription (nom + email), puis formulaire. Champs requis : **photo, lieu (+ épingle sur la carte), date, profondeur**. L'espèce est optionnelle (« je ne sais pas »). |
| **Espace admin** | Deux espaces : **Validation** (attribuer les noms puis Valider → vert / Refuser) et **Bibliothèque** (ajouter de nouvelles espèces, modifier les fiches et les notes). |

**Mot de passe admin (démo) : `borabora`**

## Bon à savoir

- **Clique une photo** (dans l'admin ou sur la carte) pour l'agrandir en plein écran — utile sur téléphone pour bien identifier.
- C'est un **prototype local** : les observations et les ajouts à la bibliothèque sont enregistrés dans **ton navigateur** uniquement (pas encore de base partagée en ligne).
- Étape suivante pour une vraie mise en ligne collaborative : base de données partagée + comptes spécialistes. À discuter.

## Structure

```
nudimapborabora/
├── index.html              ← l'application (tout est dedans)
└── assets/species/*.jpg    ← les photos d'espèces de référence
```
