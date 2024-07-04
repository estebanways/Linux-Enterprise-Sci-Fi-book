INSERT INTO virtual_domains (id, name) VALUES (1, 'aestudio.sytes.net');
INSERT INTO virtual_domains (id, name) VALUES (2, 'aestudio000.zapto.org');
INSERT INTO virtual_domains (id, name) VALUES (3, 'etribe.sytes.net');
INSERT INTO virtual_domains (id, name) VALUES (4, 'hereisthedeal.hopto.org');
INSERT INTO virtual_domains (id, name) VALUES (5, 'localhost');

-- Inserting records into virtual_users table
INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (1, 5, 'root', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example user for domain 5

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (2, 1, 'root', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example user for domain 1

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (3, 1, 'postmaster', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example postmaster user

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (4, 1, 'xcapncrunchx', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example user xcapncrunchx

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (5, 1, 'webmaster', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example webmaster user

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (6, 1, 'aestudio', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example aestudio user

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (7, 1, 'lev', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example lev user

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (8, 1, 'myname', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example myname user

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (9, 1, 'contact', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example contact user

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (10, 1, 'noreply', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example noreply user

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (11, 4, 'webmaster', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example webmaster user for domain 4

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (12, 4, 'hereisthedeal', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example hereisthedeal user

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (13, 4, 'myname', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example myname user for domain 4

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (14, 4, 'contact', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example contact user for domain 4

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (15, 4, 'noreply', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example noreply user for domain 4

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (16, 3, 'webmaster', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example webmaster user for domain 3

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (17, 3, 'etribe', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example etribe user

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (18, 3, 'myname', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example myname user for domain 3

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (19, 3, 'contact', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example contact user for domain 3

INSERT INTO virtual_users (id, domain_id, user, password, quota_kb, quota_messages)
VALUES (20, 3, 'noreply', MD5('PASSWORD_HERE'), 1000000, 1000000); -- Example noreply user for domain 3

-- Inserting records into virtual_aliases table
INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (1, 5, 'root', 'aestudio@aestudio.sytes.net'); -- Alias for root user in domain 5

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (2, 1, 'root', 'repository@gmail.com'); -- Alias for root user in domain 1

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (3, 1, 'postmaster', 'aestudio@aestudio.sytes.net'); -- Alias for postmaster user in domain 1

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (4, 1, 'xcapncrunchx', 'aestudio@aestudio.sytes.net'); -- Alias for xcapncrunchx user in domain 1

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (5, 1, 'webmaster', 'aestudio@aestudio.sytes.net'); -- Alias for webmaster user in domain 1

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (6, 1, 'lev', 'stv@gmail.com'); -- Alias for lev user in domain 1

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (7, 1, 'myname', 'aestudio@aestudio.sytes.net'); -- Alias for myname user in domain 1

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (8, 1, 'contact', 'aestudio@aestudio.sytes.net'); -- Alias for contact user in domain 1

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (9, 1, 'noreply', 'aestudio@aestudio.sytes.net'); -- Alias for noreply user in domain 1

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (10, 4, 'webmaster', 'hereisthedeal@hereisthedeal.hopto.org'); -- Alias for webmaster user in domain 4

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (11, 4, 'myname', 'hereisthedeal@hereisthedeal.hopto.org'); -- Alias for myname user in domain 4

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (12, 4, 'contact', 'hereisthedeal@hereisthedeal.hopto.org'); -- Alias for contact user in domain 4

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (13, 4, 'noreply', 'hereisthedeal@hereisthedeal.hopto.org'); -- Alias for noreply user in domain 4

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (14, 3, 'webmaster', 'etribe@etribe.sytes.net'); -- Alias for webmaster user in domain 3

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (15, 3, 'myname', 'etribe@etribe.sytes.net'); -- Alias for myname user in domain 3

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (16, 3, 'contact', 'etribe@etribe.sytes.net'); -- Alias for contact user in domain 3

INSERT INTO virtual_aliases (id, domain_id, source, destination)
VALUES (17, 3, 'noreply', 'etribe@etribe.sytes.net'); -- Alias for noreply user in domain 3
