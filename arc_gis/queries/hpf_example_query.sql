WITH store_names AS
    (SELECT DISTINCT name AS dist_names
     FROM ca_business WHERE ('Fast food restaurant' = any(categories) OR 'Bar' = any(categories) OR 'Pizza restaurant' = any(categories) OR 'Hamburger restaurant' = any(categories) OR 'Convenience store' = any(categories) OR 'Liquor store' = any(categories) OR 'Ice cream shop' = any(categories) OR 'Dessert shop' = any(categories) OR 'Pizza delivery' = any(categories) OR 'Bar & grill' = any(categories) OR 'Pizza Takeout' = any(categories) OR 'Chicken wings restaurant' = any(categories) OR 'Donut shop' = any(categories) OR 'Cocktail bar' = any(categories) OR 'Wine bar' = any(categories) OR 'Wine store' = any(categories) OR 'Sports bar' = any(categories) OR 'Brewery' = any(categories) OR 'Beer store' = any(categories) OR 'Candy store' = any(categories) OR 'Dessert restaurant' = any(categories) OR 'Chocolate shop' = any(categories) OR 'Hot dog restaurant' = any(categories) OR 'Brewpub' = any(categories) OR 'Pastry shop' = any(categories) OR 'Beer garden' = any(categories) OR 'Cookie shop' = any(categories) OR 'Fried chicken takeaway' = any(categories) OR 'Hot dog stand' = any(categories) OR 'Beer hall' = any(categories) OR 'Crêperie' = any(categories) OR 'Irish pub' = any(categories) OR 'Pie shop' = any(categories) OR 'Cupcake shop' = any(categories) OR 'Gay bar' = any(categories) OR 'Patisserie' = any(categories) OR 'Cider bar' = any(categories) OR 'Popcorn store' = any(categories) OR 'Confectionery' = any(categories) OR 'Chocolate artisan' = any(categories) OR 'Hong Kong style fast food restaurant' = any(categories) OR 'Pizza takeaway' = any(categories) OR 'Piano bar' = any(categories) OR 'Sweets and dessert buffet' = any(categories) OR 'Chocolate cafe' = any(categories) OR 'Dart bar' = any(categories) OR 'Tiki bar' = any(categories) OR 'State liquor store' = any(categories) OR 'Pizza' = any(categories) OR 'Sake brewery' = any(categories) OR 'Liquor wholesaler' = any(categories) OR 'Japanese confectionery shop' = any(categories) OR 'Japanese sweets restaurant' = any(categories) OR 'Confectionery wholesaler' = any(categories) OR 'Indian sweets shop' = any(categories) OR 'Japanese cheap sweets shop' = any(categories) OR 'Shochu brewery' = any(categories))
    ),
    hpf_stores AS
        (SELECT * FROM ca_business INNER JOIN store_names ON ca_business.name = store_names.dist_names
        )
SELECT COUNT(*) as count, array_agg(distinct name) as restaurants
FROM hpf_stores
WHERE name NOT IN (SELECT DISTINCT name FROM ca_business WHERE ('Supermarket' = any(categories)));