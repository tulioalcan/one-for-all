DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.sing(
      plano_id INT PRIMARY KEY AUTO_INCREMENT,
      plano VARCHAR(50) NOT NULL,
      valor_plano DECIMAL(4,2) NOT NULL      
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artist(
      artist_id INT PRIMARY KEY AUTO_INCREMENT,
      artista VARCHAR(50) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albums(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album VARCHAR(50) NOT NULL,
      ano_lacamento YEAR NOT NULL,
      artist_id INT NOT NULL,
      CONSTRAINT FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.songs(
      song_id INT PRIMARY KEY AUTO_INCREMENT,
      song_name VARCHAR(50) NOT NULL,
      duracao_segundos INT NOT NULL,
      album_id INT NOT NULL,
      CONSTRAINT FOREIGN KEY (album_id) REFERENCES albums (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
      usuario_id INT PRIMARY KEY AUTO_INCREMENT,
      usuario VARCHAR(50) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      data_assinatura DATE NOT NULL,
      CONSTRAINT FOREIGN KEY (plano_id) REFERENCES sing (plano_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.follow(
      usuario_id INT NOT NULL,
      artist_id INT NOT NULL,
      PRIMARY KEY (usuario_id, artist_id),
      CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES user (usuario_id),
      CONSTRAINT FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historic(
	  data_reproducao DATETIME NOT NULL,
      song_id INT NOT NULL,
      usuario_id INT NOT NULL,      
      PRIMARY KEY (song_id, usuario_id),
      CONSTRAINT FOREIGN KEY (song_id) REFERENCES songs (song_id),
      CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES user (usuario_id)      
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.sing (plano, valor_plano)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.artist (artista)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.albums (album, ano_lacamento, artist_id)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

  INSERT INTO SpotifyClone.songs (song_name, duracao_segundos, album_id)
  VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGO’S GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Don’t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bard’s Song', 244, 7),
    ('Feeling Good', 100, 8);

  INSERT INTO SpotifyClone.user (usuario, idade, plano_id, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 58, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

  INSERT INTO SpotifyClone.follow (usuario_id, artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 6),
    (5, 5),
    (6, 5),
    (6, 1),
    (7, 5),
    (9, 3),
    (10, 2);

INSERT INTO SpotifyClone.historic (song_id, usuario_id, data_reproducao)
VALUES
    (8, 1, '2022-02-28 10:45:55'),
    (2, 1, '2020-05-02 05:30:35'),
    (10, 1, '2020-03-06 11:22:33'),
    (10, 2, '2022-08-05 08:05:17'),
    (7, 2,'2020-01-02 07:40:33'),
    (10, 3, '2020-11-13 16:55:13'),
    (2, 3, '2020-12-05 18:38:30'),
    (8, 4, '2021-08-15 17:10:10'),
    (8, 5, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (7, 6, '2017-01-24 00:31:17'),
    (1, 6, '2017-10-12 12:35:20'),
    (4, 7, '2011-12-15 22:30:49'),
    (4, 8, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (3, 10,'2015-12-13 08:30:22');
