# Parduotvė "Free Shop"
---
Sukurta parduotuvė, kuri leidžia vartotojui užsiregistruoti, prisijungti, talpinti savo prekės su nuotraukomis. 

##Beck-end
---
1. Java SE 20
2. Spring Boot 2.7.15
3. JPA
4. Spring Security
5. Maven 4.0.0
6. Lombok 
7. PostgreSQL
8. Freemarker
9. Java Mail Sender 
10. Json
11. Flywaydb
---
##Klasės/Ryšiai
---
Programoje 16 klasių.

- Images ->  Product (ManyToOne)
- Product -> User (ManyToOne)
---
#Papildoma informacija

- Vartotojo slaptažodžiai duomenų bazėje šifruojami;
- Nuotraukos talpinamos bazėje;
- Pakeitus prisijungimo prie DB duomenis, programa lengvai persikelia ant kitos duomenų bazės 
---
#Testai
---
Panauduoti paprasti testai Unit ir Mockito.
