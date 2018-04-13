/*Creazione tabella DIPENDENTE */

DROP TABLE IF EXISTS `Dipendente`;

CREATE TABLE `Dipendente` (
  codiceDip int(11) NOT NULL,
  nome varchar(20) NOT NULL,
  cognome varchar(20) NOT NULL,
  dataNascita date NOT NULL,
  dataAssunzione date NOT NULL,
  stipendio decimal(7,2) NOT NULL,
  reparto int(2) NOT NULL,
  PRIMARY KEY (codiceDip)
) ENGINE=InnoDB;

/*Popolamento tabella DIPENDETE */

INSERT INTO `Dipendente` (`codiceDip`, `nome`, `cognome`, `dataNascita`, `dataAssunzione`, `stipendio`, `reparto`) VALUES
(1353, 'Andrea', 'Rossi', '1985-07-13', '2015-06-30', 1297.54, 2),
(2763, 'Melania', 'Ferrari', '1982-03-23', '2010-01-15', 1386.75, 1),
(8534, 'Girolamo', 'Cremonesi', '1967-11-30', '1999-02-16', 1650.72, 3),
(1754, 'Laura', 'Udinese', '1990-03-27', '2015-06-30', 1297.54, 3),
(9863, 'Alessandro', 'Zetticci', '1977-07-17', '2005-04-20', 1494.74, 1),
(2654, 'Giovanni', 'Fiorentini', '1985-02-25', '2010-05-15', 1367.54, 2),
(3876, 'Aurelio', 'Conti', '1969-12-24', '2001-08-12', 1599.12, 7),
(3654, 'Rosalia', 'Bergamaschi', '1991-03-26', '2015-03-22', 1303.63, 4),
(8083, 'Adriana', 'Ferrari', '1981-09-29', '2011-03-31', 1349.03, 6),
(2903, 'Andrea', 'Greco', '1995-01-18', '2016-04-21', 1263.87, 3),
(2085, 'Veronica', 'Lori', '1988-11-11', '2005-04-20', 1499.55, 8),
(2563, 'Bruno', 'Schiavone', '1970-08-01', '1999-02-16', 1669.34, 2),
(8735, 'Sergio', 'Ferrari', '1966-12-18', '2001-11-09', 1597.77, 1),
(3728, 'Sabrina', 'Loggia', '1993-01-14', '2014-09-11', 1321.61, 1),
(2378, 'Adriana', 'Mancini', '1985-11-13', '2010-05-15', 1355.02, 7),
(7859, 'Marco', 'Colombo', '1979-10-24', '2002-02-15', 1545.33, 8),
(1639, 'Marcella', 'Baresi', '1996-01-19', '2016-03-30', 1247.55, 4),
(3348, 'Silvano', 'Piazza', '1984-07-21', '2006-06-23', 1458.51, 3),
(9364, 'Iacopo', 'Marchesi', '1980-06-03', '2007-04-20', 1414.54, 6),
(2549, 'Lino', 'Marino', '1978-12-13', '2003-01-07', 1557.17, 7),
(2433, 'Aurora', 'Pagnotto', '1975-10-27', '1999-02-16', 1700.25, 6),
(4639, 'Francesco', 'Cattaneo', '1989-02-01', '2015-06-30', 1296.83, 5),
(4538, 'Flora', 'Esposito', '1991-03-28', '2013-11-12', 1388.09, 5),
(2748, 'Benedetta', 'Florenzi', '1980-08-22', '1999-02-16', 1667.75, 5),
(2688, 'Gennaro', 'Ricci', '1977-12-30', '2002-10-30', 1578.21, 2),
(6664, 'Cosimo', 'Trevisano', '1985-03-26', '2014-03-22', 1348.63, 4),
(8994, 'Bruno', 'Moretti', '1988-04-29', '2009-04-04', 1357.66, 6),
(3563, 'Federico', 'Barbarossa', '1990-04-13', '2009-02-01', 1390.99, 2),
(2466, 'Silvia', 'Sposini', '1996-03-29', '2015-10-30', 1250.29, 8),
(1777, 'Lavinia', 'Toscani', '1970-01-01', '1999-02-16', 1708.30, 4);

/*Creazione tabella REPARTO */

DROP TABLE IF EXISTS `Reparto`;

CREATE TABLE `Reparto` (
  codiceRep int(2) NOT NULL,
  nome varchar(20) NOT NULL,
  capoRep int(11) NOT NULL,
  quantitaProd int(11) NOT NULL,
  PRIMARY KEY (codiceRep),
  FOREIGN KEY (capoRep) REFERENCES Dipendente (codiceDip)
) ENGINE=InnoDB;

/*Popolamento tabella REPARTO */

INSERT INTO `Reparto` (`codiceRep`, `nome`, `capoRep`, `quantitaProd`) VALUES
(1, 'Console', 8735, 126),
(2, 'Telefonia', 2563, 467),
(3, 'Audio', 8534, 201),
(4, 'Informatica', 1777, 288),
(5, 'Video', 2748, 190),
(6, 'Elettrodomestici', 2433, 155),
(7, 'Magazzino', 3876, 1267),
(8, 'Centro Riparazioni', 7859, 47);

ALTER TABLE `Dipendente` ADD FOREIGN KEY (reparto) REFERENCES Reparto (codiceRep) ON UPDATE CASCADE;

/*Creazione tabella PRODOTTO */

DROP TABLE IF EXISTS `Prodotto`;

CREATE TABLE `Prodotto` (
  codiceProd int(11) NOT NULL,
  marca varchar(20) NOT NULL,
  nome varchar(20) NOT NULL,
  colore varchar(20) NOT NULL,
  prezzo decimal(7,2) NOT NULL,
  quantita int(11) NOT NULL,
  reparto int(2) NOT NULL,
  PRIMARY KEY (codiceProd, reparto),
  FOREIGN KEY (reparto) REFERENCES Reparto (codiceRep) ON UPDATE CASCADE
) ENGINE=InnoDB;

/*Popolamento tabella PRODOTTO */

INSERT INTO `Prodotto` (`codiceProd`, `marca`, `nome`, `colore`, `prezzo`, `quantita`, `reparto`) VALUES
(379827, 'Sony', 'Playstation 4', 'nero', 389.99, 18, 01),
(438262, 'Sony', 'Playstation 4 slim', 'nero', 299.99, 6, 01),
(364633, 'Microsoft', 'Xbox One', 'nero', 249.00, 11, 01),
(226345, 'Microsoft', 'Xbox One S', 'bianco', 299.99, 4, 01),
(647834, 'Nintendo', 'Wii U', 'nero', 299.99, 9, 01),
(629456, 'Samsung', 'Galaxy S7', 'nero', 829.00, 12, 02),
(843845, 'Samsung', 'Galaxy S7', 'argento', 829.00, 6, 02),
(283548, 'Samsung', 'Galaxy A5 2016', 'blu', 429.00, 17, 02),
(384543, 'LG', 'G5', 'bianco', 749.90, 10, 02),
(848865, 'Huawei', 'P9', 'nero', 679.00, 2, 02),
(389938, 'Sennheiser', 'HD 205', 'nero', 59.99, 8, 03),
(633398, 'JBL', 'Go', 'rosso', 29.99, 13, 03),
(430032, 'Apple', 'Ipod touch', 'bianco', 239.00, 3, 03),
(538836, 'Bose', 'SoundTouch', 'bianco', 399.95, 5, 03),
(633738, 'Apple', 'MacBook Pro 13', 'argento', 1749.00, 10, 04),
(273373, 'Apple', 'MacBook Pro 15', 'argento', 2799.00, 5, 04),
(288473, 'Dell', 'XPS 13', 'argento', 1599.00, 7, 04),
(363826, 'Dell', 'XPS 15', 'argento', 2099.00, 3, 04),
(363883, 'Asus', 'Zenbook flip', 'nero', 1399.00, 2, 04),
(193221, 'Samsung', 'Q8C 65"', 'argento', 4199.00, 1, 05),
(638363, 'Samsung', 'KU6500 55"', 'nero', 1199.00, 3, 05),
(738373, 'LG', '65E6V 65"', 'nero', 4999.00, 2, 05),
(212251, 'Philips', '65PUT6121 65"', 'argento', 1199.00, 3, 05),
(118222, 'Hoover', 'TE-75', 'rosso', 179.90, 11, 06),
(333622, 'Braun', 'Series 1 1130', 'nero', 39.90, 21, 06),
(549253, 'Bosch', 'Serie 8 WTW855R9IT', 'bianco', 1099.00, 4, 06),
(233947, 'Siemens', 'SN26P892EU', 'argento', 599.99, 3, 06),
(438262, 'Sony', 'Playstation 4 slim', 'nero', 299.99, 13, 07),
(629456, 'Samsung', 'Galaxy S7', 'nero', 829.00, 23, 07),
(633398, 'JBL', 'Go', 'rosso', 29.99, 31, 07),
(273373, 'Apple', 'MacBook Pro 15', 'argento', 2799.00, 9, 07),
(738373, 'LG', '65E6V 65"', 'nero', 4999.00, 5, 07),
(118222, 'Hoover', 'TE-75', 'rosso', 179.90, 15, 07);

/*Creazione tabella FORNITORE */

DROP TABLE IF EXISTS `Fornitore`;

CREATE TABLE `Fornitore` (
  partitaIVA varchar(13) NOT NULL,
  nome varchar(20) NOT NULL,
  nazione varchar(20) NOT NULL,
  citta varchar(20) NOT NULL,
  indirizzo varchar(40) NOT NULL,
  PRIMARY KEY (partitaIVA)
) ENGINE=InnoDB;

/*Popolamento tabella FORNITORE */

INSERT INTO `Fornitore` (`partitaIVA`, `nome`, `nazione`, `citta`, `indirizzo`) VALUES
('IT18342835384', 'Prisma', 'Italia', 'Padova', 'Via Pietro Barozzi, 12'),
('DE639263738', 'Sonne', 'Germania', 'Francoforte', 'Neue Krame, 32'),
('ES393525332', 'Cerrojo', 'Spagna', 'Barcellona', 'Ronda de Sant Pere, 9'),
('ATU12112631', 'Schraubendreher', 'Austria', 'Vienna', 'Salzgries, 17'),
('HR28935534267', 'Klijesta', 'Croazia', 'Zagabria', 'Dubravkin put, 1'),
('IT24825483622', 'Esagono', 'Italia', 'Roma', 'Via Marsala, 114'),
('ES638261726', 'Raspador', 'Spagna', 'Valencia', 'Carrer de la Sang, 8'),
('IT13992538812', 'Piramide', 'Italia', 'Milano', 'Via Alessandro Volta, 10'),
('IT26753625171', 'Sfera', 'Italia', 'Firenze', 'Via della Mattonaia, 25'),
('DE528152721', 'Licht', 'Germania', 'Berlino', 'Kleineweg, 72');

/*Creazione tabella FORNITURA-PRODOTTI */

DROP TABLE IF EXISTS `FornituraProdotti`;

CREATE TABLE `FornituraProdotti` (
  prodotto int(11) NOT NULL,
  partitaIVA varchar(13) NOT NULL,
  PRIMARY KEY (prodotto, partitaIVA),
  FOREIGN KEY (partitaIVA) REFERENCES Fornitore (partitaIVA) ON DELETE CASCADE,
  FOREIGN KEY (prodotto) REFERENCES Prodotto (codiceProd) ON DELETE CASCADE
) ENGINE=InnoDB;

/*Popolamento tabella FORNITURA-PRODOTTI */

INSERT INTO `FornituraProdotti` (`prodotto`, `partitaIVA`) VALUES
(633398, 'IT18342835384'),
(738373, 'DE639263738'),
(118222, 'ES638261726'),
(273373, 'ES393525332'),
(118222, 'DE528152721'),
(379827, 'IT26753625171'),
(629456, 'IT13992538812'),
(633398, 'IT24825483622'),
(738373, 'IT13992538812'),
(273373, 'HR28935534267'),
(633398, 'DE639263738'),
(629456, 'ES638261726'),
(629456, 'IT26753625171'),
(379827, 'DE639263738'),
(273373, 'DE528152721'),
(633398, 'HR28935534267'),
(629456, 'ATU12112631'),
(738373, 'ES393525332'),
(273373, 'IT24825483622'),
(379827, 'HR28935534267');

/*Creazione tabella ORDINI */

DROP TABLE IF EXISTS `Ordini`;

CREATE TABLE `Ordini` (
  reparto int(2) NOT NULL DEFAULT 7,
  codiceOrd int(11) AUTO_INCREMENT NOT NULL,
  prodotto int(11) NOT NULL,
  quantita int(11) NOT NULL,
  fornitore varchar(13),
  dataOrd date NOT NULL,
  PRIMARY KEY (codiceOrd),
  FOREIGN KEY (reparto) REFERENCES Reparto (codiceRep) ON UPDATE CASCADE,
  FOREIGN KEY (prodotto) REFERENCES Prodotto (codiceProd),
  FOREIGN KEY (fornitore) REFERENCES Fornitore (partitaIVA) ON DELETE SET NULL
) ENGINE=InnoDB;

/*Popolamento tabella ORDINI */

INSERT INTO `Ordini` (`codiceOrd`, `prodotto`, `quantita`, `fornitore`, `dataOrd`) VALUES
(120222, 379827, 15, 'IT26753625171', '2015-07-13'),
(114233, 633398, 35, 'HR28935534267', '2015-07-13'),
(153342, 738373, 20, 'ES393525332', '2015-08-17'),
(174265, 273373, 50, 'IT24825483622', '2015-10-23'),
(192432, 629456, 30, 'ATU12112631', '2015-10-23'),
(105271, 118222, 60, 'ES638261726', '2015-01-30'),
(213421, 379827, 25, 'DE639263738', '2016-01-22'),
(232622, 633398, 50, 'IT24825483622', '2016-02-21'),
(242546, 738373, 10, 'IT13992538812', '2016-05-04'),
(243555, 273373, 45, 'IT24825483622', '2016-07-11'),
(283132, 629456, 35, 'IT13992538812', '2016-08-09'),
(294421, 118222, 50, 'DE528152721', '2016-11-01'),
(344425, 379827, 30, 'HR28935534267', '2017-01-21'),
(364243, 633398, 50, 'HR28935534267', '2017-03-09'),
(362144, 738373, 30, 'IT13992538812', '2017-03-09'),
(367736, 273373, 20, 'ES393525332', '2017-03-09'),
(375432, 629456, 40, 'ES638261726', '2017-04-29'),
(355272, 118222, 45, 'ES638261726', '2017-02-28');

/*Creazione tabella CLIENTE */

DROP TABLE IF EXISTS `Cliente`;

CREATE TABLE `Cliente` (
  codFiscale char(16) NOT NULL,
  nome varchar(20) NOT NULL,
  cognome varchar(20) NOT NULL,
  email varchar(50) NOT NULL,
  telefono varchar(20) NOT NULL,
  PRIMARY KEY (codFiscale)
) ENGINE=InnoDB;

/*Popolamento tabella CLIENTE */

INSERT INTO `Cliente` (`codFiscale`, `nome`, `cognome`, `email`, `telefono`) VALUES
('PLRSVT96B05F219L', 'Salvatore', 'Palerma', 'SalvatorePalerma@gmail.com', '+39 3435 721342'),
('LEIMZZ88M12H333G', 'Elio', 'Mazzi', 'ElioMazzi88@outlook.com', '+39 3517 805183'),
('LNITVS70M17D262Z', 'Lino', 'Trevisan', 'Trevisan112@libero.it', '+39 3272 255550'),
('NTAGLL60A46D562T', 'Anita', 'Gallo', 'AnitaGal@gmail.com', '+39 3886 894510'),
('RSTTNT85T68C603D', 'Rosita', 'Trentino', 'RosiTre@live.com', '+39 3340 684172'),
('LSBLTR92A71E775G', 'Elisabetta', 'Lettiere', 'EliLettiere@gmail.com', '+39 3108 027275'),
('DRNPCC69R19E637D', 'Adriano', 'Panicucci', 'AdrianoPanicucci3@libero.it', '+39 3940 387352'),
('LSSCTG86L04D960V', 'Alessio', 'Castiglione', 'AleCast86@outlook.com', '+39 3716 778671'),
('RNLRMN94C47G210H', 'Ornella', 'Romano', 'OrnellaRomano2@gmail.com', '+39 3649 906896'),
('RBRFRR92S65C802X', 'Roberta', 'Ferrari', 'RobertaFerrari@libero.it', '+39 3159 674363');

/*Creazione tabella ACQUISTO */

DROP TABLE IF EXISTS `Acquisto`;

CREATE TABLE `Acquisto` (
  codiceAcq int(11) NOT NULL,
  cliente char(16),
  PRIMARY KEY (codiceAcq),
  FOREIGN KEY (cliente) REFERENCES Cliente (codFiscale) ON DELETE SET NULL
) ENGINE=InnoDB;

/*Popolamento tabella ACQUISTO */

INSERT INTO `Acquisto` (`codiceAcq`, `cliente`) VALUES
(548362, 'PLRSVT96B05F219L'),
(629342, 'LEIMZZ88M12H333G'),
(122344, 'LNITVS70M17D262Z'),
(462824, 'NTAGLL60A46D562T'),
(742322, 'RSTTNT85T68C603D'),
(173034, 'LSBLTR92A71E775G'),
(373004, 'DRNPCC69R19E637D'),
(379303, 'LSSCTG86L04D960V'),
(739362, 'RNLRMN94C47G210H'),
(903553, 'RBRFRR92S65C802X');

/*Creazione tabella ACQUISTI-PRODOTTI */

DROP TABLE IF EXISTS `AcquistiProdotti`;

CREATE TABLE `AcquistiProdotti` (
  prodotto int(11) NOT NULL,
  acquisto int(11) NOT NULL,
  quantita int(11) NOT NULL,
  PRIMARY KEY (prodotto, acquisto),
  FOREIGN KEY (prodotto) REFERENCES Prodotto (codiceProd) ON DELETE CASCADE,
  FOREIGN KEY (acquisto) REFERENCES Acquisto (codiceAcq)
) ENGINE=InnoDB;

/*Popolamento tabella ACQUISTI-PRODOTTI */

INSERT INTO `AcquistiProdotti` (`prodotto`, `acquisto`, `quantita`) VALUES
(379827, 548362, 1),
(633398, 548362, 2),
(118222, 548362, 1),
(633398, 629342, 3),
(118222, 122344, 1),
(273373, 122344, 1),
(633398, 462824, 2),
(738373, 462824, 1),
(118222, 742322, 2),
(633398, 742322, 1),
(273373, 742322, 1),
(273373, 173034, 1),
(379827, 373004, 1),
(118222, 373004, 1),
(273373, 379303, 1),
(629456, 379303, 1),
(629456, 739362, 2),
(629456, 903553, 1),
(118222, 903553, 1),
(273373, 903553, 1),
(379827, 903553, 2);

/*Creazione tabella RIPARAZIONI */

DROP TABLE IF EXISTS `Riparazioni`;

CREATE TABLE `Riparazioni` (
  reparto int(2) NOT NULL DEFAULT 8,
  codiceRip int(11) NOT NULL,
  prodotto int(11) NOT NULL,
  codiceAcq int(11) NOT NULL,
  prezzo decimal(6,2) NOT NULL,
  PRIMARY KEY (codiceRip),
  FOREIGN KEY (reparto) REFERENCES Reparto (codiceRep) ON UPDATE CASCADE,
  FOREIGN KEY (prodotto, codiceAcq) REFERENCES AcquistiProdotti (prodotto, acquisto)
) ENGINE=InnoDB;

/*Popolamento tabella RIPARAZIONI */

INSERT INTO `Riparazioni` (`codiceRip`, `prodotto`, `codiceAcq`, `prezzo`) VALUES
(365551, 379827, 548362, 50.99),
(215271, 379827, 373004, 100.00),
(528883, 273373, 122344, 499.99),
(119123, 633398, 462824, 10.99),
(546288, 118222, 373004, 50.00),
(229003, 629456, 379303, 180.00),
(988877, 629456, 903553, 180.00),
(117721, 273373, 903553, 250.99);

/*Creazione tabella FIDELITY CARD */

DROP TABLE IF EXISTS `FidelityCard`;

CREATE TABLE `FidelityCard` (
  numeroCard int(11) NOT NULL,
  punti int(5) NOT NULL,
  dataScadenza date NOT NULL,
  cliente char(16) NOT NULL,
  PRIMARY KEY (numeroCard),
  FOREIGN KEY (cliente) REFERENCES Cliente (CodFiscale) ON DELETE CASCADE
) ENGINE=InnoDB;

/*Popolamento tabella FIDELITY CARD */

INSERT INTO `FidelityCard` (`numeroCard`, `punti`, `dataScadenza`, `Cliente`) VALUES
(273933, 855, '2020-03-23', 'PLRSVT96B05F219L'),
(538372, 99, '2022-04-15', 'LEIMZZ88M12H333G'),
(181123, 4312, '2017-09-30', 'LNITVS70M17D262Z'),
(221384, 5543, '2022-03-15', 'NTAGLL60A46D562T'),
(337272, 4321, '2019-11-02', 'RSTTNT85T68C603D'),
(124774, 3105, '2018-07-28', 'LSBLTR92A71E775G'),
(277456, 605, '2017-12-24', 'DRNPCC69R19E637D'),
(332772, 4100, '2018-01-04', 'LSSCTG86L04D960V'),
(199821, 1658, '2022-05-12', 'RNLRMN94C47G210H'),
(226443, 6780, '2020-10-15', 'RBRFRR92S65C802X');

/*Creazione tabella FATTURA */

DROP TABLE IF EXISTS `Fattura`;

CREATE TABLE Fattura (
  numeroFatt int(4) NOT NULL,
  dataFatt date NOT NULL,
  totale decimal(7,2) NOT NULL,
  acquisto int(11) NOT NULL,
  PRIMARY KEY (numeroFatt, dataFatt),
  FOREIGN KEY (acquisto) REFERENCES Acquisto (CodiceAcq)
) ENGINE=InnoDB;

/*Creazione trigger NumeroFattura */

DROP TRIGGER IF EXISTS NumeroFattura;

DELIMITER $
CREATE TRIGGER NumeroFattura
BEFORE INSERT ON Fattura
FOR EACH ROW
BEGIN
DECLARE conteggio INTEGER;
DECLARE dataRecente DATE;
SELECT COUNT(*) FROM Fattura INTO conteggio;
SELECT MAX(dataFatt) FROM Fattura INTO dataRecente;
IF(conteggio=0)
THEN
SET NEW.numeroFatt=1;
END IF;
IF(conteggio>0)
THEN
IF(NEW.dataFatt>dataRecente)
THEN
SET NEW.numeroFatt=1;
ELSE IF(NEW.dataFatt=dataRecente)
THEN
SET NEW.numeroFatt=(SELECT MAX(numeroFatt) FROM Fattura
WHERE dataFatt=dataRecente)+1;
END IF;
END IF;
END IF;
END $
DELIMITER ;

/*Popolamento tabella FATTURA */

INSERT INTO `Fattura` (`dataFatt`, `totale`, `acquisto`) VALUES
('2017-03-10', 629.87, 548362),
('2017-03-10', 89.97, 629342),
('2017-03-10', 2978.9, 122344),
('2017-03-10', 5058.98, 462824),
('2017-03-10', 3188.79, 742322),
('2017-03-10', 2799.00, 173034),
('2017-03-10', 569.89, 373004),
('2017-03-11', 3628.00, 379303),
('2017-03-11', 1658.00, 739362),
('2017-03-11', 4587.88, 903553);

/*Creazione tabella PAGAMENTO */

DROP TABLE IF EXISTS `Pagamento`;

CREATE TABLE `Pagamento` (
  idTransazione int(11) NOT NULL,
  acquisto int(11) NOT NULL,
  tipo enum('Contanti','Carte','Rateizzato') NOT NULL,
  circuito varchar(20) default NULL,
  numeroRate int(2) default NULL,
  PRIMARY KEY (idTransazione),
  FOREIGN KEY (acquisto) REFERENCES Acquisto (CodiceAcq)
) ENGINE=InnoDB;

/*Popolamento tabella PAGAMENTO */

INSERT INTO `Pagamento` (`idTransazione`, `acquisto`, `tipo`, `circuito`, `numeroRate`) VALUES
(244836, 548362, 'Carte', 'Visa', NULL),
(637293, 629342, 'Contanti', NULL, NULL),
(114213, 122344, 'Carte', 'MasterCard', NULL),
(236394, 462824, 'Rateizzato', NULL, 24),
(774898, 742322, 'Rateizzato', NULL, 12),
(344252, 173034, 'Carte', 'Maestro', NULL),
(263004, 373004, 'Contanti', NULL, NULL),
(667503, 379303, 'Rateizzato', NULL, 18),
(341936, 739362, 'Carte', 'MasterCard', NULL),
(103500, 903553, 'Rateizzato', NULL, 24);

/*Creazione trigger NuovoCapoRep */

DROP TRIGGER IF EXISTS NuovoCapoRep;

DELIMITER $
CREATE TRIGGER NuovoCapoRep
BEFORE DELETE ON Dipendente
FOR EACH ROW
BEGIN
IF(SELECT r.capoRep
FROM Reparto r JOIN Dipendente d ON r.capoRep=d.codiceDip
WHERE r.capoRep=OLD.codiceDip)
THEN
UPDATE Reparto
SET capoRep=(SELECT codicedip 
FROM Dipendente 
WHERE reparto=OLD.reparto AND dataAssunzione=(SELECT MIN(dataAssunzione) 
FROM Dipendente 
WHERE reparto=OLD.reparto AND dataAssunzione!=OLD.dataAssunzione))
WHERE capoRep=OLD.codiceDip;
END IF;
END $
DELIMITER ;

/*Creazione trigger Riordino50Pezzi */

DROP TRIGGER IF EXISTS Riordino50Pezzi;

DELIMITER $
CREATE TRIGGER Riordino50Pezzi
AFTER UPDATE ON Prodotto
FOR EACH ROW
BEGIN
DECLARE fornitore VARCHAR(13);
SELECT partitaIVA 
FROM FornituraProdotti 
WHERE prodotto=NEW.codiceProd 
ORDER BY RAND() LIMIT 1 INTO fornitore;
IF(OLD.quantita>=10)
THEN
IF(NEW.reparto=7 AND NEW.quantita<10)
THEN
INSERT INTO `Ordini` (`prodotto`, `quantita`, `fornitore`, `dataOrd`) 
VALUES (NEW.codiceProd, 50, fornitore, CURDATE());
END IF;
END IF;
END $
DELIMITER ;

/*Creazione trigger AggiornoPunti */

DROP TRIGGER IF EXISTS AggiornoPunti;
DELIMITER $
CREATE TRIGGER AggiornoPunti
AFTER INSERT ON Fattura
FOR EACH ROW
BEGIN
DECLARE puntiAcq INT(5);
DECLARE clienteAcq CHAR(16);
SELECT FLOOR(NEW.totale) INTO puntiAcq;
SELECT cliente 
FROM Acquisto 
WHERE codiceAcq=NEW.acquisto INTO clienteAcq;
UPDATE FidelityCard
SET punti=punti+puntiAcq
WHERE cliente=clienteAcq;
END $
DELIMITER ;

/*Creazione funzione ScattiAnzianita */

DROP FUNCTION IF EXISTS ScattiAnzianita;

DELIMITER $
CREATE FUNCTION ScattiAnzianita (codDip INT)
RETURNS INT(2)
BEGIN
DECLARE NumeroScatti INT(2);
SELECT FLOOR(DATEDIFF(CURDATE(), d.dataAssunzione)/365/3) INTO NumeroScatti
FROM Dipendente d
WHERE codiceDip=codDip;
IF(NumeroScatti>10)
THEN
SET NumeroScatti=10;
END IF;
RETURN NumeroScatti;
END $
DELIMITER ;

/*Creazione funzione RetribuzioneAnzianita */

DROP FUNCTION IF EXISTS RetribuzioneAnzianita;

DELIMITER $
CREATE FUNCTION RetribuzioneAnzianita (codDip INT)
RETURNS DECIMAL(5,2)
BEGIN
DECLARE BonusAnzianita DECIMAL(5,2);
SELECT ScattiAnzianita(codDip)*20.66 INTO BonusAnzianita
FROM Dipendente d
WHERE codiceDip=codDip;
RETURN BonusAnzianita;
END $
DELIMITER ;

/*Creazione funzione CostoRata */

DROP FUNCTION IF EXISTS CostoRata;

DELIMITER $
CREATE FUNCTION CostoRata (codAcq INT)
RETURNS DECIMAL(5,2) 
BEGIN
DECLARE Rata Decimal(5,2);
SELECT f.totale*0.0058/(1-1/POWER(1+0.0058, p.numeroRate))+1.50 INTO Rata
FROM Pagamento p JOIN Fattura f ON p.acquisto=f.acquisto
WHERE p.acquisto=codAcq;
RETURN Rata;
END $
DELIMITER ;
