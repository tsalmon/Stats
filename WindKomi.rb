def my_ls(name,extensions={})
	for t in Dir.entries(name)
		if(t =~ /^\w+(\.\w+)+$/)
			for i in t.split(".")[1,t.split(".").length]
				if extensions[i] == nil 
					extensions[i] = 1
					extensions[i + " taille"] = 0
				else
					extensions[i]+=1
					extensions[i + " taille"]+= t.size
				end
			end
		end
		if !(t =~ /\.|\.\./) && File.directory?(name+"/"+t)
			my_ls(name+"/"+t,extensions)
		end	
	end
	return extensions
end

def lire(message)
	puts "Nom\tNombre\tTaille"
	message.each { |a,b| print (a.split.length == 1) ? "#{a.split[0]}\t#{b}" : "\t#{b}\n"}
	return ""
end

print (ARGV.length > 0) ? (File.directory?(ARGV[0]) ? lire(my_ls(ARGV[0])) : "Pas un repertoire" ):  "mettre un argument"
puts ""
