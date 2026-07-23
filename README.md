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

## Comptes experts

Les experts se connectent (**Espace admin**) avec leur **email + mot de passe** (vrais comptes, base en ligne). Les comptes se créent dans Supabase → *Authentication → Users → Add user* (cocher **Auto Confirm User**).

| Expert | Email |
|---|---|
| Justine | pro.justinecertain@gmail.com |
| Alexandre | alexandre.tayale@gmail.com |
| Pauline Bosserelle (CRIOBE) | pauline.bosserelle@gmail.com |
| Vincent | vincentdondon@orange.fr |
| Alizée | *(à venir)* |

Chaque validation enregistre quel expert l'a faite. Seuls les experts connectés peuvent valider/refuser et gérer la bibliothèque ; voir la carte et déposer une observation est ouvert à tous.

## Bon à savoir

- **Clique une photo** (admin ou carte) pour l'agrandir en plein écran.
- Familles, type et rareté des 15 espèces sont **pré-remplis au mieux** : à vérifier/corriger par les experts (Admin → Bibliothèque → ✏️ Modifier).
- **Base partagée en ligne** (Supabase) : observations, photos (stockage cloud) et bibliothèque sont **communes à tout le monde** — une observation déposée depuis n'importe quel téléphone apparaît sur la carte de tous. Voir `db/` pour la structure. Prochaine étape : élargissement aux îles de la Société.

## Structure

```
nudimapborabora/
├── index.html
└── assets/
    ├── species/*.jpg                ← photos d'espèces de référence
    └── qr-nudimapborabora.png       ← QR code du lien (à imprimer)
```
