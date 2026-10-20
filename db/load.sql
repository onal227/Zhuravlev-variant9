BEGIN;
DELETE FROM readings;
DELETE FROM events;
DELETE FROM sqlite_sequence WHERE name IN ('readings','events');

INSERT INTO readings(n,t_s,sensor,value) VALUES(1,1,'s1',65.00);
INSERT INTO readings(n,t_s,sensor,value) VALUES(1,1,'s2',18.50);
INSERT INTO readings(n,t_s,sensor,value) VALUES(1,1,'s3',12.40);
INSERT INTO readings(n,t_s,sensor,value) VALUES(2,2,'s1',34.00);
INSERT INTO readings(n,t_s,sensor,value) VALUES(2,2,'s2',18.70);
INSERT INTO readings(n,t_s,sensor,value) VALUES(2,2,'s3',12.35);
INSERT INTO readings(n,t_s,sensor,value) VALUES(3,3,'s1',19.50);
INSERT INTO readings(n,t_s,sensor,value) VALUES(3,3,'s2',18.90);
INSERT INTO readings(n,t_s,sensor,value) VALUES(3,3,'s3',12.30);
INSERT INTO readings(n,t_s,sensor,value) VALUES(4,4,'s1',12.00);
INSERT INTO readings(n,t_s,sensor,value) VALUES(4,4,'s2',19.10);
INSERT INTO readings(n,t_s,sensor,value) VALUES(4,4,'s3',12.20);
INSERT INTO readings(n,t_s,sensor,value) VALUES(5,5,'s1',25.00);
INSERT INTO readings(n,t_s,sensor,value) VALUES(5,5,'s2',19.20);
INSERT INTO readings(n,t_s,sensor,value) VALUES(5,5,'s3',12.10);
INSERT INTO events(n,t_s,type,message) VALUES(3,3,'THRESHOLD','освещенность ниже 20 %');
INSERT INTO events(n,t_s,type,message) VALUES(5,5,'NORMAL','освещенность вернулась к норме');

COMMIT;
