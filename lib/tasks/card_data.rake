namespace :card_data do
  desc "Imports cards into the db from the JSON file that http://mtgjson.com/ provides (AllSets.json)"
  task :import, [:filename] => :environment do |t, args|

    if args.count == 0
      puts "Please pass the filename in as an argument (e.g. rake card_data:import['filename.json'])"
    else
      puts "Attempting to import #{args.filename}..."
      
      File.open(args.filename, "r") do |infile|
          while (line = infile.gets)              
              data = ActiveSupport::JSON.decode(line)
              
              ['THS', 'BNG', 'JOU'].each do |set_code|                
                cards = data[set_code]['cards']                
                puts "Importing the #{cards.count} cards in #{set_code}..."
                
                cards.each do |card|
                  card = Card.new(:name => card['name'], :cardtype => card['type'], :bodytext => card['text'], :power => card['power'], :toughness => card['toughness'], :multiverseid => card['multiverseid'])
                  card.save
                end
              end
          end
      end
    end
  end

end
