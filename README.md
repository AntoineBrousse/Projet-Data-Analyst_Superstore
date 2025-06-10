# 📊 Superstore Sales Analysis Project

##   Introduction

Lien vers le dataset : https://www.kaggle.com/datasets/vivek468/superstore-dataset-final

Ce projet s'appuie sur un jeu de données commercial fictif appelé **Superstore** le commerce vend principalement des produits de bureau. Le dataset regroupe des informations détaillées sur les commandes, les clients, les produits et les performances commerciales d'une entreprise de vente au détail située au Etats-Unis. Le dataset contient 21 colonnes, dont les plus pertinentes sont :

- **Données transactionnelles** : `Order ID`, `Order Date`, `Ship Date`, `Sales`, `Quantity`, `Discount`, `Profit`
- **Informations client** : `Customer ID`, `Customer Name`, `Segment`, `City`, `State`, `Region`
- **Détails produit** : `Product ID`, `Category`, `Sub-Category`, `Product Name`
- **Données logistiques** : `Ship Mode`, `Postal Code`

Ces données permettent d'analyser le cycle de vie d'une commande, de la vente à la livraison, et d'évaluer la rentabilité à différents niveaux.

---

##   Objectif du projet

L’objectif principal de ce projet est de **mener une analyse exploratoire et descriptive** des données du dataset Superstore afin d’identifier :

- Les **produits ou catégories** générant le plus de chiffre d’affaires ou de pertes.
- L’impact des **remises** sur la rentabilité.
- Les **segments de clientèle** les plus rentables.
- Les **régions géographiques** à fort potentiel ou problématiques.
- Le **délai de livraison** moyen selon le mode d’expédition.


---
##  Outils utilisés

- **Python** pour la création et la modification de table
- **SQL (PostgreSQL)** pour la manipulation et l’exploration des données
- **Power BI** pour la création de dashboards interactifs

---

## Structure du projet

```
superstore-project/
├── data/               → Données brutes et nettoyées (CSV)
├── sql/                → Requêtes SQL (création de tables)
├── notebooks/          → Notebooks Jupyter avec les analyses SQL et interprétations + commentaire rapport Power Bi
├── powerbi/            → Dashboard Power BI (.pbix)
├── README.md           → Présentation complète du projet (ce fichier)
```

---

## Étapes réalisées

### 1. Data Exploration

- Pour faciliter l'analyse le dataset va être séparé en 4 tables : `orders`, `order_details`, `customers`, `products`
- Colonnes clés : `Sales`, `Profit`, `Discount`, `Quantity`, `Segment`, `Category`, `Ship Mode`, `Order Date`, `Region`.

### 2. Data Cleaning & Transformation

- Suppresion de colonnes inutilisées
  - `Country` contient une seule valeur ("United States") n’apporte donc aucune information.
  - `Postal_Code` est trop granulaire et peu exploitable dans le cadre de cette analyse.
- Le dataset étant fourni sous un format propre et structuré (pas de valeurs manquantes, types bien définis), aucune étape majeure de nettoyage n’a été nécessaire.
- Création du serveur Superstore sur postgreeSQL en local.
- Jointures entre les tables pour construire une **vue consolidée (`v_superstore_complete`)**.

### 3. Performance commerciales

- Analyse temporelle (croissance annuelle).
- Statistiques descriptives par produit, client et région.
- Classement des sous-catégories par profit, volume ou marge.

### 4. Analyse client (RFM)

- Calcul du RFM: **récence (dernier achat)**, **fréquence**, et **montant total dépensé**.
- Application des scores RFM avec segmentation :
  - `VIP`, `Fidèle`, `Standard`, `À relancer`, `Nouveau client`, `Gros acheteur`.
- Croisement des segments RFM avec les segments de clientèle (`Consumer`, `Corporate`, `Home Office`).

### 5. Analyse géographique

- Étude des performances commerciales par région et État à partir des données agrégées.
  - Identification des zones géographiques les plus rentables.
  - Calculs des marges bénéficiaires régionales, volumes de commandes, et taux de profit par État.

### 6. Logistique & Livraison

- Analyse comparative des modes de livraison :
  - Délai moyen, panier moyen, marge moyenne.
- Regroupement des commandes par **temps de livraison réel** pour évaluer la corrélation avec la rentabilité.

---

## Recommandations

- **Rééquilibrer les remises** sur les sous-catégories à faible marge.
- **Mieux cibler les clients RFM “VIP” ou “Fidèles”** avec des offres personnalisées.
- **Surveiller les performances par région et état**, notamment dans le Sud, où certaines zones sont déficitaires.

---

## Conclusion

Ce projet a permis de mettre en évidence plusieurs leviers de performance commerciale pour le Superstore. Grâce à l'analyse combinée en SQL et Power BI, nous avons pu :
- Identifier les segments de clients et produits les plus rentables,
- Observer des effets de saisonnalité et des disparités géographiques marquées,
- Comprendre l’impact des remises et des modes de livraison sur la marge.

Cette approche démontre la valeur de la visualisation interactive et de l’exploration de données pour soutenir la prise de décision stratégique. Elle illustre également ma capacité à combiner des compétences techniques (SQL, Power BI) avec une réflexion analytique orientée business.

---

## Contact

> Réalisé par Brousse Antoine
> [LinkedIn](https://www.linkedin.com/in/brousseantoine/) | [email](brousse.antoine14@gmail.com)
