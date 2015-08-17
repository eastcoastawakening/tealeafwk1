#when you open a file within a block such as do end
#they automatically close

nouns = File.open('nounlist.txt', 'r') do |f|
  f.read
end.split

#can do the following to check file
# nouns = File.open('nounlist.txt', 'r') do |f|
#   f.read
# end.split.first
#can make a method to handle nouns,verbs,adjectives....
#Now we are really mad ; )

dictionary = {
  nouns: nouns,
  verbs: ['juggle', 'spin'],
  adjectives: ['hairy', 'red']
}

def say(msg)
  puts("=> a(msg)")
end

def exit_with(msg)
  say msg
  exit
end

def get_input(word)
#trouble with this call to say
#  say "Input a #{word}:"
  puts "enter a Noun"
  STDIN.gets.chomp
end

exit_with("No input file!") if ARGV.empty?
exit_with("File doesn't exist!") if !File.exists?(ARGV[0])

#here is original - reduced to method
#might use say("No input file!") && exit if ARGV.empty?
# if ARGV.empty?
#   puts "no input file!"
#   exit
# end

# if !File.exists?(ARGV[0])
#   puts "Input file doesn't exist!"
#   exit
# end

contents = File.open(ARGV[0], 'r') do |file|
  file.read
end

#contents.gsub!('NOUN', dictionary[:nouns].sample)
#replace 'NOUN' with string and sample randomnizes
#or we might want to use regex
# contents.gsub!('NOUN').each do |noun|
#   'hi'
#   #get_input(noun)
# end
#We have to explicitly call STDIN for the gets.chomp
contents.gsub!('NOUN').each do |noun|
  get_input(noun)
   # puts "Input a NOUN:"
   # STDIN.gets.chomp
 end



#we can do the random sample here also
contents.gsub!('VERB', dictionary[:verbs].sample)
contents.gsub!('ADJECTIVE', dictionary[:adjectives].sample)

#we want to use enumerator to iterate through and vie a 
#different substituting word from the dictionary
#rather than the same for each instance
#enum.peak  enum.next....etc...

#elaborate by building up nouns.txt, verbs.txt, adjectives.txt from
#a github person that did madlibs

p contents
