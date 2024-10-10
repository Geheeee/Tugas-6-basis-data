SELECT * FROM mahasiswa.latihanbasisdataweek6;
INSERT INTO mahasiswa.latihanbasisdataweek6 (NIM, NAMA, PRODI, BAYAR)
VALUES ('A001', 'AB', 'INF', '10'),
		('A002', 'bc', 'si', '20'),
        ('A003', 'c', 'ars', '15'),
        ('A004', 'd', 'inf', '30'),
        ('A005', 'e', 'inf', '10'),
		('A006', 'f', 'tsp', '25'),
		('A007', 'g', 'ars', '15'),
        ('A008', 'h', 'si', '10');
        
select distinct PRODI  from mahasiswa.latihanbasisdataweek6;
        
select PRODI, count(*) as jml_latihanbasisdataweek6
from mahasiswa.latihanbasisdataweek6 
where PRODI = 'INF'
group by PRODI
;

SELECT PRODI, COUNT(*) AS total_students
FROM mahasiswa.latihanbasisdataweek6
GROUP BY PRODI;

SELECT PRODI, SUM(BAYAR) AS JUMLAH_PEMBAYARAN 
FROM mahasiswa.latihanbasisdataweek6 
GROUP BY PRODI 