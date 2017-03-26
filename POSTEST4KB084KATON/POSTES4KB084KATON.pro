/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH04E12.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

trace
domains
  name,sex,occupation,object,vice,substance = symbol
  age=integer

predicates
  person(name,age,sex,occupation) - nondeterm (o,o,o,o), nondeterm (i,o,o,i), nondeterm (i,o,i,o)
  had_affair(name,name) - nondeterm (i,i), nondeterm (i,o)
  killed_with(name,object) - determ (i,o)
  killed(name) - procedure (o)
  killer(name) - nondeterm (o)
  motive(vice) - nondeterm (i)
  smeared_in(name,substance) - nondeterm (i,o), nondeterm (i,i)
  owns(name,object) - nondeterm (i,i)
  operates_identically(object,object) - nondeterm (o,i)
  owns_probably(name,object) - nondeterm (i,i)
  suspect(name) - nondeterm (i)

/* * * Facts about the murder * * */
clauses
  person(bert,55,m,carpenter).
  person(allan,25,m,football_player).
  person(allan,25,m,butcher).
  person(john,25,m,pickpocket).

  had_affair(barbara,john).
  had_affair(barbara,bert).
  had_affair(susan,john).

  killed_with(susan,club).
  killed(susan).

  motive(money).
  motive(jealousy).
  motive(righteousness).

  smeared_in(bert,blood).
  smeared_in(susan,blood).
  smeared_in(allan,mud).
  smeared_in(john,chocolate).
  smeared_in(barbara,chocolate).

  owns(bert,wooden_leg).
  owns(john,pistol).

/* * * Background knowledge * * */

  operates_identically(wooden_leg, club).
  operates_identically(bar, club).
  operates_identically(pair_of_scissors, knife).
  operates_identically(football_boot, club).

  owns_probably(X,football_boot):-
	person(X,_,_,football_player).
  owns_probably(X,pair_of_scissors):-
	person(X,_,_,hairdresser).
  owns_probably(X,Object):-
	owns(X,Object).

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *
 * which Susan could have been killed.       *
 * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-
	killed_with(susan,Weapon) ,
	operates_identically(Object,Weapon) ,
	owns_probably(X,Object).

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-
	motive(jealousy),
	person(X,_,m,_),
	had_affair(susan,X).

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       *
 * affair with someone that Susan knew.  *
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-
	motive(jealousy),
	person(X,_,f,_),
	had_affair(X,Man),
	had_affair(susan,Man).
	
	


/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-
	motive(money),
	person(X,_,_,pickpocket).

  killer(Killer):-
	person(Killer,_,_,_),
	killed(Killed),
	Killed <> Killer, /* It is not a suicide */
	suspect(Killer),
	smeared_in(Killer,Goo),
	smeared_in(Killed,Goo).

goal
  killer(X).


%pada bagian domains, domains sendiri dipakai untuk pemberian nama pada  suatu parameter,dan penggunaan symbol pada nama,jender,pekerjaan,benda,alasan,zat.mengapa memakai symbol? dikarenakan kita menggunakan huruf pada bagian itu.sedangkan pada bagian umur kita menggunakan integer dikarenakan umur itu terdiri dari angka,jadi kita harus menggunakan integer
%pada bagian predicates, predicates sendiri dipakai untuk mendeklarasikan suatu hubungan atau relasi
%pada bagian predicates ini ada beberapa hubungan (relasi) contohnya yaitu relasi dari orang, orang memiliki relasi nama umur jender dan pekerjaan. selingkuh,pembunuhan,cara_kerja_mirip , dicurigai .mereka semua memiliki relasi. relasi relasi ini yatu yang di dalam kurung.
%pada bagian clauses, bagian ini adalah bagian faktanya atau clauses ini berisikan semua fakta faktanya yang di berikan.
%clause orang(budi,55,m,tukang_kayu). yang berartikan kalau budi itu seorang tukang kayu dan juga dia berumur 55 dan memiliki jender m, pada bagian orang yang lain sama saja seperti ini pembacaannya.
%clause selingkuh(ina,joni). yang berartikan kalau ina selingkuh dengan joni. selingkuh yang lainnya sama aja pembacaannya.
%dicurigai(X):- yang berartikan bahwa x adalah suatu variabel bebas,
%orang(X,_,m,_), yang berartikan bahwa variabel X adalah orang yang berjender m
%lalu pada bagian pembunuh di clause paling bawah, berartikan kalo orang itu adalah pembunuh dan yang lainnya juga pembunuh,lalu kalo pembunuh itu telah terbunuh dikarenakan bukan bunuh diri,maka dia telah dibunuh,dan juga dia dicurigai lalu dia juga ternodai oleh zat,jadi pembunuh dan juga yang yg dibunuh terkena zat.
%pada bagian goal, goal itu adalah bagian dimana hasil dari predicates dan juga clause.
%hasil dari goal ini adalah budi,kenapa bisa budi? karena budi terkena zat itu atau telah ternodai oleh (zat),disini ada dua orang yang terkena zat,yaitu budi dan siti,tapi dikarenakan siti terbunuh dan yang dicari dari program ini adalah pemunuhnya jadi yang tertangkap adalah si budi.
