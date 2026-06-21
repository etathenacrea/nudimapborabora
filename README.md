# NudiMapBoraBora 🐚

Observatoire participatif des nudibranches du lagon de Bora Bora.
Prototype cliquable — données du contenu issues de la conférence de **Justine Certain** (Dive N' Smile Bora Bora).

## Ouvrir l'appli

Double-clique sur **`index.html`** (il s'ouvre dans ton navigateur). Une connexion internet est nécessaire pour la carte satellite.

## Les 4 onglets

| Onglet | Ce que ça fait |
|---|---|
| **Carte** | Toutes les observations sur le lagon. 🟢 vert = validée · 🟠 orange = en attente. Filtres par espèce / année / statut. Clique une épingle pour la fiche. |
| **Identification** | Les 15 espèces documentées, avec photos et descriptions. Recherche + fiche détaillée au clic. |
| **Proposer** | Mini-inscription (nom + email), puis formulaire : photo, espèce (ou « je ne sais pas »), position sur la carte, date, heure, profondeur. |
| **Espace admin** | Validation des observations : attribuer les noms (scientifique / commun / vernaculaire), puis **Valider** (→ vert) ou **Refuser**. |

**Mot de passe admin (démo) : `borabora`**

## Bon à savoir

- C'est un **prototype local** : les observations sont enregistrées dans **ton navigateur** uniquement (pas encore de base partagée en ligne). Le bouton « Réinitialiser les données de démo » (dans l'admin) recharge les exemples.
- Étape suivante pour une vraie mise en ligne : base de données partagée + hébergement + nom de domaine. À discuter.

## Structure

```
nudimapborabora/
├── index.html              ← l'application (tout est dedans)
└── assets/species/*.jpg    ← les 15 photos d'espèces
```
