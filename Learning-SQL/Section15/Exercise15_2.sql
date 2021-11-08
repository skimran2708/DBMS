SELECT concat('ALTER TABLE ', table_name, ' ADD INDEX ', 
index_name, ' (',
group_concat(column_name order by seq_in_index separator ', '),
');'
) index_creation_statement
FROM information_schema.statistics
WHERE table_schema = 'sakila'
AND table_name = 'customer'
GROUP BY table_name, index_name;