# level 1
"Jimmy".reverse
"Jimmy".length
"Jimmy"*5
# level 2
40.to_s.reverse
[12, 47, 35]
[12, 47, 35].max
ticket = [12, 47, 35]
ticket.sort!
# level 3
poem['toast'] = 'honeydew'
poem.reverse
poem.lines.to_a.reverse
print poem.lines.to_a.reverse.join
poem.include? "my hand"
poem.downcase
poem.delete
# level 4 - hashes, symbols and blocks
# 'hash' or 'dictionary'
books = {}
books["Gravity's Rainbox"] = :splendid
# ":splendid" is a symbol; cheaper than string ('cause stores by reference, not value)
books.length
books["Gravity's Rainbox"]
books.keys
ratings = Hash.new(0)
books.values.each {|rate| ratings[rate] += 1}
ratings #shows group by rating
5.times {print "Odelay!"}
# level 5 - Files 
Dir.entries "/"
Dir["/*.txt"]
print File.read("/comics.txt")
FileUtils.cp('/comics.txt', '/Home/comics.txt')
Dir["/Home/*.txt"]
File.open("/Home/comics.txt", "a") do |f|
f << "Cat and Girl"
end
File.mtime("/Home/comics.txt")
File.mtime("/Home/comics.txt").hour