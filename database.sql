-- TrueHate — esquema do banco
-- Importe com: mysql -u root -p < database.sql

CREATE DATABASE IF NOT EXISTS true_hate_app
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE true_hate_app;

CREATE TABLE IF NOT EXISTS tb_usuario (
  id        INT AUTO_INCREMENT PRIMARY KEY,
  nome      VARCHAR(80)  NOT NULL UNIQUE,
  email     VARCHAR(150) NOT NULL UNIQUE,
  senha     VARCHAR(255) NOT NULL,
  inadmin   TINYINT      NOT NULL DEFAULT 0 COMMENT '0 = usuário, 1 = administrador, 2 = empresa'
);

CREATE TABLE IF NOT EXISTS tb_avaliacao (
  id                 INT AUTO_INCREMENT PRIMARY KEY,
  nome_empresa       VARCHAR(120) NOT NULL,
  nomePessoaPublicou VARCHAR(120) NOT NULL,
  texto              TEXT         NOT NULL,
  nota               TINYINT      NOT NULL,
  dataPublicada      DATE         NOT NULL,
  usuario_id         INT          NULL,
  CONSTRAINT fk_avaliacao_usuario FOREIGN KEY (usuario_id)
    REFERENCES tb_usuario (id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS tb_comentario (
  id                     INT AUTO_INCREMENT PRIMARY KEY,
  texto                  TEXT        NOT NULL,
  data_comentario        DATE        NOT NULL,
  usuario_id             INT         NULL,
  avaliacao_id           INT         NOT NULL,
  nome_usuario_comentou  VARCHAR(120) NOT NULL,
  comentario_pai_id      INT         NOT NULL DEFAULT 0,
  CONSTRAINT fk_comentario_avaliacao FOREIGN KEY (avaliacao_id)
    REFERENCES tb_avaliacao (id) ON DELETE CASCADE,
  CONSTRAINT fk_comentario_usuario FOREIGN KEY (usuario_id)
    REFERENCES tb_usuario (id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS tb_problemas (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  nome       VARCHAR(120) NOT NULL,
  email      VARCHAR(150) NOT NULL,
  telefone   VARCHAR(30)  NULL,
  problema   TEXT         NOT NULL,
  data_envio DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tb_historico (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  data_acao    DATETIME     NOT NULL,
  tipo_acao    VARCHAR(40)  NOT NULL,
  detalhes     TEXT         NOT NULL,
  usuario_id   INT          NOT NULL DEFAULT 0,
  nome_usuario VARCHAR(120) NOT NULL
);

CREATE INDEX idx_comentario_avaliacao ON tb_comentario (avaliacao_id);
CREATE INDEX idx_avaliacao_data       ON tb_avaliacao (dataPublicada);
CREATE INDEX idx_historico_usuario    ON tb_historico (usuario_id);
