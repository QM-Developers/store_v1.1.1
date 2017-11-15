        SELECT IFNULL(MAX(repertory_type),0) FROM
          customer_repertory cr
          INNER JOIN customer c
          ON c.customer_type = cr.customer_type
        WHERE cr.my_team_id = ''
        AND c.user_id = ''
        LIMIT 1;
        
        select * from user limit 1