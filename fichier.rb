#si on utilise l'ouverture de force, 
#alors on modifie les droits de lectures pour le fichier 
def verifier_fichier()
	if(ARGV[0] =~ /r/ && verifier_fichier_existe())
		File.chmod( (File.lstat(ARGV[1]).mode & 0777 ) | 0400, ARGV[1])
	end
	return verifier_fichier_existe() && verifier_fichier_droit_lecture()
end

def verifier_fichier_existe()
	unless File.file?(ARGV[1])
		print "Le fichier n'existe pas.\n"
		return false
	end
	return true
end

def verifier_fichier_droit_lecture()
	unless File.readable?(ARGV[1])
		print "Les droits en lectures ne sont pas suffisant "
		print "pour lire le fichier.\n"
		return false
	end
	return true
end

#-l
def lecture_fichier()
	open(ARGV[1]) { |f| print f.read()}
end

#-c(*)
def compter_arguments()
	
end
