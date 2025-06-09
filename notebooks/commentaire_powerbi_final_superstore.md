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

---

## Filtres et interactions

Des filtres globaux sont disponibles sur :
- **Le profit ou le CA** Les graphiques changent en fonction du choix,
- **L’année** (2014 à 2017),
- **Le segment client** (Consumer, Corporate, Home Office),
- **La région** (Central, East, South, West),
- **Le mode de livraison** (Standard, First Class, Same Day, Second Class).

Les pages sont interactives, permettant de croiser les dimensions (ex : profit par sous-catégorie dans une année donnée).

---

## Choix de visualisations

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

---

## Améliorations possibles

- Ajouter une page d’analyse prédictive (prévision de ventes ou de délais).
- Intégrer une analyse du coût logistique par mode de livraison.
- Mettre en place un score de performance globale par client ou produit.

