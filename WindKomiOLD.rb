#!/usr/bin/ruby 



" 
Parcourir une arborenscence ou un fichier et faire des statistiques
Compter le nombre de fichier de tel extension (nil = pas d'extension) dans un repertoire 
repertoireouchercher(string) extension(expression rationnelle) -d(decroissance)a(alpabethique)
terminal (lance un parser) quit = quitte
--> affiche des resultats
"




load './fichier.rb'

def help(arg=nil)
	if(arg != nil)
		print arg
	else
		print "cake is a lie"
	end
end

def terminal()
	print "> "
 	chaine = $stdin.gets
	chaine == "exit\n" ? exit : main(chaine.split())
	terminal()
end

def test(pars)
	if test_file_exist(pars[0]) && test_file_read_access(pars[0])
		return pars.length == 1 ||pars.length == 2 || ( pars.length == 3 && test_options(pars[-1]) )
	end
	print "erreur"
	return false
end

def test_options(chaine)
	if(chaine == "-a" || chaine == "-d" || chaine == "-ad" || chaine == "-da")
		return true
	end
	puts "Probleme dans les options"
	return false
end

def main(pars)
	if( pars.length() >= 1 && pars.length() <= 3 )
		if (test(pars))
			parcours(pars[0])
		end
	else
		puts "tapez -h pour voir les commandes"
	end
end

if ARGV[0]== "terminal" 
	 terminal() 
elsif ( ARGV[0] == "-h" ) 
	help() 
else
	 main(ARGV)
end
