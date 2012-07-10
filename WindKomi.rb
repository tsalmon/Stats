def my_ls(name, extensions={})
	for t in Dir.entries(name)
		if(t =~ /^\w+(\.\w+)+$/)
			for i in t.split(".")[1,t.split(".").length]
				if extensions[i + " nombre"] == nil 
					extensions[i + " nombre"] = 1
					extensions[i + " taille"] = File.stat(name + "/" + t).size
					
					extensions[i + " recentnom"] = t
					extensions[i + " recentdate"] = File.stat(name + "/" + t).ctime 
					extensions[i + " recentchemin"] = name + "/" + t 
					
					extensions[i + " vieuxnom"] = t
					extensions[i + " vieuxdate"] = File.stat(name + "/" + t).ctime
					extensions[i + " vieuxchemin"] = name + "/" + t
					
					extensions[i + " lourdnom"] = t
					extensions[i + " lourdpoid"] = File.stat(name + "/" + t).size
					extensions[i + " lourdchemin"] = name + "/" + t 
					
				else	
					extensions[i + " nombre"] += 1
					extensions[i + " taille"] += File.stat(name + "/" + t).size
					if (extensions[i + " recentdate"].to_i < File.stat(name + "/" + t).ctime().to_i)
						extensions[i + " recentnom"] = t
						extensions[i + " recentdate"] = File.stat(name + "/" + t).ctime
						extensions[i + " recentchemin"] = name + "/" + t
					elsif (extensions[i + " vieuxdate"].to_i > File.stat(name + "/" + t).ctime().to_i )
						extensions[i + " vieuxnom"] = t
						extensions[i + " vieuxdate"] = File.stat(name + "/" + t).ctime
						extensions[i + " vieuxchemin"] = name + "/" + t
					end
					if (extensions[i + " lourdpoid"] < File.stat(name + "/" +t).size)
						extensions[i + " lourdnom"] = t
						extensions[i + " lourdpoid"] = File.stat(name + "/" + t).size
						extensions[i + " lourdchemin"] = name + "/" + t
					end
				end
			end
		elsif !(t =~ /\.?\./) && File.directory?(name+"/"+t)
			my_ls(name+"/"+t,extensions)
		end	
	end
	return extensions
end

def lire(message)
	i = 11
	message.each do |k,v|
		if(i%11==0)
			i = 0
			puts k.split()[0]
		end
			puts "\t"+ k.split()[1].to_s + " : " + v.to_s
		i += 1
	end
	return nil
end


print (ARGV.length > 0) ? (File.directory?(ARGV[0]) ? lire(my_ls(ARGV[0])) : "Pas un repertoire" ):  "mettre un argument"
puts ""
