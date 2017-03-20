domains
	kejadian = long
	lokasi,tersangka = symbol

predicates 
	
	nondeterm 
	pagi(kejadian,lokasi,tersangka) 
	nondeterm
	siang(kejadian,lokasi,tersangka)
	nondeterm
	sore(kejadian,lokasi,tersangka)
	nondeterm
	malam(kejadian,lokasi,tersangka)
	nondeterm
	semua(kejadian,lokasi,tersangka)
	nondeterm
	dugaan(symbol,symbol)
clauses
		
	pagi(11012017,tamancerdas,andre).
	pagi(14012017,tamancerdas,budi).
	pagi(16012017,tamancerdas,eko).
	pagi(18012017,tamanpahlawan,fajar).
	pagi(11012017,tamanpahlawan,arul).
	siang(14012017,bigmall,bayu).
	siang(16012017,bigmall,kiwa).
	siang(17012017,bigmall,wahyu).
	siang(11012017,lembus,saputra).
	siang(14012017,lembus,prasetya).
	sore(16012017,lembus,vamilu).
	sore(15012017,robinson,vandi).
	sore(12012017,robinson,fegi).
	sore(13012017,robinson,adam).
	sore(17012017,robinson,nando).
	malam(15012017,unmul,wili).
	malam(12012017,unmul,rizki).
	malam(13012017,poltek,yovan).
	malam(17012017,polnes,aldi).
	malam(15012017,polnes,dino).
	malam(12012017,stikes,reza).
	malam(13012017,stikes,samsul).
	
	semua(Kejadian,Lokasi,Tersangka):-
	pagi(Kejadian,Lokasi,Tersangka);
        siang(Kejadian,Lokasi,Tersangka);
	sore(Kejadian,Lokasi,Tersangka);
	malam(Kejadian,Lokasi,Tersangka).
	
	dugaan(pembunuhan,senjatatajam).
	dugaan(pencurian,taskorban).
	dugaan(penipuan,laptop).
	dugaan(pelecehan,sidikjari).
		
goal	
	write ("HASIL RANGKUMAN MENGENAI KASUS KEJAHATAN YANG TERJADI PADA TANGGAL 11 HINGGA 18 JANUARI"),nl,nl,
	semua(Kejadian,Lokasi,Tersangka),
	Kejadian=15012017,
	dugaan(Kasus,Bukti),
	Kasus=pembunuhan.
	
	
	
%program ini adalah skenario untuk mencari pelaku pelakunya dalam kasus kasus yang terjadi pada tanggal 11 bulan januari sampai tanggal 18 januari.
%penggunaan domains pada program ini untuk mendeklarasikan kejadian,lokasi dan tersangka. dengan mendeklarasikan domain ini agar dapat mencegah kesalahan logika pada program ini.
%dari program ini kita bisa mencari pelaku yang melakukan kejahatan yang sudah terdaftar seperti pembunuhan pelecehan pencurian dan juga penipuan,dengan cara kita memasukkan tanggal kejadian kehajatan tersebut dan sebut kan kasusnya yang kita ingin cari
% ###kejahatan yang terjadi pada bulan januari tanggal 11 sampai 18 saja yang bisa kita cari###