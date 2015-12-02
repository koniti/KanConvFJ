# KanConvFJ
utf-8 Kanji(chinese character) code Coverter.

KanConvFJ is ruby script to convert utf-8 code of 'Chinese characters(Kanji漢字)' {from,into} {Fantizi繁體字,Jiantizi簡体字,Japanese日本新体字}.

KanConvFJ.rb : defines "KanConvFJ" class. this has code(glyph) mapping of Fantizi,Jiantizi,Japanese kanji.

convFJ.rb : command to convert code and output. you can use this command with pipe(|) or redirect.


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
	

License: GPL2
https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
