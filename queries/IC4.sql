LOAD 'pg_graph';
SET SEARCH_PATH=graph_catalog, '$user', public;

SELECT tagName, postCount
FROM cypher($$
MATCH (p:person)-[:person_knows_person]->(f:person),
      (f)<-[:message_hascreator_person]-(post:message)-[:message_hastag_tag]->(t:tag)
WHERE p.vertex_id = 933
AND post.creationdate >= '2010-10-01'
AND post.creationdate < ('2010-10-01'::timestamp + 31 * '1 days'::interval) 
WITH DISTINCT t.name AS tagName, post.vertex_id as postId
WITH tagName, count(postId) AS postCount
RETURN tagName, postCount
ORDER BY postCount DESC, tagName ASC
LIMIT 10
$$) as (tagName varchar, postCount bigint);