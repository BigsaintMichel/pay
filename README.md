# Application de Paiement Flutter

Une application mobile moderne de gestion financière développée avec Flutter, conçue pour les utilisateurs francophones d'Afrique de l'Ouest.

## 🚀 Fonctionnalités

### 📱 Pages Principales

1. **Accueil** - Tableau de bord avec résumé financier
   - Solde actuel, dépenses et épargnes
   - Actions rapides (Paiements, Épargne, Analyses, Historique)
   - Activité récente des transactions

2. **Épargne** - Gestion des objectifs d'épargne
   - Suivi du total épargné avec barre de progression
   - Objectifs personnalisés (Fonds d'urgence, Vacances, Nouvelle voiture)
   - Historique des épargnes récentes
   - Ajout d'épargnes avec dialogue interactif

3. **Paiements** - Gestion des paiements et factures
   - Vue d'ensemble des échéances à venir
   - Paiements individuels avec confirmation
   - Onglets "À venir" et "Toutes les commandes"
   - Notifications de rappels de paiement

4. **Historique** - Journal complet des transactions
   - Toutes les transactions avec filtres
   - Transactions terminées
   - Transactions en attente
   - Détails complets (montant, date, statut, catégorie)

5. **Plus** - Paramètres et profil utilisateur
   - Profil utilisateur avec statut Premium
   - Paramètres de sécurité et notifications
   - Méthodes de paiement
   - Support et aide
   - Déconnexion sécurisée

### 💰 Devise et Localisation

- **Devise** : FCFA (Franc CFA)
- **Langue** : Français
- **Format des montants** : 1,650,000 FCFA
- **Localisation** : Optimisé pour l'Afrique de l'Ouest

### 🎨 Design et UX

- **Thème** : Material Design 3 avec couleurs modernes
- **Couleur principale** : Violet profond (Deep Purple)
- **Interface** : Design épuré et intuitif
- **Navigation** : Barre de navigation inférieure avec 5 onglets
- **Animations** : Transitions fluides et feedback visuel

## 📋 Exemples de Contenu

### Transactions d'Exemple

1. **Achat Puma - Chaussures Sport**
   - Montant : 160,500 FCFA
   - Lieu : Boutique Puma, Abidjan
   - Statut : Terminé
   - Catégorie : Vêtements

2. **Paiement Essence - Station Total**
   - Montant : 25,000 FCFA
   - Lieu : Station Total, Treichville
   - Statut : Terminé
   - Catégorie : Transport

3. **Restaurant - Le Bistrot**
   - Montant : 45,000 FCFA
   - Lieu : Restaurant Le Bistrot, Cocody
   - Statut : Terminé
   - Catégorie : Restaurant

4. **Achat Apple - iPhone 15**
   - Montant : 1,250,000 FCFA
   - Lieu : Apple Store, Plateau
   - Statut : Terminé
   - Catégorie : Électronique

### Objectifs d'Épargne

1. **Fonds d'Urgence**
   - Objectif : 3,000,000 FCFA
   - Actuel : 1,500,000 FCFA
   - Progression : 50%

2. **Fonds Vacances**
   - Objectif : 2,000,000 FCFA
   - Actuel : 800,000 FCFA
   - Progression : 40%

3. **Nouvelle Voiture**
   - Objectif : 15,000,000 FCFA
   - Actuel : 200,000 FCFA
   - Progression : 1.3%

## 🛠️ Technologies Utilisées

- **Framework** : Flutter 3.8.1
- **Langage** : Dart
- **Architecture** : StatefulWidget avec gestion d'état locale
- **Design** : Material Design 3
- **Navigation** : BottomNavigationBar avec TabBarView
- **Dialogs** : AlertDialog personnalisés
- **Animations** : LinearProgressIndicator et transitions

## 📱 Fonctionnalités Techniques

### Gestion d'État
- Utilisation de `StatefulWidget` pour les pages interactives
- `TabController` pour la navigation entre onglets
- Gestion locale des données utilisateur

### Interface Utilisateur
- Design responsive adapté aux différentes tailles d'écran
- Composants réutilisables pour la cohérence
- Feedback visuel pour toutes les actions utilisateur
- Dialogues de confirmation pour les actions importantes

### Sécurité
- Dialogues de confirmation pour les paiements
- Gestion sécurisée de la déconnexion
- Validation des montants avant traitement

## 🚀 Installation et Exécution

1. **Prérequis**
   ```bash
   flutter --version
   ```

2. **Cloner le projet**
   ```bash
   git clone [url-du-repo]
   cd pay
   ```

3. **Installer les dépendances**
   ```bash
   flutter pub get
   ```

4. **Lancer l'application**
   ```bash
   flutter run
   ```

## 📊 Structure du Projet

```
lib/
├── main.dart                 # Point d'entrée de l'application
└── pages/
    ├── home_page.dart        # Page d'accueil
    ├── savings_page.dart     # Page d'épargne
    ├── payment_page.dart     # Page de paiements
    ├── history_page.dart     # Page d'historique
    └── more_page.dart        # Page des paramètres
```

## 🎯 Utilisation pour Présentation

### Points Clés à Présenter

1. **Interface Utilisateur Moderne**
   - Design épuré et professionnel
   - Navigation intuitive
   - Couleurs cohérentes

2. **Fonctionnalités Complètes**
   - Gestion financière complète
   - Suivi des objectifs d'épargne
   - Historique détaillé des transactions

3. **Localisation Africaine**
   - Devise FCFA
   - Interface en français
   - Contenu adapté au contexte local

4. **Expérience Utilisateur**
   - Feedback visuel immédiat
   - Dialogues de confirmation
   - Animations fluides

### Démonstration Recommandée

1. **Accueil** : Montrer le résumé financier et les actions rapides
2. **Épargne** : Présenter les objectifs et la progression
3. **Paiements** : Démontrer le processus de paiement
4. **Historique** : Afficher les transactions détaillées
5. **Plus** : Montrer les paramètres et le profil

## 🔮 Améliorations Futures

- Intégration avec des APIs de paiement réelles
- Synchronisation cloud des données
- Notifications push
- Mode hors ligne
- Support multi-devises
- Analytics et rapports détaillés

---

**Développé avec ❤️ pour l'Afrique de l'Ouest**
