LOAD 'pg_graph';
SET SEARCH_PATH=graph_catalog, '$user', public;

SELECT messageContent, messageCreationDate FROM cypher($$
MATCH (m:message)
WHERE m.vertex_id = 3
RETURN
    coalesce(m.content, m.imagefile) as messageContent,
    m.creationdate as messageCreationDate
$$) as (messageContent text, messageCreationDate timestamp);