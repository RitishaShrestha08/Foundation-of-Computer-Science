Database in docker 

Listing 1. Pulling MySQL Image from Docker Hub
-docker pull MySQL :8.0

Listing 2. One-Command MySQL Setup
-docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --name myssql mysql:8.0

Listing 3. Accessing MySQL Inside Container
-docker exec -it myssql MySQL -u root -p

Listing 4. Connecting from host
-MySQL -u root -p -h 127.0.0.1

Listing 5. verification Commands
-SHOW DATABASES;
SELECT VERSION();