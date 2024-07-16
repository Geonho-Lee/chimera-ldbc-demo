-- \set personId 1829
-- \set postId 1924147579404
-- \set creationDate '\'2023-06-05\''::date

WITH prop_inserted AS (
    insert into person_likes_message_prop (
      src_vertex_id,
      dst_vertex_id,
      creationdate
    )
    values
    (
      933, 
      492583725017539, 
      '2024-07-30'::date
    )
    returning ctid as prop_ptr
)
select insert_edge_physical(
    'person_likes_message', 
    'person', 
    'message', 
    933, 
    492583725017539, 
    (select prop_ptr from prop_inserted)
);