create table Recipe (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(25), description VARCHAR(50), instructions VARCHAR(500)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table Ingredient (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table Measure (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table RecipeIngredient (recipe_id INT NOT NULL, ingredient_id INT NOT NULL, measure_id INT, amount INT, 

	CONSTRAINT fk_recipe FOREIGN KEY(recipe_id) REFERENCES Recipe(id), 

	CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES Ingredient(id), 

	CONSTRAINT fk_measure FOREIGN KEY(measure_id) REFERENCES Measure(id)) 

	ENGINE=InnoDB DEFAULT CHARSET=utf8; 
    
        INSERT INTO Measure (name) VALUES ('block'), ('cup'), ('packet'),('slice'),( 'tablespoon'),('teaspoon');
       
        
        INSERT INTO Ingredient (name) VALUES ('Ramen noodle'),('Seasoning Packet'),('Peanut Butter'),('Jelly'), ('Bread'), ('Rice Krispies cereal'), ('Milk'), ('Sugar');
        
        
    INSERT INTO Recipe (name, description, instructions) VALUES ('Ramen', 'Hot bowl of ramen noodles','Add 2 cups of water to pot and boil. Add block of noodles along with season packet and 1/2 cup of mixed vegetables. Simmer for 3 minutes and serve.');
INSERT INTO Recipe ( name, description, instructions) VALUES ('PB & J', 'A yummy sandwich', 'Grab two slices of bread. Spead 3 tablespoons of peanut butter on one slice of bread. Spread 4 tablespoons of jelly on the other slice. Combine both slices of bread together, with peanut butter and jelly facing each other.');
INSERT INTO Recipe (name, description, instructions) VALUES ( 'Cereal', 'A bowl of cereal', 'Pour 1 cup of Rice Krispies in to a bowl. Add half a cup of milk and 3 teaspoons of sugar.');

INSERT INTO RecipeIngredient ( recipe_id, ingredient_id, measure_id, amount)VALUES (1,1,1,1),(1,2,2,1),(1,1,3,1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (2, 5, 4, 2),(2,3,5,3),(2,4,5,4);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (3, 6, 2, 1),(3,7,1.5,1), (3,8,6,3);
UPDATE Recipe
SET name = "Crunchy Cereal"
WHERE name = "Cereal";

SELECT r.name AS 'Recipe', r.instructions, ri.amount AS 'Amount', mu.name AS 'Unit of Measure', i.name AS 'Ingredient' 
FROM Recipe r 
JOIN RecipeIngredient ri on r.id = ri.recipe_id 
JOIN Ingredient i on i.id = ri.ingredient_id 
LEFT OUTER JOIN Measure mu on mu.id = measure_id;
