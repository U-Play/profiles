sports =  [
            # WINTER UNIVERSIADE COMPULSORY SPORTS PROGRAMME
            { name: 'Alpine Skiing' },
            { name: 'Biathlon' },
            { name: 'Cross-Country Skiing' },
            { name: 'Curling' },
            { name: 'Figure Skating and Synchronized Skating' },
            { name: 'Freestyle Skiing' },
            { name: 'Ice Hockey' },
            { name: 'Nordic Combined' },
            { name: 'Short Track Speed Skating' },
            { name: 'Ski Jumping' },
            { name: 'Snowboarding' },
            # SUMMER UNIVERSIADE COMPULSORY SPORTS PROGRAMME
            { name: 'Athletics' },
            { name: 'Swimming' },
            { name: 'Diving' },
            { name: 'Waterpolo' },
            { name: 'Basketball' },
            { name: 'Fencing' },
            { name: 'Football' },
            { name: 'Artistic Gymnastics' },
            { name: 'Rhythmic Gymnastics' },
            { name: 'Judo' },
            { name: 'Table Tennis' },
            { name: 'Tennis' },
            { name: 'Volleyball' },
            # WORLD UNIVERSITY CHAMPIONSHIPS SPORTS PROGRAMME
            { name: 'American Football' },
            { name: 'Archery' },
            { name: 'Badminton' },
            { name: 'Baseball' },
            { name: 'Basket 3 on 3' },
            { name: 'Beach Volleyball' },
            { name: 'Boxing' },
            { name: 'Bridge' },
            { name: 'Canoe Slalom' },
            { name: 'Canoe Sprint' },
            { name: 'Chess' },
            { name: 'Cross Country' },
            { name: 'Cycling' },
            { name: 'Equestrian' },
            { name: 'Floorball' },
            { name: 'Futsal' },
            { name: 'Golf' },
            { name: 'Handball' },
            { name: 'Hockey' },
            { name: 'Karate' },
            { name: 'Long Track Speed Skating' },
            { name: 'Match Racing' },
            { name: 'Netball' },
            { name: 'Orienteering' },
            { name: 'Rowing' },
            { name: 'Rugby 7' },
            { name: 'Savate' },
            { name: 'Softball' },
            { name: 'Shooting Sport' },
            { name: 'Squash' },
            { name: 'Taekwondo' },
            { name: 'Triathlon' },
            { name: 'Waterskiing' },
            { name: 'Weightlifting' },
            { name: 'Woodball' },
            { name: 'Wrestling' }
          ]
  Sport.create(sports)
  SportRole.create([{ name: 'Athlete' }, { name: 'Coach' }])

icons = [
      { name: 'gold' },
      { name: 'silver' },
      { name: 'bronze' },
      { name: 'star' }
]

icons.each do |icon|
  Icon.find_or_create_by_name(icon)
end
