def parcours(rep)
	begin
		d=Dir.entries("rep")
		print d
	rescue Errno::ENTDIR => e
		return false
	end
end

def file(nom_fichier)
	unless(test_file(nom_fichier))
		return test_is_directory(nom_fichier)	
	end
	return true
end

def test_file(name)
	if(name =~ /r/ && test_file_exist(name))
		File.chmod( (File.lstat(name).mode & 0777 ) | 0400, name)
		return true
	else
		return test_file_exist(name) && test_file_read_access(name)
	end
end

def test_file_exist(name)
	unless File.file?(name)
		print "Le fichier n'existe pas.\n"
		return false
	end
	return true
end

def test_file_read_access(name)
	unless File.readable?(name)
		print "Les droits en lectures ne sont pas suffisant "
		print "pour lire le fichier.\n"
		return false
	end
	return true
end

#-l
def read_file(name)
	open(name) { |f| print f.read() }
end

def test_is_directory(name_dir)
	begin 
		Dir.open(name_dir)
		return true
	rescue Errno::ENOENT => e
		puts "Le Dossier n'existe pas"
		return false
	end
end
