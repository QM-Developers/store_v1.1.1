delete from friend
where 1 = 1
AND user_id = ''
AND friend_id = '';
;

select * from friend
;

select * from friend_request
;

select * from chat_history
;

delete from friend_request
;

delete from chat_history
;

delete from friend
;