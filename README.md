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
| **Carte** | Les observations sur le lagon. 🟢 vert = validée · 🟠 orange = en attente. Filtres espèce / année / statut. Démarre vide. |
| **Identification** | Bibliothèque des espèces : photo, **nom scientifique · famille · espèce (type)**, **rareté en étoiles**, description. |
| **Proposer** | Mini-inscription, puis formulaire. Requis : **photo, lieu (+ épingle), date, profondeur**. Notification in-app à la validation. |
| **Espace admin** | **Validation** (identifier, marquer 🐣 juvénile, Valider/Refuser, avis entre experts) et **Bibliothèque** (ajouter/modifier les fiches). |

### Taxonomie (3 champs distincts)

- **Nom scientifique** — le binôme latin (ex. *Goniobranchus kuniei*)
- **Famille** — la famille (ex. Chromodorididae)
- **Espèce (type)** — la catégorie : Nudibranche, Doridacé, Éolide, Sacoglosse, **Lièvre de mer**, **Ver plat**, Sous-espèce…
- **Rareté** — de ★ (commune) à ★★★★★ (très rare)

À la validation, l'expert choisit une espèce existante **ou** « ➕ Autre » pour créer une **nouvelle identification** (nom + famille + espèce + rareté), qui enrichit automatiquement la bibliothèque. Une case **🐣 juvénile** permet de signaler un juvénile (qui ne ressemble pas à l'adulte).

## Codes experts (démo)

| Code | Expert |
|---|---|
| `Borabora1` | Vincent |
| `Borabora2` | Alizée |
| `Borabora3` | Alexandre |
| `Borabora4` | Justine |

Chaque validation enregistre quel expert l'a faite. *(Codes de démo côté navigateur — une vraie authentification viendra avec la base en ligne.)*

## Bon à savoir

- **Clique une photo** (admin ou carte) pour l'agrandir en plein écran.
- Familles, type et rareté des 15 espèces sont **pré-remplis au mieux** : à vérifier/corriger par les experts (Admin → Bibliothèque → ✏️ Modifier).
- **Prototype local** : observations, bibliothèque et notifications sont stockées dans **chaque navigateur** séparément. Étape suivante : base partagée en ligne + comptes experts + emails.

## Structure

```
nudimapborabora/
├── index.html
└── assets/
    ├── species/*.jpg                ← photos d'espèces de référence
    └── qr-nudimapborabora.png       ← QR code du lien (à imprimer)
```
