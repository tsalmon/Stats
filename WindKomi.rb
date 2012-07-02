#!/usr/bin/ruby 



" 
Parcourir une arborenscence ou un fichier et faire des statistiques
Compter le nombre de fichier de tel extension (nil = pas d'extension) dans un repertoire 
repertoireouchercher(string) extension(expression rationnelle) -d(decroissance)a(alpabethique)
terminal (lance un parser) quit = quitte
--> affiche des resultats
"
def my_ls(name,extensions={})
	for t in Dir.entries(name)
		if(t =~ /^\w+(\.\w+)+$/)
			for i in t.split(".")[1,t.split(".").length]
				extensions[i]==nil ? extensions[i]=1 : extensions[i]+=1
			end
		end
		if !(t =~ /\.|\.\./) && File.directory?(name+"/"+t)
			my_ls(name+"/"+t,extensions)
		end	
	end
	return extensions
end

def erreur(message)
	puts message
end

print (ARGV.length > 0) ? (File.directory?(ARGV[0]) ? my_ls(ARGV[0]) : "Pas un repertoire" ):  "mettre un argument"
puts ""
