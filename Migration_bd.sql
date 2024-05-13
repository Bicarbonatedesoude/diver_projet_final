
 
drop table if exists utilisateur;
drop table if exists public.taches;
drop table if exists public.sous_tache;
 
CREATE TABLE utilisateur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    courriel VARCHAR(255),
    cle_api VARCHAR(30),
    password VARCHAR(100)
);
 
CREATE TABLE public.taches (
    id SERIAL PRIMARY KEY,
    utilisateur_id INTEGER,
    description VARCHAR(500),
    date_debut DATE,
    date_echeance DATE,
    complete BOOLEAN,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id)
);
 
CREATE TABLE public.sous_tache (
    id SERIAL PRIMARY KEY,
    tache_id INTEGER,
    titre VARCHAR(100),
    complete BOOLEAN,
    FOREIGN KEY (tache_id) REFERENCES taches(id)
);



-- Insérer des utilisateurs initiaux
INSERT INTO utilisateur (courriel, cle_api, password)
VALUES
    ('utilisateur@utilisateur.com', 'cle_api_test', 'motdepasse123'),
    ('allo@allo.com', 'allo_cle', 'allo');

-- Insérer des tâches initiales liées à des utilisateurs
INSERT INTO public.taches (utilisateur_id, description, date_debut, date_echeance, complete)
VALUES
    (1, 'Faire les courses', '2024-05-01', '2024-05-05', false),
    (2, 'Réviser examen', '2024-04-25', '2024-05-10', true);

-- Insérer des sous-tâches initiales liées à des tâches
INSERT INTO public.sous_tache (tache_id, titre, complete)
VALUES
    (1, 'Acheter des légumes', false),
    (1, 'Acheter du lait', false),
    (2, 'Lire chapitre 1', true),
    (2, 'Faire les exercices', true);
   
   
   
   select * from utilisateur;
  select * from public.taches;
 select * from public.sous_tache;
