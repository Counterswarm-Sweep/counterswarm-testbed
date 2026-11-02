-- Counterswarm test site. Every 'secret' here is fake and planted on purpose.
-- PostgreSQL database dump
CREATE TABLE users (id integer PRIMARY KEY, email text, full_name text, role text);
INSERT INTO users (id, email, full_name, role) VALUES (1, 'ada@example.com', 'Fake Person', 'admin');
