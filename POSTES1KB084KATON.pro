predicates 
	nondeterm 
	kantor(symbol,symbol,long) 
	nondeterm
	olahraga(symbol,symbol,long)
	nondeterm
	toko(symbol,symbol,long)
	nondeterm
	semua(symbol,symbol,long)
	nondeterm
	orang(symbol,long)
	
clauses
	kantor(merah,satu,632111).
	kantor(merah,dua,52112).
	kantor(putih,satu,632111).
	kantor(kuning,tiga,632131).
	kantor(putih,enam,543216).
	olahraga(biru,lima,6542154).
	olahraga(hijau,empat,632144).
	toko(putih,satu,652111).
	toko(merah,tiga,654133).
	
	semua(Gedung,Lantai,Price):-
	kantor(Gedung,Lantai,Price);
	olahraga(Gedung,Lantai,Price);
	toko(Gedung,Lantai,Price).
	
	orang(yanto,3).
	orang(rian,5).
	orang(nur,2).
	orang(katon,1).
	
goal
	semua(Gedung,Lantai,Harga),
	Gedung=putih,
	orang(Pembeli,Banyaknya),
	Pembeli=rian.


%nondeterm pada bagian predicates berfungsi untuk memberitahu compiler bahwa predicates tersebut mempunyai jawaban lebih dari satu.
%dari program ini ,memiliki alur dari pencarian gedung yang warna merah.
%dan pada bagian gedung warna merah semua gedung merah terpilih karena kita bisa memilih gedung nya lebih dari satu,jadi otomatis gedung merah terpilih
%dari gedung merah semua informasi dari gedung merah langsung tertampil
%karena kita memilih "semua", jadi infromasi dari gedung olahraga, gedung kantor, dan gedung toko semua akan tertampil yang intinya gedung warna merah.