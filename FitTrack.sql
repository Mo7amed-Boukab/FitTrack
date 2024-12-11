CREATE DATABASE FitnessManagement;
USE FitnessManagement;
CREATE TABLE members (
  member_id INT(11) AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  gender enum('Male', 'Female'),
  date_of_birth DATE,
  phone_number VARCHAR(15),
  email VARCHAR(100) 
  );
------------------------------------- Add 'UNIQUE' to email 
ALTER TABLE members
MODIFY email VARCHAR(100) UNIQUE;
SHOW COLUMNS FROM members;
-------------------------------------
CREATE TABLE rooms(
  room_id INT(11) AUTO_INCREMENT PRIMARY KEY,
  room_number VARCHAR(10),
  room_type enum('Cardio', 'Weights', 'Studio'),
  capacity INT(11)
);

CREATE TABLE memberships(
  membership_id INT(11) AUTO_INCREMENT PRIMARY KEY,
  member_id INT(11),
  room_id INT(11),
  start_date DATE,
  FOREIGN KEY (member_id) REFERENCES members(member_id),
  FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE departements(
  department_id INT(11) AUTO_INCREMENT PRIMARY KEY,
  department_name VARCHAR(50),
  location VARCHAR(100)
);
CREATE TABLE trainers(
  trainer_id INT(11) AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  specialization VARCHAR(50),
  department_id INT(11),
  FOREIGN KEY (department_id) REFERENCES departements(department_id)
);

CREATE TABLE appointments(
  appointment_id INT(11) AUTO_INCREMENT PRIMARY KEY,
  appointment_date DATE,
  appointment_time TIME,
  trainer_id INT(11),
  member_id INT(11),
  FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id),
  FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE Workout_Plans(
  plan_id INT(11) AUTO_INCREMENT PRIMARY KEY,
  member_id INT(11),
  trainer_id INT(11),
  inscructions VARCHAR(255),
  FOREIGN KEY (member_id) REFERENCES members(member_id),
  FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id)
);
---------------------------------------------------------------------------
-- 1.Opérations CRUD : Insérer un nouveau membre
INSERT INTO members
(
 first_name,
 last_name,
 gender, 
 date_of_birth, 
 phone_number
 ) 
VALUES
(
  'Alex',
  'Johnson',
  'Male',
  '1990-07-15',
  '1234567890'
 );
---------------------------------------------------------------------------
-- Inserer les données aux tableaux:
------------------------------------------- 1. Tableau des départements
INSERT INTO departements
(
  department_name,
  location
) 
VALUES
('Musculation','2e étage'),
('CrossFit','2e étage'),
('Cardio','1er étage'),
('Boxing','3e étage'),
('Natation','4e étage');
------------------------------------------- 2. Tableau des membres
INSERT INTO members
(
  first_name,
  last_name,
  gender, 
  date_of_birth, 
  phone_number,
  email
  ) 
VALUES
(
  'mohamed',
  'boukab',
  'Male',
  '2002-09-16',
  '0603389425',
  'mohamed.boukab@.gmail.com'
),
(
  'ahmed',
  'lamrani',
  'Female',
  '1988-05-22',
  '0623456789',
  'ahmed.lamrani@gmail.com'
),
(
  'amine',
  'el ouafi',
  'Male',
  '1992-03-14',
  '0634567890',
  'amine.elouafi@gmail.com'
),
(
  'yasmina',
  'el mahjoub',
  'Female',
  '2006-12-01',
  '0645678901',
  'yasmina.elmahjoub@gmail.com'
),
(
  'omar',
  'khalifi',
  'Male',
  '2001-07-25',
  '0656789012',
  'omar.khalifi@gmail.com'
),
(
  'salma',
  'fassi',
  'Female',
  '2000-01-09',
  '0667890123',
  'salma.fassi@gmail.com'
),
(
  'rachid',
  'benjelloun',
  'Male',
  '1996-11-30',
  '0678901234',
  'rachid.benjelloun@gmail.com'
),
(
  'adel',
  'el ketani',
  'Female',
  '1999-06-18',
  '0689012345',
  'adel.elketani@gmail.com'
);
------------------------------------------- 3. Tableau de trainers
INSERT INTO trainers
(
  first_name,
  last_name,
  specialization,
  department_id
)
VALUES
('Amine', 'El Amrani', 'Musculation', 1),
('Yahya', 'EL Idrissi', 'Cardio', 3),
('Adam', 'Belkacem', 'CrossFit', 2),
('Khalid', 'El amri', ' boxing', 4),
('Youssef', 'Assiri', ' Natation', 5),
('Ahmed', 'El Amrani', 'Musculation', 1),
('Kamal', 'El tabti', 'Musculation', 1),
('Yassine', 'EL omari', 'Cardio', 3),
('Karim', 'Belkacem', 'CrossFit', 2),
('Bilal', 'El qassimi', 'CrossFit', 2),
('Omar', 'El hebazzi', ' boxing', 4),
('Mohamed', 'Yassine', ' Natation', 5);
------------------------------------------- 4. Tableau de rooms
INSERT INTO rooms
(
  room_number,
  room_type,
  capacity
)
VALUE
(1,'Cardio', 30),
(2,'Weights', 50),
(3,'Studio', 20);
------------------------------------------- 5. Tableau de memberships
ALTER TABLE memberships
ADD COLUMN end_date DATE;
INSERT INTO memberships 
(
  member_id,
  room_id,
  start_date,
  end_date
)
VALUES
(1,2,'2024-11-25','2024-12-30'),
(2,3,'2024-11-30','2025-01-30'),
(3,1,'2024-12-01','2025-02-28'),
(4,2,'2024-12-03','2025-04-30'),
(5,2,'2024-12-05','2025-03-30'),
(6,3,'2024-12-06','2025-12-25'),
(7,1,'2024-12-10','2025-12-25'),
(8,2,'2024-12-15','2025-01-25'),
(9,3,'2024-11-10','2025-12-10'),
(10,1,'2024-11-15','2025-11-30');
------------------------------------------- 6. Tableau des appointments
INSERT INTO appointments
(
  appointment_date,
  appointment_time,
  trainer_id,
  member_id
)
VALUE
('2024-11-25','10:00:00', 1, 1),
('2024-11-30','17:45:00', 4, 2),
('2024-12-01','09:15:00', 1, 3),
('2024-12-03','18:30:00', 2, 4),
('2024-12-05','17:00:00', 1, 5),
('2024-12-06','09:30:00', 2, 6),
('2024-12-10','12:30:00', 4, 7),
('2024-12-15','13:00:00', 3, 8),
('2023-11-25','10:00:00', 1, 1);
---------------------------------------------------------------------------
-- -- 2.Instruction SELECT : Récupérer tous les départements
SELECT * FROM departements;
----------------------------------------------------------------------------
-- 3. Clause ORDER BY : Trier les membres par date de naissance
SELECT * FROM members
ORDER BY date_of_birth DESC;
----------------------------------------------------------------------------
-- 4. Filtrer les membres uniques par sexe (DISTINCT)
SELECT DISTINCT gender FROM members;
----------------------------------------------------------------------------
-- 5. Clause LIMIT : Obtenir les 3 premiers entraîneurs
SELECT * FROM trainers
LIMIT 3;  
----------------------------------------------------------------------------
-- 6. Clause WHERE : Membres nés après 2000
SELECT * FROM members
WHERE YEAR(date_of_birth) > 2000; 
----------------------------------------------------------------------------
-- 7. Opérateurs Logiques : Entraîneurs dans des départements "Musculation" et "Cardio"
SELECT * FROM trainers
WHERE specialization = 'Musculation' OR specialization = 'Cardio';
-----------------------
SELECT * FROM trainers
WHERE specialization IN ('Musculation', 'Cardio');
----------------------------------------------------------------------------
-- 8. Opérateurs Spéciaux : Vérifier des plages de dates (Listez les abonnements entre le 1er décembre et le 7 décembre 2024)
SELECT * FROM memberships
WHERE start_date BETWEEN '2024-12-01' AND '2024-12-07';
----------------------------------------------------------------------------
-- 9. Expressions Conditionnelles : Nommer les catégories d'âge des membres : Ajoutez une colonne catégorisant les membres en "Junior", "Adulte", ou "Senior" selon leur âge.
SELECT 
  first_name,
  last_name,
  date_of_birth,
  CASE 
    WHEN ( DATEDIFF(CURDATE(), date_of_birth) / 365) < 20 THEN 'Junior'
    WHEN ( DATEDIFF(CURDATE(), date_of_birth) / 365) BETWEEN 20 AND 30 THEN 'Adulte'
    ELSE 'Senior'
  END AS age_category
FROM members;
----------------------------------------------------------------------------
-- 10. Fonctions d'Agrégation : Nombre total de rendez-vous (Comptez le nombre total de rendez-vous d'entraînement enregistrés)
SELECT COUNT(*) AS nombre_total_appointments  FROM appointments;
----------------------------------------------------------------------------
-- 11. COUNT avec GROUP BY : Nombre d'entraîneurs par département (Comptez le nombre d'entraîneurs dans chaque département)
SELECT COUNT(trainer_id) AS Nombre_entraîneurs ,department_id FROM trainers 
GROUP BY department_id;
----------------------------------------------------------------------------
-- 12. AVG : Âge moyen des membres (Calculez l'âge moyen des membres)
SELECT AVG((DATEDIFF(CURDATE(),date_of_birth) / 365)) AS Avg_age_membres FROM members
----------------------------------------------------------------------------
-- 13. MAX : Dernier rendez-vous (Trouvez la date et l'heure du dernier rendez-vous enregistré)
SELECT MAX(appointment_date) AS Dernier_date_appointments, MAX(appointment_time)  AS Dernier_time_appointments FROM appointments;
----------------------------------------------------------------------------
-- 14. SUM : Total des abonnements par salle (Calculez le total des abonnements pour chaque salle d'entraînement)
SELECT COUNT(membership_id) AS Sum_abonnements, room_id FROM memberships
GROUP BY room_id;
----------------------------------------------------------------------------
-- 15. Contraintes : Vérifier les membres sans e-mail (Récupérez tous les membres dont le champ email est vide)
SELECT * FROM members
WHERE email IS NULL;
----------------------------------------------------------------------------
-- 16. Jointure : Liste des rendez-vous avec noms des entraîneurs et membres (Récupérez les rendez-vous avec les noms des entraîneurs et des membres)
SELECT 
    a.appointment_date,
    a.appointment_time,
    CONCAT(t.first_name, ' ', t.last_name) AS Nom_entraineur,
    CONCAT(m.first_name, ' ', m.last_name) AS Nom_member
FROM 
    appointments a
INNER JOIN 
    trainers t 
ON 
    a.trainer_id = t.trainer_id
INNER JOIN 
    members m 
ON 
    a.member_id = m.member_id;
----------------------------------------------------------------------------
-- 17. DELETE : Supprimer les rendez-vous avant 2024 (Supprimez tous les rendez-vous programmés avant 2024)
DELETE FROM appointments
WHERE YEAR(appointment_date) < 2024 ;
SELECT * FROM appointments;
----------------------------------------------------------------------------
-- 18. UPDATE : Modifier un département (Changez le nom du département "Musculation" en "Force et Conditionnement")
UPDATE departements
SET department_name = 'Force et Conditionnement'
WHERE department_name = 'Musculation';
----------------------------------------------------------------------------
-- 19. Clause HAVING : Membres par sexe avec au moins 2 entrées (Listez les genres ayant au moins deux membres)
SELECT gender, COUNT(member_id) AS Nombre_members FROM members
GROUP BY gender HAVING COUNT(member_id) >= 2;
----------------------------------------------------------------------------
-- 20. Créer une vue : Abonnements actifs (Créez une vue listant tous les abonnements en cours)
CREATE VIEW Abonnements_actifs AS
SELECT 
    member_id, 
    start_date, 
    end_date 
FROM 
    memberships
WHERE 
    CURRENT_DATE() BETWEEN start_date AND end_date;