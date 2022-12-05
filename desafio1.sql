DROP DATABASE IF EXISTS  SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plano_usuario(
	plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano VARCHAR(255) NOT NULL,
    valor_plano DOUBLE NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.plano_usuario
  (plano, valor_plano)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

CREATE TABLE SpotifyClone.usuario(
	usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    data_de_assinatura DATE NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano_usuario(plano_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.usuario
  (usuario_id, nome_usuario, idade, data_de_assinatura, plano_id)
VALUES
    (1, 'Barbara Liskov', '82', '2019-10-20', 1),
    (2, 'Robert Cecil Martin', '58', '2017-01-06', 1),
    (3, 'Ada Lovelace', '37', '2017-12-30', 2),
    (4, 'Martin Fowler', '46', '2017-01-17', 2),
    (5, 'Sandi Metz', '58', '2018-04-29', 2),
    (6, 'Paulo Freire', '19', '2018-02-14', 3),
    (7, 'Bell Hooks', '26', '2018-01-05', 3),
	  (8, 'Christopher Alexander', '85', '2019-06-05', 4),
    (9, 'Judith Butler', '45', '2020-05-13', 4),
    (10, 'Jorge Amado', '58', '2017-02-17', 4);

CREATE TABLE SpotifyClone.artista(
	id_artista INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(255) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.artista
  (nome_artista)
VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

CREATE TABLE SpotifyClone.album(
	album_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(255) NOT NULL,
    id_artista INT NOT NULL,
    ano_lancamento INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artista(id_artista)
) engine = InnoDB;

INSERT INTO SpotifyClone.album
	(nome_album, id_artista, ano_lancamento)
VALUES
	('Renaissance',	1,	2022),
	('Jazz', 2,	1978),
	('Hot Space', 2, 1982),
	('Falso Brilhante',	3, 1998),
	('Vento de Maio', 3, 2001),
	('QVVJFA?',	4, 2003),
	('Somewhere Far Beyond', 5,	2007),
	('I Put A Spell On You', 6,	2012);


CREATE TABLE SpotifyClone.cancoes(
  id_cancoes INT PRIMARY KEY AUTO_INCREMENT,
  musica VARCHAR(255) NOT NULL,
  album_id INT NOT NULL,
  id_artista INT NOT NULL,
  duracao_segundos INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.cancoes(album_id, id_artista, musica, duracao_segundos)
VALUES
	(1,	1, 'BREAK MY SOUL', 279),
	(1,	1,	'VIRGO’S GROOVE', 369),
	(1,	1, 'ALIEN SUPERSTAR', 116),
	(2,	2, 'Don’t Stop Me Now',	203),
	(3,	2,'Under Pressure',	152),
	(4,	3, 'Como Nossos Pais', 105),
	(5,	3, 'O Medo de Amar é o Medo de Ser Livre', 207),
	(6,	4, 'Samba em Paris', 267),
	(7,	5, 'The Bard’s Song', 244),
	(8,	6, 'Feeling Good', 100);

CREATE TABLE SpotifyClone.seguindo_artistas(
  usuario_id INT NOT NULL,
  id_artista INT NOT NULL,
  PRIMARY KEY (usuario_id, id_artista),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario(usuario_id),
  FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artista(id_artista)
) engine = InnoDB;

INSERT INTO SpotifyClone.seguindo_artistas(usuario_id, id_artista)
VALUES
	(1,	1),
	(1,	2),
	(1,	3),
	(2,	1),
	(2,	3),
	(3,	2),
	(4,	4),
	(5,	5),
	(5,	6),
	(6,	6),
	(6,	1),
	(7,	6),
	(9,	3),
	(10,2);

CREATE TABLE SpotifyClone.historico_de_reproducoes(
  usuario_id INT NOT NULL,
  id_cancoes INT NOT NULL,
  reproduction_date DATETIME NOT NULL,
  PRIMARY KEY (usuario_id, id_cancoes),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario(usuario_id),
  FOREIGN KEY (id_cancoes) REFERENCES SpotifyClone.cancoes(id_cancoes)
) engine = InnoDB;

INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, id_cancoes, reproduction_date)
VALUES
	(1,8,'2022-02-28 10:45:55'),
	(1,2,'2020-05-02 05:30:35'),
	(1,10,'2020-03-06 11:22:33'),
	(2,10,'2022-08-05 08:05:17'),
	(2,7,'2020-01-02 07:40:33'),
	(3,10,'2020-11-13 16:55:13'),
	(3,2,'2020-12-05 18:38:30'),
	(4,8,'2021-08-15 17:10:10'),
	(5,8,'2022-01-09 01:44:33'),
	(5,5,'2020-08-06 15:23:43'),
	(6,7,'2017-01-24 00:31:17'),
	(6,1,'2017-10-12 12:35:20'),
	(7,4,'2011-12-15 22:30:49'),
	(8,4,'2012-03-17 14:56:41'),
	(9,9,'2022-02-24 21:14:22'),
	(10,3,'2015-12-13 08:30:22');
