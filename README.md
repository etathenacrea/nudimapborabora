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
| **Identification** | Bibliothèque des espèces : photo, **nom commun · nom scientifique · classification**, **jour/nuit**, **rareté en étoiles**, description. |
| **Proposer** | Mini-inscription (nom, email, WhatsApp facultatif), puis formulaire. **Plusieurs photos**, environnement (sable/éponges/coraux…). Espèce : liste, « Je ne sais pas », ou **« Nouvelle proposition »** pour suggérer un nom (vérifié par un expert avant affichage). Requis : **photo(s), lieu (+ épingle), date, profondeur**. Notification in-app à la validation. |
| **Espace admin** | **Validation** (identifier, 🐣 juvénile, Valider/Refuser, avis entre experts ; **contact email + WhatsApp du déposant** visible) et **Bibliothèque** (ajouter/modifier les fiches). |

### Identification (3 champs)

- **Nom commun** — le nom courant (ex. Doris de Kunié)
- **Nom scientifique** — le binôme latin (ex. *Goniobranchus kuniei*)
- **Classification** — la famille, depuis la liste du répertoire (ex. Chromodorididae) ou **Autre** (champ libre). Plus simple et crédible que de viser famille + espèce sur 5000+ individus.
- **Jour / nuit** — espèce plutôt diurne ou nocturne
- **Rareté** — de ★ (commune) à ★★★★★ (très rare)

À la validation, l'expert choisit une espèce existante **ou** « ➕ Autre » pour créer une **nouvelle identification** (nom commun + nom scientifique + classification + rareté), qui enrichit la bibliothèque. Case **🐣 juvénile** pour signaler un juvénile.

Si le déposant a fait une **« Nouvelle proposition »** de nom, elle apparaît dans la file (« proposition du déposant ») et **pré-remplit** le champ « Autre » : l'expert peut donc valider sa suggestion en un clic. Tant que ce n'est pas validé, l'observation reste **« Espèce indéterminée »** sur la carte.

## Codes experts (démo)

| Code | Expert |
|---|---|
| `Borabora1` | Vincent |
| `Borabora2` | Alizée |
| `Borabora3` | Alexandre |
| `Borabora4` | Justine |
| `Borabora5` | Pauline Bosserelle (CRIOBE — référence nudibranches en Polynésie française) |

*(Les codes ne sont pas sensibles à la casse : `borabora5` fonctionne aussi.)*

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
