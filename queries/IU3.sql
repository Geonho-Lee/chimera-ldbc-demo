-- \set forumId 1829
-- \set personId 1924147579404
-- \set joinDate '\'2023-06-05\''::date

WITH prop_inserted AS (
    insert into forum_hasmember_person_prop (
      src_vertex_id,
      dst_vertex_id,
      joindate
    )
    values
    (
      70368744177665, 
      933, 
      '2024-07-30'::date
    )
    returning ctid as prop_ptr
)
select insert_edge_physical(
    'forum_hasmember_person', 
    'forum', 
    'person', 
    70368744177665, 
    933, 
    (select prop_ptr from prop_inserted)
);