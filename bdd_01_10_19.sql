-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mar. 01 oct. 2019 à 10:53
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `connectanou`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id_admin` int(255) NOT NULL,
  `login_admin` varchar(50) NOT NULL,
  `mdp_admin` varchar(50) NOT NULL,
  `tel_admin` int(10) NOT NULL,
  `email_admin` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `code_postal`
--

CREATE TABLE `code_postal` (
  `id_cp` int(11) NOT NULL,
  `cp` int(5) NOT NULL,
  `ville` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `code_postal`
--

INSERT INTO `code_postal` (`id_cp`, `cp`, `ville`) VALUES
(1, 97400, 'Saint-Denis'),
(2, 97410, 'Saint-Pierre'),
(3, 97412, 'Bras-Panon'),
(4, 97413, 'Cilaos'),
(5, 97414, 'Entre-Deux'),
(6, 97419, 'La Possession'),
(7, 97420, 'Le Port'),
(8, 97425, 'Les Avirons'),
(9, 97426, 'Les Trois-Bassins'),
(10, 97427, 'Etang-salé'),
(11, 97429, 'La Petite île'),
(12, 97430, 'Le Tampon'),
(13, 97431, 'La Plaine des Palmistes'),
(14, 97433, 'Salazie'),
(15, 97436, 'Saint-Leu'),
(16, 97438, 'Saint-Marie'),
(17, 97439, 'Saint-Rose'),
(18, 97440, 'Saint-André'),
(19, 97441, 'Saint-Suzanne'),
(20, 97442, 'Saint-Philippe '),
(21, 97450, 'Saint-Louis'),
(22, 97460, 'Saint-Paul'),
(23, 97470, 'Saint-Benoît'),
(24, 97480, 'Saint-Joseph');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id_real` int(11) NOT NULL,
  `id_etat_projet` int(11) NOT NULL,
  `date_contact` datetime NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `diplome`
--

CREATE TABLE `diplome` (
  `id_real` int(11) NOT NULL,
  `id_niveau_diplome` int(11) NOT NULL,
  `annee_obtention` date NOT NULL,
  `desc_diplome` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

CREATE TABLE `domaine` (
  `id_domaine` int(11) NOT NULL,
  `label_domaine` varchar(100) NOT NULL,
  `desc_domaine` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `domaine`
--

INSERT INTO `domaine` (`id_domaine`, `label_domaine`, `desc_domaine`) VALUES
(1, 'Informatique - Réseau - Télécom - ', NULL),
(2, 'Économie - Droit juridique - Politique', NULL),
(3, 'Électricité - Électronique - Robotique - Mécanique', NULL),
(4, 'Agriculture - Agroalimentaire - Environnement', NULL),
(5, 'Mode - Esthétique - Beauté ', NULL),
(6, 'Banque - Assurance - Immobilier', NULL),
(7, 'Construction - Architecture - Travaux publics ', NULL),
(8, 'Comptabilité - Finance - Gestion', NULL),
(9, 'Tourisme - Hôtellerie - Restauration', NULL),
(10, 'Transport - Logistique', NULL),
(11, 'Arts - Lettres - Langues - Culture - Sciences humaines et sociales', NULL),
(12, 'Édition - Presse - Médias - Journalisme', NULL),
(13, 'Commerce - Vente - Marketing', NULL),
(14, 'Sport - Loisir', NULL),
(15, 'Santé - Social', NULL),
(16, 'Audiovisuel - Graphisme', NULL),
(17, 'Autre', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ecole`
--

CREATE TABLE `ecole` (
  `id_ecole` int(11) NOT NULL,
  `nom_ecole` varchar(30) NOT NULL,
  `adresse_ecole` text,
  `tel_ecole` int(11) DEFAULT NULL,
  `email_ecole` varchar(200) DEFAULT NULL,
  `site_internet_ecole` varchar(200) DEFAULT NULL,
  `id_cp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ecole`
--

INSERT INTO `ecole` (`id_ecole`, `nom_ecole`, `adresse_ecole`, `tel_ecole`, `email_ecole`, `site_internet_ecole`, `id_cp`) VALUES
(1, 'SUPINFO', NULL, NULL, NULL, NULL, 1),
(2, 'HESIP', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `etat_projet`
--

CREATE TABLE `etat_projet` (
  `id_etat_projet` int(11) NOT NULL,
  `label_etat` varchar(50) NOT NULL,
  `id_real` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etat_projet`
--

INSERT INTO `etat_projet` (`id_etat_projet`, `label_etat`, `id_real`) VALUES
(1, 'Brouillon', NULL),
(2, 'Validé', NULL),
(3, 'Publié', NULL),
(4, 'En négociation', NULL),
(5, 'En cours de réalisation', NULL),
(6, 'Recette', NULL),
(7, 'Payé-Clôturé', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `id_formation` int(11) NOT NULL,
  `titre_formation` varchar(200) NOT NULL,
  `date_debut_formation` date NOT NULL,
  `date_fin_formation` date NOT NULL,
  `specialisation_formation` varchar(200) NOT NULL,
  `id_domaine` int(11) NOT NULL,
  `id_niveau_diplome` int(11) NOT NULL,
  `id_ecole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `form_contact`
--

CREATE TABLE `form_contact` (
  `id_contact` int(11) NOT NULL,
  `nom_contact` varchar(100) NOT NULL,
  `prenom_contact` varchar(100) NOT NULL,
  `email_contact` varchar(100) NOT NULL,
  `tel_contact` int(11) NOT NULL,
  `message_contact` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `histo_etat_projet`
--

CREATE TABLE `histo_etat_projet` (
  `id_projet` int(11) NOT NULL,
  `id_etat_projet` int(11) NOT NULL,
  `date_etat_projet` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `niveau_diplome`
--

CREATE TABLE `niveau_diplome` (
  `id_niveau_diplome` int(11) NOT NULL,
  `label_niveau_diplome` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `niveau_diplome`
--

INSERT INTO `niveau_diplome` (`id_niveau_diplome`, `label_niveau_diplome`) VALUES
(1, 'BAC'),
(2, 'BAC+1'),
(3, 'BAC+2'),
(4, 'BAC+3'),
(5, 'BAC+4'),
(6, 'BAC+5'),
(7, 'BAC+6'),
(8, 'BAC+7'),
(9, 'BAC+8'),
(10, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `organisation`
--

CREATE TABLE `organisation` (
  `id_org` int(11) NOT NULL,
  `SIRET` int(14) NOT NULL,
  `raison_sociale` varchar(50) NOT NULL,
  `sigle_org` text,
  `logo_URL` text,
  `activite_org` text NOT NULL,
  `tel_orga` int(11) NOT NULL,
  `nb_salaries` int(11) NOT NULL,
  `site_internet_org` text NOT NULL,
  `adresse_org` text NOT NULL,
  `id_cp` int(11) NOT NULL,
  `id_type_org` int(11) NOT NULL,
  `id_porteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `porteur`
--

CREATE TABLE `porteur` (
  `id_porteur` int(11) NOT NULL,
  `nom_porteur` varchar(50) NOT NULL,
  `prenom_porteur` varchar(50) NOT NULL,
  `email_porteur` varchar(200) NOT NULL,
  `login_porteur` varchar(50) NOT NULL,
  `mdp_porteur` varchar(50) NOT NULL,
  `tel_porteur` int(11) NOT NULL,
  `date_creation_compte` datetime NOT NULL,
  `poste_porteur` int(11) DEFAULT NULL,
  `id_org` int(11) NOT NULL,
  `id_cp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `id_projet` int(11) NOT NULL,
  `titre_projet` varchar(100) NOT NULL,
  `desc_projet` varchar(500) NOT NULL,
  `date_butoir_projet` date NOT NULL,
  `date_debut` date NOT NULL,
  `URL_PJ` text NOT NULL,
  `Budget_min_projet` int(11) NOT NULL,
  `budget_max_projet` int(11) NOT NULL,
  `nb_realisateurs` int(11) NOT NULL,
  `stage` tinyint(1) NOT NULL,
  `id_porteur` int(11) NOT NULL,
  `id_type_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE `realisateur` (
  `id_real` int(11) NOT NULL,
  `nom_real` varchar(100) DEFAULT NULL,
  `prenom_real` varchar(20) DEFAULT NULL,
  `email_real` varchar(200) DEFAULT NULL,
  `mdp_real` varchar(100) DEFAULT NULL,
  `login_real` varchar(200) DEFAULT NULL,
  `tel_real` int(11) NOT NULL,
  `datenais_real` date DEFAULT NULL,
  `n_mdp` int(1) DEFAULT '0',
  `cv_URL` text,
  `linkedin_URL` text,
  `photoprofil_URL` text,
  `date_creation_compte` datetime DEFAULT NULL,
  `id_cp` int(11) DEFAULT NULL,
  `id_ecole` int(11) DEFAULT NULL,
  `id_statut_real` int(11) DEFAULT NULL,
  `id_formation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `realisateur`
--

INSERT INTO `realisateur` (`id_real`, `nom_real`, `prenom_real`, `email_real`, `mdp_real`, `login_real`, `tel_real`, `datenais_real`, `n_mdp`, `cv_URL`, `linkedin_URL`, `photoprofil_URL`, `date_creation_compte`, `id_cp`, `id_ecole`, `id_statut_real`, `id_formation`) VALUES
(1, 'MAGDELEINE', 'Yvan', 'yvanmagdeleine@gmail.com', '$2y$10$dHO98Uwj3M2TSrVtEsYw7u8Fi9eBl2pPA1/Q.SkKO5MdkgovFvhbW', NULL, 693319267, '1998-12-09', 0, NULL, '', NULL, '2019-09-13 06:35:54', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `realisation`
--

CREATE TABLE `realisation` (
  `id_real` int(11) NOT NULL,
  `id_projet` int(11) NOT NULL,
  `date_real` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statut_realisateur`
--

CREATE TABLE `statut_realisateur` (
  `id_statut_real` int(11) NOT NULL,
  `label_statut_real` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_realisateur`
--

INSERT INTO `statut_realisateur` (`id_statut_real`, `label_statut_real`) VALUES
(1, 'Etudiant'),
(2, 'Formateur'),
(3, 'Demandeur d\'emploi'),
(4, 'Salarié'),
(5, 'Entrepreneur'),
(6, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `type_organisation`
--

CREATE TABLE `type_organisation` (
  `id_type_org` int(11) NOT NULL,
  `label_org` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_organisation`
--

INSERT INTO `type_organisation` (`id_type_org`, `label_org`) VALUES
(1, 'Association'),
(2, 'Entreprise'),
(3, 'Société'),
(4, 'Organisation publique'),
(5, 'Coopérative');

-- --------------------------------------------------------

--
-- Structure de la table `type_projet`
--

CREATE TABLE `type_projet` (
  `id_type_projet` int(11) NOT NULL,
  `label_type_projet` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_projet`
--

INSERT INTO `type_projet` (`id_type_projet`, `label_type_projet`) VALUES
(1, 'Informatique'),
(2, 'Infographie'),
(3, 'Communication'),
(4, 'Business'),
(5, 'Télésecrétariat'),
(6, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `validation_real`
--

CREATE TABLE `validation_real` (
  `id_admin` int(11) NOT NULL,
  `id_real` int(11) NOT NULL,
  `date_validation_real` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id_admin`);

--
-- Index pour la table `code_postal`
--
ALTER TABLE `code_postal`
  ADD PRIMARY KEY (`id_cp`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_real`,`id_etat_projet`),
  ADD KEY `id_etat_projet` (`id_etat_projet`);

--
-- Index pour la table `diplome`
--
ALTER TABLE `diplome`
  ADD PRIMARY KEY (`id_real`,`id_niveau_diplome`),
  ADD KEY `diplome_ibfk_2` (`id_niveau_diplome`);

--
-- Index pour la table `domaine`
--
ALTER TABLE `domaine`
  ADD PRIMARY KEY (`id_domaine`);

--
-- Index pour la table `ecole`
--
ALTER TABLE `ecole`
  ADD PRIMARY KEY (`id_ecole`),
  ADD KEY `id_cp` (`id_cp`);

--
-- Index pour la table `etat_projet`
--
ALTER TABLE `etat_projet`
  ADD PRIMARY KEY (`id_etat_projet`),
  ADD KEY `IdReal` (`id_real`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id_formation`),
  ADD KEY `IdDomaine` (`id_domaine`),
  ADD KEY `IdNiveau_diplome` (`id_niveau_diplome`),
  ADD KEY `IdEcole` (`id_ecole`);

--
-- Index pour la table `form_contact`
--
ALTER TABLE `form_contact`
  ADD PRIMARY KEY (`id_contact`);

--
-- Index pour la table `histo_etat_projet`
--
ALTER TABLE `histo_etat_projet`
  ADD PRIMARY KEY (`id_projet`,`id_etat_projet`),
  ADD KEY `id_etat_projet` (`id_etat_projet`);

--
-- Index pour la table `niveau_diplome`
--
ALTER TABLE `niveau_diplome`
  ADD PRIMARY KEY (`id_niveau_diplome`);

--
-- Index pour la table `organisation`
--
ALTER TABLE `organisation`
  ADD PRIMARY KEY (`id_org`),
  ADD KEY `id_cp` (`id_cp`),
  ADD KEY `idtype_orga` (`id_type_org`),
  ADD KEY `IdPorteur` (`id_porteur`);

--
-- Index pour la table `porteur`
--
ALTER TABLE `porteur`
  ADD PRIMARY KEY (`id_porteur`),
  ADD KEY `Id_org` (`id_org`),
  ADD KEY `id_cp` (`id_cp`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id_projet`),
  ADD KEY `IdPorteur` (`id_porteur`),
  ADD KEY `id_type_projet` (`id_type_projet`);

--
-- Index pour la table `realisateur`
--
ALTER TABLE `realisateur`
  ADD PRIMARY KEY (`id_real`),
  ADD KEY `id_cp` (`id_cp`),
  ADD KEY `IdEcole` (`id_ecole`),
  ADD KEY `id_statut_real` (`id_statut_real`),
  ADD KEY `IdFormation` (`id_formation`);

--
-- Index pour la table `realisation`
--
ALTER TABLE `realisation`
  ADD KEY `id_projet` (`id_projet`),
  ADD KEY `id_real` (`id_real`);

--
-- Index pour la table `statut_realisateur`
--
ALTER TABLE `statut_realisateur`
  ADD PRIMARY KEY (`id_statut_real`);

--
-- Index pour la table `type_organisation`
--
ALTER TABLE `type_organisation`
  ADD PRIMARY KEY (`id_type_org`);

--
-- Index pour la table `type_projet`
--
ALTER TABLE `type_projet`
  ADD PRIMARY KEY (`id_type_projet`);

--
-- Index pour la table `validation_real`
--
ALTER TABLE `validation_real`
  ADD PRIMARY KEY (`id_admin`,`id_real`),
  ADD KEY `id_real` (`id_real`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id_admin` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `code_postal`
--
ALTER TABLE `code_postal`
  MODIFY `id_cp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `domaine`
--
ALTER TABLE `domaine`
  MODIFY `id_domaine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `ecole`
--
ALTER TABLE `ecole`
  MODIFY `id_ecole` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `etat_projet`
--
ALTER TABLE `etat_projet`
  MODIFY `id_etat_projet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id_formation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `form_contact`
--
ALTER TABLE `form_contact`
  MODIFY `id_contact` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `niveau_diplome`
--
ALTER TABLE `niveau_diplome`
  MODIFY `id_niveau_diplome` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `organisation`
--
ALTER TABLE `organisation`
  MODIFY `id_org` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `porteur`
--
ALTER TABLE `porteur`
  MODIFY `id_porteur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `realisateur`
--
ALTER TABLE `realisateur`
  MODIFY `id_real` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `statut_realisateur`
--
ALTER TABLE `statut_realisateur`
  MODIFY `id_statut_real` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `type_organisation`
--
ALTER TABLE `type_organisation`
  MODIFY `id_type_org` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `type_projet`
--
ALTER TABLE `type_projet`
  MODIFY `id_type_projet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`id_etat_projet`) REFERENCES `etat_projet` (`id_etat_projet`),
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`id_real`) REFERENCES `realisateur` (`id_real`);

--
-- Contraintes pour la table `diplome`
--
ALTER TABLE `diplome`
  ADD CONSTRAINT `diplome_ibfk_1` FOREIGN KEY (`id_real`) REFERENCES `realisateur` (`id_real`),
  ADD CONSTRAINT `diplome_ibfk_2` FOREIGN KEY (`id_niveau_diplome`) REFERENCES `niveau_diplome` (`id_niveau_diplome`);

--
-- Contraintes pour la table `ecole`
--
ALTER TABLE `ecole`
  ADD CONSTRAINT `ecole_ibfk_3` FOREIGN KEY (`id_cp`) REFERENCES `code_postal` (`id_cp`);

--
-- Contraintes pour la table `etat_projet`
--
ALTER TABLE `etat_projet`
  ADD CONSTRAINT `etat_projet_ibfk_1` FOREIGN KEY (`id_real`) REFERENCES `realisateur` (`id_real`);

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `formation_ibfk_1` FOREIGN KEY (`id_domaine`) REFERENCES `formation` (`id_formation`),
  ADD CONSTRAINT `formation_ibfk_2` FOREIGN KEY (`id_niveau_diplome`) REFERENCES `niveau_diplome` (`id_niveau_diplome`),
  ADD CONSTRAINT `formation_ibfk_3` FOREIGN KEY (`id_ecole`) REFERENCES `ecole` (`id_ecole`);

--
-- Contraintes pour la table `histo_etat_projet`
--
ALTER TABLE `histo_etat_projet`
  ADD CONSTRAINT `histo_etat_projet_ibfk_1` FOREIGN KEY (`id_etat_projet`) REFERENCES `etat_projet` (`id_etat_projet`),
  ADD CONSTRAINT `histo_etat_projet_ibfk_2` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`);

--
-- Contraintes pour la table `organisation`
--
ALTER TABLE `organisation`
  ADD CONSTRAINT `organisation_ibfk_1` FOREIGN KEY (`id_cp`) REFERENCES `code_postal` (`id_cp`),
  ADD CONSTRAINT `organisation_ibfk_2` FOREIGN KEY (`id_type_org`) REFERENCES `type_organisation` (`id_type_org`),
  ADD CONSTRAINT `organisation_ibfk_3` FOREIGN KEY (`id_porteur`) REFERENCES `porteur` (`id_porteur`);

--
-- Contraintes pour la table `porteur`
--
ALTER TABLE `porteur`
  ADD CONSTRAINT `porteur_ibfk_1` FOREIGN KEY (`id_org`) REFERENCES `organisation` (`id_org`),
  ADD CONSTRAINT `porteur_ibfk_2` FOREIGN KEY (`id_cp`) REFERENCES `code_postal` (`id_cp`);

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`id_porteur`) REFERENCES `porteur` (`id_porteur`),
  ADD CONSTRAINT `projet_ibfk_2` FOREIGN KEY (`id_type_projet`) REFERENCES `type_projet` (`id_type_projet`);

--
-- Contraintes pour la table `realisateur`
--
ALTER TABLE `realisateur`
  ADD CONSTRAINT `realisateur_ibfk_1` FOREIGN KEY (`id_cp`) REFERENCES `code_postal` (`id_cp`),
  ADD CONSTRAINT `realisateur_ibfk_2` FOREIGN KEY (`id_ecole`) REFERENCES `ecole` (`id_ecole`),
  ADD CONSTRAINT `realisateur_ibfk_3` FOREIGN KEY (`id_statut_real`) REFERENCES `statut_realisateur` (`id_statut_real`),
  ADD CONSTRAINT `realisateur_ibfk_4` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id_formation`);

--
-- Contraintes pour la table `realisation`
--
ALTER TABLE `realisation`
  ADD CONSTRAINT `realisation_ibfk_1` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`),
  ADD CONSTRAINT `realisation_ibfk_2` FOREIGN KEY (`id_real`) REFERENCES `realisateur` (`id_real`);

--
-- Contraintes pour la table `validation_real`
--
ALTER TABLE `validation_real`
  ADD CONSTRAINT `validation_real_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id_admin`),
  ADD CONSTRAINT `validation_real_ibfk_2` FOREIGN KEY (`id_real`) REFERENCES `realisateur` (`id_real`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
