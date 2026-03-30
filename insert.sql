CREATE DATABASE tifosi;
USE tifosi;
CREATE TABLE marque  (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom_marque VARCHAR(100)
);
CREATE TABLE  boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom_boisson VARCHAR(100),
    id_marque INT,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);
CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom_ingredient VARCHAR(100),
    prix DECIMAL(5,2)
);
CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom_focaccia VARCHAR(100),
    prix DECIMAL(5,2)
);
CREATE TABLE focaccia_ingredient (
	id_focaccia INT,
    id_ingredient INT ,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
    );
    
    INSERT INTO marque  (nom_marque) VALUES
    ('Coca-cola' ),
    ('Cristalline' ),
    ('Monster' ),
    ('Pepsico' );
    
    INSERT INTO boisson (nom_boisson,  id_marque) VALUES
    ('Coca-cola zéro' , 1),
    ('Coca-cola original' , 1),
    ('Fanta citron' , 1),
    ('Fanta orange' , 1),
    ('Capri-sun' , 1),
    ('Pepsi' , 4),
    ('Pepsi Max Zéro' , 4),
    ('Lipton zéro citron' , 4),
    ('Lipton Peach' , 4),
    ('Monster energy ultra gold' , 3),
    ('Monster energy ultra blue' , 3),
    ('Eau de source' , 2);
    
    SELECT * FROM marque;
    SELECT * FROM boisson;
    
    SELECT boisson.nom_boisson, marque.nom_marque
    FROM boisson
    JOIN marque ON boisson.id_marque = marque.id_marque;
    
    -- REQUETE 1
    SELECT nom_focaccia
    FROM focaccia
    ORDER BY nom_focaccia;
    
    SELECT * FROM focaccia;
    
USE tifosi;
SELECT * FROM focaccia;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM focaccia;
SELECT * FROM focaccia;

  INSERT INTO focaccia (nom_focaccia, prix) VALUES
    ('Margherita' , 8.50),
    ('4 fromages' , 10.00),
    ('Reine' , 9.50);
    
    SELECT * FROM focaccia;
    ALTER TABLE focaccia AUTO_INCREMENT = 1;
    SELECT * FROM focaccia;
    
    SELECT nom_focaccia
    FROM focaccia
    ORDER BY nom_focaccia;
    
    SELECT COUNT(*) AS total_ingredients
    FROM  ingredient;
    
    DELETE FROM ingredient;

INSERT INTO ingredient (nom_ingredient, prix) VALUES
('Tomate' , 1.00),
('Mozzarella' , 1.50),
('Jambon' , 2.00),
('Champignons' , 1.20);

SELECT COUNT(*) AS total_ingredients
FROM ingredient;

-- REQUETE 1
SELECT nom_focaccia
FROM focaccia
ORDER BY nom_focaccia ASC;

-- REQUETE 2
SELECT COUNT(*) AS total_ingredients
FROM ingredient;

-- REQUETE 3
SELECT AVG(prix) AS prix_moyen
FROM focaccia;

-- REQUETE 4
SELECT boisson.nom_boisson, marque.nom_marque
FROM boisson
JOIN marque ON boisson.id_marque = marque.id_marque
ORDER BY boisson.nom_boisson ASC;

SELECT ingredient.nom_ingredient
FROM ingredient
JOIN focaccia_ingredient
	ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient
JOIN focaccia
	ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
WHERE focaccia.nom_focaccia = 'Raclaccia';
SELECT * FROM focaccia_ingredient;

SELECT * FROM focaccia;
SELECT * FROM ingredient;
SELECT * FROM focaccia;

INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient)
VALUES
(16, 5), -- Margherita -> Tomate
(16, 6), -- Margherita -> Mozzarella

(17, 6), -- 4 fromages -> Mozzarella

(18, 5), -- Reine -> Tomate
(18, 6), -- Reine -> Mozzarella
(18, 7), -- Reine -> Jambon
(18, 8); -- Reine -> Champignons

SELECT * FROM focaccia_ingredient;

SELECT ingredient.nom_ingredient
FROM ingredient
JOIN focaccia_ingredient
    ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient
JOIN focaccia
    ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
WHERE focaccia.nom_focaccia = 'Reine';

UPDATE focaccia
SET nom_focaccia = 'Reine'
WHERE nom_focaccia = 'Riene';

SELECT * FROM focaccia;

SELECT  focaccia.nom_focaccia, ingredient.nom_ingredient
FROM focaccia
JOIN focaccia_ingredient
	ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
JOIN ingredient 
	ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient
ORDER BY focaccia.nom_focaccia;

SELECT focaccia.nom_focaccia, COUNT(*) AS  nb_ingredients
FROM focaccia
JOIN focaccia_ingredient
	ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.nom_focaccia;

SELECT nom_focaccia, prix
FROM focaccia
ORDER BY prix DESC
LIMIT 1;

SELECT focaccia.nom_focaccia, COUNT(*) AS nb_ingredients
FROM focaccia
JOIN focaccia_ingredient
	ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.nom_focaccia
ORDER BY nb_ingredients DESC
LIMIT 1;


SELECT focaccia.nom_focaccia, COUNT(*) AS nb_ingredients
FROM focaccia
JOIN focaccia_ingredient
	ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.nom_focaccia
HAVING nb_ingredients > 2;

SELECT focaccia.nom_focaccia, focaccia.prix, COUNT(*) AS nb_ingredients
FROM focaccia
JOIN focaccia_ingredient 
    ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.nom_focaccia, focaccia.prix
ORDER BY focaccia.prix DESC;

SELECT DISTINCT focaccia.nom_focaccia
FROM focaccia
JOIN focaccia_ingredient
    ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
JOIN ingredient
    ON focaccia_ingredient.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom_ingredient = 'Ail';

SELECT * FROM ingredient WHERE nom_ingredient = 'Ail';

INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient)
VALUES (18, 5);

SELECT * FROM ingredient WHERE nom_ingredient = 'Ail';

SELECT * FROM focaccia WHERE id_focaccia = 18;

SELECT *
FROM focaccia_ingredient
WHERE id_focaccia = 18 AND id_ingredient = 1;

SELECT * 
FROM ingredient
WHERE nom_ingredient = 'Ail';

SELECT *
FROM focaccia
WHERE id_focaccia = 18;

SELECT *
FROM focaccia_ingredient
WHERE id_focaccia = 18 AND id_ingredient = 5;

SELECT * FROM ingredient;

INSERT INTO ingredient (nom_ingredient, prix)
VALUES ('Ail' , 2.00);
SELECT * FROM ingredient WHERE nom_ingredient = 'Ail';

UPDATE ingredient
SET nom_ingredient = 'Ail'
WHERE nom_ingredient = 'Ail';
SELECT * FROM ingredient  WHERE nom_ingredient = 'Ail';

UPDATE ingredient
SET nom_ingredient = 'Ail'
WHERE id_ingredient = 9;
SELECT * FROM ingredient WHERE id_ingredient = 9;
SELECT * FROM focaccia_ingredient
WHERE id_focaccia = 18 AND id_ingredient = 9;

INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient)
VALUES (18, 9);

    SELECT nom_ingredient
FROM ingredient
WHERE id_ingredient NOT IN (
    SELECT id_ingredient
    FROM focaccia_ingredient
);

SELECT COUNT(*) FROM ingredient;
SELECT COUNT(DISTINCT id_ingredient) FROM focaccia_ingredient;


SELECT nom_focaccia
FROM focaccia
WHERE id_focaccia NOT IN (
    SELECT id_focaccia
    FROM focaccia_ingredient fi
    JOIN ingredient i 
        ON fi.id_ingredient = i.id_ingredient
    WHERE i.nom_ingredient = 'Champignon'
);

    
	
    
    
    
    
    