LOAD 'pg_graph';
SET SEARCH_PATH=graph_catalog, '$user', public;

SELECT personId, firstName, lastName FROM cypher($$
MATCH (m:message)-[:message_hascreator_person]->(p:person)
WHERE m.vertex_id = 3
RETURN
    p.vertex_id AS personId,
    p.firstname AS firstName,
    p.lastname AS lastName
$$) as (personId bigint, firstName varchar, lastName varchar);