predicates 
	nondeterm 
	pagi(long,symbol,symbol) 
	nondeterm
	siang(long,symbol,symbol)
	nondeterm
	sore(long,symbol,symbol)
	nondeterm
	malam(long,symbol,symbol)
	nondeterm
	semua(long,symbol,symbol)
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
	semua(Kejadian,Lokasi,Tersangka),
	Kejadian=15012017,
	dugaan(Kasus,Bukti),
	Kasus=pembunuhan.
	
%program ini adalah skenario untuk mencari pelaku pelakunya dalam kasus kasus yang terjadi pada tanggal 11 bulan januari sampai tanggal 18 januari.
%fungsi dari long pada predicate untuk memfungsikan pada bagian clause untuk menggunakan pengisian menggunakan angka, yang saya pakai untuk menentukan tanggal kejadian.
%sedangkan fungsi dari symbol yang saya gunakan di predicate , yaitu untuk menggunakan pengisian huruf ntuk menentukan lokasi dan juga tersangka pada tanggal yang telah di tetapkan.
%dari program ini kita bisa mencari pelaku yang melakukan kejahatan yang sudah terdaftar seperti pembunuhan pelecehan pencurian dan juga penipuan,dengan cara kita memasukkan tanggal kejadian kehajatan tersebut dan sebut kan kasusnya yang kita ingin cari
% ###kejahatan yang terjadi pada bulan januari tanggal 11 sampai 18 saja yang bisa kita cari###