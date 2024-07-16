LOAD 'pg_graph';
SET SEARCH_PATH=graph_catalog, '$user', public;

SELECT personId, firstName, lastName, friendshipCreationDate FROM cypher($$
MATCH (n:person)-[r:person_knows_person]->(friend:person)
WHERE n.vertex_id = 933
RETURN
    friend.vertex_id AS personId,
    friend.firstname AS firstName,
    friend.lastname AS lastName,
    r.creationdate AS friendshipCreationDate
ORDER BY
    r.creationdate DESC,
    friend.vertex_id ASC
$$) as (personId bigint, firstName varchar, lastName varchar, friendshipCreationDate timestamp);