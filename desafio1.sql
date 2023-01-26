DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.sing(
      plano_id INT PRIMARY KEY AUTO_INCREMENT,
      plano VARCHAR(50) NOT NULL,
      valor_plano DECIMAL(4,2) NOT NULL,
      data_assinatura DATE NOT NULL,
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artist(
      artist_id INT PRIMARY KEY AUTO_INCREMENT,
      artista VARCHAR(50) NOT NULL,
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albums(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album VARCHAR(50) NOT NULL,
      ano_lacamento YEAR NOT NULL,
      artist_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.songs(
      song_id INT PRIMARY KEY AUTO_INCREMENT,
      song_name VARCHAR(50) NOT NULL,
      duracao_segundos INT NOT NULL,
      album_id INT NOT,
      FOREIGN KEY (album_id) REFERENCES albums (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
      usuario_id INT PRIMARY KEY AUTO_INCREMENT,
      usuario VARCHAR(50) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES sing (plano_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.follow(
      usuario_id INT NOT NULL,
      artist_id INT,
      PRIMARY KEY (usuario_id, artist_id),
      FOREIGN KEY (usuario_id) REFERENCES user (usuario_id),
      FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.hitoric(
      song_id INT NOT NULL,
      usuario_id INT NOT NULL,
      data_reproducao DATETIME NOT NULL,
      PRIMARY KEY (usuario_id, song_id),
      FOREIGN KEY (usuario_id) REFERENCES user (usuario_id),
      FOREIGN KEY (song_id) REFERENCES songs (song_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.sing (plano, valor_plano, data_assinatura)
  VALUES
    ('Barbara Liskov', 0.00, '2019-10-20'),
    ('Robert Cecil Martin', 0.00, '2017-01-06'),
    ('Ada Lovelace', 7.99, '2017-12-30'),
    ('Martin Fowler', 7.99, '2017-01-17'),
    ('Sandi Metz', 7.99, '2018-04-29'),
    ('Paulo Freire', 5.99, '2018-02-14'),
    ('Bell Hooks', 5.99, '2018-01-05'),
    ('Christopher Alexander', 6.99, '2019-06-05'),
    ('Judith Butler', 6.99, '2020-05-13'),
    ('Jorge Amado', 6.99, '2017-02-17');

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


