#!/usr/bin/ruby 

load './fichier.rb'


def help(arg=nil)
	if(arg != nil)
		print arg
	else
		print "cake is a lie"
	end
end

def main()
	if ( ARGV[0] == "-h" && ARGV.length < 3)
		help(ARGV[1])
i	elsif ( ARGV[0] =~ /-f(r)?/ && ARGV.length < 10 && verifier_fichier())
		lecture_fichier()
	else
		print "Tapez -h pour les arguments du programmes.\n"	
	end
end

main()
