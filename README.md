# NudiMapBoraBora 🐚

Observatoire participatif des nudibranches du lagon de Bora Bora.
Contenu d'identification issu de la conférence de **Justine Certain** (Dive N' Smile Bora Bora).

**En ligne :** https://etathenacrea.github.io/nudimapborabora/

## Ouvrir l'appli en local

Double-clique sur **`index.html`** (il s'ouvre dans ton navigateur). Une connexion internet est nécessaire pour la carte satellite.

## Les onglets

| Onglet | Ce que ça fait |
|---|---|
| **Accueil** | Présentation grand public + QR code à scanner/imprimer pour partager le lien. |
| **Carte** | Les observations sur le lagon. 🟢 vert = validée · 🟠 orange = en attente. Filtres espèce / année / statut. La carte démarre vide. |
| **Identification** | La bibliothèque des espèces : photo, **nom scientifique · famille · espèce**, description. À consulter avant de proposer. |
| **Proposer** | Mini-inscription (nom + email), puis formulaire. Requis : **photo, lieu (+ épingle), date, profondeur**. Espèce optionnelle. Le déposant reçoit une **notification in-app** quand c'est validé/refusé. |
| **Espace admin** | **Validation** (attribuer l'espèce → Valider/Refuser, avis entre experts) et **Bibliothèque** (ajouter/modifier les fiches). |

## Codes experts (démo)

| Code | Expert |
|---|---|
| `Borabora1` | Vincent |
| `Borabora2` | Alizée |
| `Borabora3` | Alexandre |
| `Borabora4` | Justine |

Chaque validation enregistre quel expert l'a faite. *(Ce sont des codes de démo côté navigateur — une vraie authentification sécurisée viendra avec la base en ligne.)*

## Bon à savoir

- **Clique une photo** (admin ou carte) pour l'agrandir en plein écran — utile sur téléphone.
- Les **familles** des 15 espèces sont pré-remplies au mieux : à **vérifier/corriger** par les experts (onglet admin → Bibliothèque).
- C'est un **prototype local** : observations, ajouts à la bibliothèque et notifications sont enregistrés dans **chaque navigateur** séparément (pas encore de base partagée). Étape suivante : base en ligne + comptes experts.

## Structure

```
nudimapborabora/
├── index.html                       ← l'application (tout est dedans)
└── assets/
    ├── species/*.jpg                ← photos d'espèces de référence
    └── qr-nudimapborabora.png       ← QR code du lien (à imprimer)
```
