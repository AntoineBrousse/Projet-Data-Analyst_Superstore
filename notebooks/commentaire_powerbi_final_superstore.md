# Commentaire du Rapport Power BI – Superstore

## Objectif du Dashboard
Ce dashboard Power BI a pour objectif de fournir une vision globale et segmentée de la performance commerciale du Superstore. Il permet d’analyser les ventes, le profit, les comportements clients, la performance géographique ainsi que la logistique de livraison sur la période 2014–2017.

---

## Structure du Dashboard

Le rapport est structuré en **4 pages** principales :
1. **Performance commerciale** : Indicateurs globaux de vente et profit, corrélations remises/CA.
2. **Analyse client** : Comportements clients, répartition par segment, évolution du CA, analyse RFM.
3. **Analyse géographique** : Cartes des performances par État et ville, top régions.
4. **Logistique & livraison** : Délai moyen, modes de livraison, volume de commandes, performance par mode.

Un navigateur de page est disponible en bas à gauche pour parcourir les différentes pages.

1ère page du dashboard :
![Page_1](/images/Page_1.png)
 
---
## Travail réalisé dans Power BI 

### Import des données  

Les données ont été importées dans Power BI via une connexion directe à une base PostgreSQL locale, où les tables avaient été préalablement créées et alimentées à partir du jeu de données Superstore.  

**Connexion PostgreSQL → Power BI**
- Mise en place d’une connexion en direct entre Power BI et PostgreSQL pour récupérer dynamiquement les données de la base.  
- Cela permet de maintenir une logique centralisée : les requêtes SQL restent gérées côté base, assurant une meilleure scalabilité du projet.  

**Attribution des formats temporels**
- Les colonnes `order_date` et `ship_date` ont été converties en type **Date** dans Power BI.  
- Cela permet d’utiliser des fonctions temporelles (mois, années, trimestres) et de construire des courbes temporelles cohérentes dans les visuels.  

**Paramétrage géographique**  
- La colonne `region` a été assignée à la catégorie de données **"Région"** (*Data Category: Region*) dans Power BI.  
- Afin d'activer automatiquement la géolocalisation dans les cartes Power BI.  


### Relations et tables  
Conception d'un modèle relationnel propre et scalable basé sur une structure en étoile, afin d’optimiser la lisibilité, les performances et la flexibilité du rapport Power BI.  
**Fait : `fact_order_details`**  
- Table centrale contenant les ventes, profits, quantités, remises.  
- Reliée aux dimensions via les clés `order_id` et `product_id`.  

**Dimensions :**  
- `dim_orders` : informations de commandes, dates, livraison, mode d’expédition.  
- `dim_customers` : clients, segments, régions.  
- `dim_products` : catégories, sous-catégories, identifiants produit.  
- `public.v_rfm_segmentation` : table personnalisée pour l’analyse RFM.  

**Table de mesures :**  
- Création d’une table dédiée (`Table_mesures`) pour centraliser toutes les mesures DAX (CA, profit moyen, remises moyennes, etc.).  
- Pour faciliter la maintenance, la lisibilité du modèle et la réutilisation des calculs dans l’ensemble du rapport.  

**Modèle**
- Respect d’une modélisation en étoile (fait + dimensions) pour assurer des performances optimales.  
- Création manuelle de relations (`1:*` ou plusieurs-à-un) entre les tables, avec contrôle du sens du filtrage.  
- Séparation des tables de données brutes et de calculs métiers (DAX) pour une logique plus claire et durable.  

Model Superstore_project :
![Schéma](/images/Schéma.png)


### Création de mesures DAX

Construction d'une table avec plusieurs mesures DAX personnalisées pour calculer :
- Le chiffre d’affaires total
- Le profit total
- Le taux de remise moyen
- Le profit moyen par commande/client
Ces mesures permettent de standardiser les calculs et de les utiliser dynamiquement dans plusieurs visuels.

### Filtres et interactions

Des filtres globaux sont disponibles sur :
- **Le profit ou le CA** Les graphiques changent en fonction du choix,
- **L’année** (2014 à 2017),
- **Le segment client** (Consumer, Corporate, Home Office),
- **La région** (Central, East, South, West),
- **Le mode de livraison** (Standard, First Class, Same Day, Second Class).

Les pages sont interactives, permettant de croiser les dimensions (ex : profit par sous-catégorie dans une année donnée).

### Choix de visualisations

- **Cards** pour les KPIs (CA, Profit, Quantité, Remise, etc.),
- **Lignes temporelles** pour les évolutions mensuelles,
- **Bar charts** pour les top produits, top régions, et segments,
- **Diagrammes circulaires** pour les répartitions clients et CA,
- **Cartes géographiques** pour les analyses par État et ville,
- **Graphiques combinés** pour analyser simultanément CA, quantité, et profit.

---

## Insights principaux

### Page 1 : Performance commerciale
- Le chiffre d'affaires global est de **2,30M**, pour un **profit total de 286,40K**.
- L’analyse de l’évolution du chiffre d’affaires révèle une **forte saisonnalité**, avec un pic de ventes récurrent observé au **quatrième trimestre** de chaque année.
- On observe une **corrélation positive** entre la remise moyenne et le chiffre d’affaires, mais cela se fait au détriment de la rentabilité, avec un impact négatif des remises sur le profit.
- Bien que le chiffre d’affaires soit réparti de manière relativement équilibrée entre les trois catégories, la répartition du profit est beaucoup plus contrastée : **Furniture** 6,5 % du profit total, tandis que **Technology** en génère près de la moitié, et **Office Supplies** 43 %.

### Page 2 : Analyse client
- Le segment **Consumer** représente plus de **50 % des clients**.
- Le segment **Corporate** présente la meilleure rentabilité par client, générant en moyenne plus de profit que les segments Consumer et Home Office.
- Le segment **Consumer** reste dominant en terme de CA dans le temps mais **Corporate** est plus stable.
- La fidélisation est plus forte chez les clients **Consumer**, mais les VIP et gros acheteurs sont bien représentés dans le segment Corporate.

### Page 3 : Analyse géographique
- Les États les plus profitables sont **California** (59K) et **New York** (58K).
- Les **villes** les plus rentables sont **New York City** (42K) et **Seattle** (20K).
- Les grandes métropoles sont les principaux contributeurs au profit global.
- La région **Ouest** est la plus rentable en terme de profit par états (plus de 12K).

### Page 4 : Logistique & livraison
- Le délai moyen de livraison est de **3,96 jours**.
- **Standard Class** est le mode de livraison le plus utilisé (59,77 % des commandes).
- La majorité des commandes passent par une livraison économique, ce qui peut impacter les délais mais réduire les coûts.
- Bien que le mode de livraison **Standard Class** concentre les volumes, les profits progressent globalement sur tous les modes, surtout en 2017. On peut supposer une amélioration de la rentabilité logistique.

