# KanConvFJ
Converting code of 'Chinese characters(Kanji)' {from,into} {Fantizi繁體字,Jiantizi簡体字,Japanese日本新体字}


Usage:

	convFJ.rb filename
	
	cat filename | convFJ.rb
	
	
Options:

	to specify input text kanji glyph(code)
	
	-F : input is Fantizi(繁體字 utf-8) default
	
	-S : input is Jiantizi(簡體字 utf-8)
	
	-J : input is Japanese(日本 utf-8)


	to specify output text kanji glyph(code)
	
	-f : output is Fantizi(繁體字 utf-8)
	
	-s : output is Jiantizi(簡體字 utf-8)
	
	-j : output is Japanese(日本 utf-8) default
	
