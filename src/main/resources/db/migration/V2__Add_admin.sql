insert into users (id, activation_code, active, email, name, password, phone_number)
values(1,'activate', true, 'a@a.lt', 'Vitalijus', '$2a$08$.6sihXJ9MbaRH4aGpYs/ROUTGCJJlcNmLu6CusueK4XJarYRdBO4y', '862033302');

insert into user_role(user_id, roles)
values(1,'ROLE_ADMIN')