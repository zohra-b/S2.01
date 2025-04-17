-- Llista el total de factures d'un client/a en un període determinat.
select * from sales
WHERE bought_by = 2 AND sale_date > '2025-01-01';

-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
select sold_glasses, sale_date from sales
WHERE sold_by = 1 AND sale_date > '2025-01-01';

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT DISTINCT supplier_name
FROM suppliers
join brands ON suppliers.supplier_id = brands.supplier
join glasses ON brands.brand_id = glasses.brands_brand_id
join sales ON sales.sold_glasses = glasses.glass_id;