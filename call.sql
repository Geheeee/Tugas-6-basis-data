	USE PendaftaranSiswa;
	CALL AmbilDetailSiswa('REG001');


	CALL PerbaruiStatusPembayaran(1, 'Lunas'); -- Pastikan id_siswa yang diberikan valid

	CALL CatatHasilTest(1, 85); -- 1 adalah id_siswa yang sudah terdaftar

	CALL DaftarSiswa('Budi Santoso', '2000-05-15', 'REG001', '123456789', 'Jl. Merah No. 1', '08123456789');

