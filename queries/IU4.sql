-- \set person1Id 1829
-- \set person2Id 1924147579404
-- \set creationDate '\'2023-06-05\''::date

WITH prop_inserted AS (
    insert into person_knows_person_prop (
      src_vertex_id,
      dst_vertex_id,
      creationdate
    )
    values
    (
      933,
      1129,
      '2024-07-30'::date
    )
    returning ctid as prop_ptr
)
select insert_edge_physical(
    'person_knows_person', 
    'person', 
    'person', 
    933, 
    1129, 
    (select prop_ptr from prop_inserted)
);