require 'rubygems'
require 'faker'

# From http://www.lawa.org/LAXAirlines.aspx
AIRLINES = [
  ['Aer Lingus', 'EI', 'Terminal 2'],
  ['Aeroflot', 'SU', 'TBIT'],
  ['Aeromexico', 'AM', 'Terminal 2'],
  ['Air Berlin', 'AB', 'TBIT'],
  ['Air Canada', 'AC', 'Terminal 6'],
  ['Air China', 'CA', 'TBIT'],
  ['Air France', 'AF', 'TBIT'],
  ['Air New Zealand', 'NZ', 'TBIT'],
  ['Air Tahiti Nui', 'TN', 'TBIT'],
  ['Alaska Airlines', 'AS', 'Terminal 6'],
  ['Alitalia', 'AZ', 'TBIT'],
  ['All Nippon Airways (ANA)', 'NH', 'TBIT'],
  ['Allegiant Air', 'G4', 'Terminal 5'],
  ['American Airlines', 'AA', 'Terminal 4'],
  ['American Airlines', 'AA', 'Terminal 5'],
  ['American Eagle', 'AA', 'Terminal 4'],
  ['Asiana Airlines', 'OZ', 'TBIT'],
  ['Austrian Airlines', 'OS', 'TBIT'],
  ['Avianca Airlines', 'AV', 'Terminal 3'],
  ['Boutique Airlines', '4B', 'Terminal 6'],
  ['British Airways', 'BA', 'TBIT'],
  ['Cathay Pacific Airways', 'CX', 'TBIT'],
  ['China Airlines', 'CI', 'TBIT'],
  ['China Eastern', 'MU', 'TBIT'],
  ['China Southern', 'CZ', 'TBIT'],
  ['Copa Airlines', 'CM', 'TBIT'],
  ['Copa Airlines', 'CM', 'Terminal 3'],
  ['Delta Airlines', 'DL', 'Terminal 2'],
  ['Delta Airlines', 'DL', 'Terminal 3'],
  ['El Al Israel Airlines', 'LY', 'TBIT'],
  ['Emirates', 'EK', 'TBIT'],
  ['Ethiopian Airlines', 'ET', 'Terminal 6'],
  ['Etihad Airways', 'EY', 'TBIT'],
  ['EVA Air', 'BR', 'TBIT'],
  ['Fiji Airways', 'FJ', 'TBIT'],
  ['Frontier Airlines', 'F9', 'Terminal 5'],
  ['Great Lakes Airlines', 'ZK', 'Terminal 6'],
  ['Hainan Airlines', 'HU', 'TBIT'],
  ['Hawaiian Airlines', 'HA', 'Terminal 5'],
  ['Iberia Airlines', 'IB', 'TBIT'],
  ['InterJet', '4O', 'Terminal 3'],
  ['Japan Airlines', 'JL', 'TBIT'],
  ['Jet Blue', 'B6', 'Terminal 5'],
  ['KLM Royal Dutch Airlines', 'KL', 'TBIT'],
  ['Korean Airlines', 'KE', 'TBIT'],
  ['LATAM', 'LA', 'TBIT'],
  ['Level Airlines', 'IB', 'TBIT'],
  ['LOT Polish', 'LO', 'TBIT'],
  ['Lufthansa', 'LH', 'TBIT'],
  ['Mokulele Airlines', 'MW', 'Terminal 6'],
  ['Norwegian Air Shuttle', 'DY', 'TBIT'],
  ['Philippine Airlines', 'PR', 'TBIT'],
  ['Qantas', 'QF', 'TBIT'],
  ['Qatar Airways', 'QR', 'TBIT'],
  ['Scandanavian Airlines', 'SK', 'TBIT'],
  ['Saudi Arabian Airlines', 'SV', 'TBIT'],
  ['Sichuan Airlines', '3U', 'TBIT'],
  ['Singapore Airlines', 'SQ', 'TBIT'],
  ['Southwest Airlines', 'WN', 'Terminal 1'],
  ['Southwest International', 'WN', 'TBIT'],
  ['Spirit Airlines', 'NK', 'Terminal 5'],
  ['Sun Country', 'SY', 'Terminal 5'],
  ['Swiss International Air Lines Ltd.', 'LX', 'TBIT'],
  ['Thomas Cook Airlines', 'MT', 'Terminal 6'],
  ['Transaero', 'UN', 'TBIT'],
  ['Turkish Airlines', 'TK', 'TBIT'],
  ['United Airlines', 'UA', 'Terminal 7'],
  ['United Airlines', 'UA', 'Terminal 8'],
  ['United Airlines', 'UA', 'Terminal 6'],
  ['United Express', 'UA', 'Terminal 7'],
  ['United Express Airlines', 'UA', 'Terminal 8'],
  ['Virgin America', 'VX', 'Terminal 6'],
  ['Virgin Atlantic', 'VS', 'Terminal 2'],
  ['Virgin Australia', 'VA', 'Terminal 2'],
  ['Volaris', 'Y4', 'Terminal 2'],
  ['West Jet', 'WS', 'Terminal 2'],
  ['WOW Air', 'WW', 'TBIT'],
  ['Xiamen Airlines', 'MF', 'TBIT'],
  ['XL Airways France', 'SE', 'Terminal 6']
]

EXPANSIONS = [
  ['TBIT', 'Tom Bradley International Terminal']
]

# From http://www.lawa.org/uploadedfiles/LAX/statistics/tcom-0917.pdf
#PASSENGER_TRAFFIC_TOTALS_SEPT_2017 = [
  #{ type: "Domestic", count: 4739872 },
  #{ type: "International", count: 2045217 }
#]
# The above can be simplified as: type/total = chance_<type>
TOTAL_FLIGHTS = 4739872.0 + 2045217.0
CHANCE_DOMESTIC = 4739872 / TOTAL_FLIGHTS
CHANCE_INTERNATIONAL = 2045217 / TOTAL_FLIGHTS

# From https://www.lawa.org/uploadedFiles/OurLAX/pdf/LAX_Survey_Final_Draft_REPORT_2012_08_19.pdf
CHANCE_CONNECTING_FLIGHT = 0.38
CHANCE_ORIGINATING_FROM_LAX = 0.62

# From http://www.lawa.org/uploadedfiles/LAX/statistics/CY2017%20LAX%20On-Airport%20RAC%20Monthly%20Adjusted%20Gross%20Revenue%20and%20Transactions.pdf
LAX_RENTAL_CARS_PER_YEAR = 273881.0

LOCAL_TRANSPORTATION = [
  'LAX Shuttle',
  'FlyAway Bus',
  'Hotel Shuttle',
  'Shared Ride Van',
  'City Bus',
  'Rental car',
  'Taxi',
  'Lyft',
  'Uber',
  'friend\'s car',
  'limo'
]

# From https://en.wikipedia.org/wiki/Los_Angeles_International_Airport
LAX_HUB_FOR = [
  'Alaska Airlines',
  'American Airlines',
  'Delta Air Lines',
  'United Air Lines'
]

DESTINATIONS = [
  ['Aer Lingus', ['Dublin']],
  ['Aeroflot', ['Moscow–Sheremetyevo']],
  ['Aeroméxico', ['Guadalajara', 'Mexico City']],
  ['Aeroméxico Connect', ['León/Del Bajío', 'Monterrey']],
  ['Air Canada', ['Calgary', 'Montréal–Trudeau', 'Toronto–Pearson', 'Vancouver']],
  ['Air China', ['Beijing–Capital']],
  ['Air France', ['Papeete', 'Paris–Charles de Gaulle']],
  ['Air New Zealand', ['Auckland', 'London–Heathrow', 'Rarotonga']],
  ['Air Tahiti Nui', ['Papeete', 'Paris–Charles de Gaulle']],
  ['Alaska Airlines', ['Anchorage', 'Baltimore', 'Guadalajara', 'Havana', 'Ixtapa/Zihuatanejo', 'Liberia', 'Loreto', 'Manzanillo', 'Mazatlán', 'Mexico City', 'Portland, Oregon', 'Puerto Vallarta', 'Salt Lake City', 'San José del Cabo', 'San José de Costa Rica', 'Seattle/Tacoma', 'Washington–National']],
  ['Alaska Airlines', ['Mammoth Lakes', 'Medford', 'San Jose, California', 'Santa Rosa', 'Sun Valley', 'Mexico City']],
  ['Alitalia', ['Rome–Fiumicino']],
  ['All Nippon Airways', ['Tokyo–Haneda', 'Tokyo–Narita']],
  ['Allegiant Air', ['Albuquerque', 'Bellingham', 'Boise', 'Cincinnati', 'Eugene', 'Grand Junction', 'McAllen', 'Medford', 'Memphis', 'Ogden', 'Provo', 'Reno/Tahoe', 'Springfield, Missouri', 'Tulsa', 'Billings', 'Cedar Rapids/Iowa City', 'Des Moines', 'Fargo', 'Little Rock', 'Missoula', 'Montrose', 'Oklahoma City', 'Sioux Falls', 'Wichita']],
  ['American Airlines', ['Atlanta', 'Austin', 'Beijing–Capital', 'Belize City', 'Boston', 'Cancún', 'Charlotte', 'Chicago–O\'Hare', 'Columbus–Glenn', 'Dallas/Fort Worth', 'Denver', 'Hartford', 'Havana', 'Hong Kong', 'Honolulu', 'Indianapolis', 'Kahului', 'Kailua–Kona', 'Las Vegas', 'Lihue', 'London–Heathrow', 'Mexico City', 'Miami', 'Nashville', 'New Orleans', 'New York City', 'Orlando', 'Philadelphia', 'Phoenix', 'Puerto Vallarta', 'Raleigh/Durham', 'St. Louis', 'San José del Cabo', 'São Paulo–Guarulhos', 'Seattle/Tacoma', 'Shanghai–Pudong', 'Sydney', 'Tokyo–Haneda', 'Tokyo–Narita', 'Toronto–Pearson', 'Vancouver', 'Washington–Dulles', 'Washington DC', 'Anchorage', 'Auckland', 'Vail', 'Sacramento']],
  ['American Eagle', ['Albuquerque', 'Denver', 'El Paso', 'Eugene', 'Fayetteville/Bentonville', 'Fresno', 'Houston–Intercontinental', 'Kansas City', 'Mazatlán', 'Medford', 'Montrose', 'Oklahoma City', 'Omaha', 'Phoenix', 'Portland, Oregon', 'Reno/Tahoe', 'Sacramento', 'Salt Lake City', 'San Antonio', 'San Diego', 'San Francisco', 'San Jose, California', 'Seattle/Tacoma', 'Tucson', 'Vancouver', 'Aspen', 'Austin', 'Grand Junction', 'Jackson Hole', 'Redmond/Bend']],
  ['Asiana Airlines', ['Seoul–Incheon']],
  ['Austrian Airlines', ['Vienna']],
  ['Avianca', ['Bogotá']],
  ['Avianca Costa Rica', ['Guatemala City', 'San José de Costa Rica', 'San Salvador']],
  ['Avianca El Salvador', ['San Salvador']],
  ['Boutique Air', ['Inyokern', 'Merced']],
  ['British Airways', ['London–Heathrow']],
  ['Cathay Pacific', ['Hong Kong']],
  ['China Airlines', ['Taipei–Taoyuan']],
  ['China Eastern Airlines', ['Nanjing', 'Shanghai–Pudong']],
  ['China Southern Airlines', ['Guangzhou']],
  ['Copa Airlines', ['Panama City']],
  ['Delta Air Lines', ['Atlanta', 'Austin', 'Belize City', 'Boston', 'Cancún', 'Cincinnati', 'Columbus–Glenn', 'Dallas/Fort Worth', 'Denver', 'Detroit', 'Guatemala City', 'Honolulu', 'Indianapolis', 'Ixtapa/Zihuatanejo', 'Kahului', 'Kailua–Kona', 'Kansas City', 'Las Vegas', 'Lihue', 'Memphis', 'Mexico City', 'Minneapolis/St. Paul', 'Nashville', 'New Orleans', 'New York City', 'Oakland', 'Orlando', 'Phoenix', 'Portland, Oregon', 'Puerto Vallarta', 'Raleigh/Durham', 'Sacramento', 'Salt Lake City', 'San Diego', 'San Jose, California', 'San José del Cabo', 'San José de Costa Rica', 'San Salvador', 'Shanghai–Pudong', 'Sydney', 'Tampa', 'Tokyo–Haneda', 'Washington DC', 'Liberia (CR)', 'Managua', 'Miami', 'Vancouver']],
  ['Delta Connection', ['Albuquerque', 'Austin', 'Boise', 'Dallas/Fort Worth', 'Kansas City', 'Las Vegas', 'Oakland', 'Phoenix', 'Sacramento', 'San Antonio', 'San Diego', 'San Jose, California', 'Spokane', 'Tucson', 'Vancouver', 'Aspen', 'Bozeman', 'Denver', 'Jackson Hole', 'Kalispell', 'Missoula', 'Portland, Oregon', 'Sun Valley']],
  ['Delta Shuttle', ['San Francisco', 'Seattle/Tacoma']],
  ['El Al', ['Tel Aviv–Ben Gurion']],
  ['Emirates', ['Dubai–International']],
  ['Ethiopian Airlines', ['Addis Ababa', 'Dublin']],
  ['Etihad Airways', ['Abu Dhabi']],
  ['EVA Air', ['Taipei–Taoyuan']],
  ['Fiji Airways', ['Nadi']],
  ['Frontier Airlines', ['Atlanta', 'Chicago–O\'Hare', 'Denver', 'Orlando', 'Cincinnati', 'Colorado Springs']],
  ['Great Lakes Airlines', ['Prescott']],
  ['Hainan Airlines', ['Changsha, Chengdu', 'Chongqing']],
  ['Hawaiian Airlines', ['Honolulu', 'Kahului', 'Lihue', 'Kailua–Kona']],
  ['Hong Kong Airlines', ['Hong Kong']],
  ['Iberia', ['Madrid']],
  ['Interjet', ['Cancún', 'Guadalajara', 'León/Del Bajío', 'Mexico City', 'Puerto Vallarta', 'San José del Cabo']],
  ['Japan Airlines', ['Osaka–Kansai', 'Tokyo–Narita']],
  ['JetBlue Airways', ['Boston', 'Buffalo', 'Fort Lauderdale', 'Orlando', 'New York City']],
  ['KLM', ['Amsterdam']],
  ['Korean Air', ['Seoul–Incheon']],
  ['LATAM Chile', ['Lima', 'Santiago de Chile']],
  ['LATAM Perú', ['Lima']],
  ['Level', ['Barcelona']],
  ['LOT Polish Airlines', ['Warsaw–Chopin']],
  ['Lufthansa', ['Frankfurt', 'Munich']],
  ['Mokulele Airlines', ['El Centro']],
  ['Norwegian Air Shuttle', ['Barcelona', 'Copenhagen', 'London', 'Oslo–Gardermoen', 'Paris–Charles de Gaulle', 'Rome–Fiumicino', 'Stockholm–Arlanda']],
  ['Philippine Airlines', ['Manila']],
  ['Qantas', ['Brisbane', 'Melbourne–Tullamarine', 'Sydney']],
  ['Qatar Airways', ['Doha']],
  ['Saudia', ['Jeddah', 'Riyadh']],
  ['Scandinavian Airlines', ['Stockholm–Arlanda']],
  ['Sichuan Airlines', ['Chengdu', 'Hangzhou', 'Jinan']],
  ['Singapore Airlines', ['Seoul–Incheon', 'Singapore', 'Tokyo–Narita']],
  ['Southwest Airlines', ['Albuquerque', 'Atlanta', 'Austin', 'Baltimore', 'Cancún', 'Chicago–Midway', 'Dallas', 'Denver', 'El Paso', 'Houston', 'Indianapolis', 'Kansas City', 'Las Vegas', 'Milwaukee', 'Nashville', 'New Orleans', 'Oakland', 'Phoenix', 'Pittsburgh', 'Portland, Oregon', 'Puerto Vallarta', 'Reno/Tahoe', 'Sacramento', 'St. Louis', 'Salt Lake City', 'San Antonio', 'San Francisco', 'San Jose, California', 'San José del Cabo', 'Tucson', 'Omaha']],
  ['Spirit Airlines', ['Atlanta', 'Baltimore', 'Cleveland', 'Chicago–O\'Hare', 'Dallas/Fort Worth', 'Denver', 'Detroit', 'Fort Lauderdale', 'Houston–Intercontinental', 'Kansas City', 'Las Vegas', 'Minneapolis/St. Paul', 'New Orleans', 'Oakland', 'Philadelphia', 'Pittsburgh']],
  ['Sun Country Airlines', ['Minneapolis/St. Paul']],
  ['Swiss International Air Lines', ['Zürich']],
  ['Thomas Cook Airlines', ['Manchester (UK)']],
  ['Turkish Airlines', ['Istanbul–Atatürk']],
  ['United Airlines', ['Boston', 'Cancún', 'Chicago–O\'Hare', 'Cleveland', 'Denver', 'Hilo', 'Honolulu', 'Houston–Intercontinental', 'Kahului', 'Kailua–Kona', 'Las Vegas', 'Lihue', 'London–Heathrow', 'Melbourne', 'Mexico City', 'Newark', 'Orlando', 'San Diego', 'San Francisco', 'Shanghai–Pudong', 'Singapore', 'Sydney', 'Tokyo–Narita', 'Washington–Dulles', 'Austin', 'Baltimore', 'Puerto Vallarta', 'San José del Cabo', 'Seattle/Tacoma']],
  ['United Express', ['Albuquerque', 'Austin', 'Boise', 'Colorado Springs', 'Dallas/Fort Worth', 'Fresno', 'Las Vegas', 'León/Del Bajío', 'Minneapolis/St. Paul', 'Monterey', 'Oklahoma City', 'Palm Springs', 'Phoenix', 'Redmond',  'Reno/Tahoe', 'Sacramento', 'Salt Lake City', 'San Antonio', 'San Diego', 'San Francisco', 'San Luis Obispo', 'Santa Barbara', 'Seattle/Tacoma', 'St. George, Utah', 'Tucson', 'Vancouver', 'Aspen', 'Bozeman', 'Hayden/Steamboat Springs', 'Jackson Hole', 'Kalispell', 'Missoula', 'Montrose']],
  ['Virgin America', ['Boston', 'Cancún', 'Chicago–O\'Hare', 'Dallas–Love', 'Fort Lauderdale', 'Honolulu', 'Kahului', 'Las Vegas', 'New York City', 'Newark', 'Orlando', 'Philadelphia', 'Portland, Oregon', 'San Francisco', 'Seattle/Tacoma', 'Washington DC']],
  ['Virgin Atlantic', ['London–Heathrow']],
  ['Virgin Australia', ['Brisbane', 'Melbourne–Tullamarine', 'Sydney']],
  ['VivaAerobus', ['Guadalajara']],
  ['Volaris', ['Acapulco', 'Aguascalientes', 'Durango', 'Guadalajara', 'León/Del Bajío', 'Mexico City', 'Morelia', 'Oaxaca', 'Queretaro', 'Uruapan', 'Zacatecas', 'Puerto Vallarta']],
  ['WestJet', ['Calgary', 'Edmonton', 'Toronto–Pearson', 'Vancouver']],
  ['WOW air', ['Reykjavík–Keflavík']],
  ['XiamenAir', ['Qingdao', 'Xiamen']],
  ['XL Airways France', ['Paris–Charles de Gaulle']]
]

DOMESTIC_AIRLINES = [
  'Alaska Airlines',
  'Allegiant Air',
  'American Airlines',
  'American Eagle',
  'Delta',
  'Frontier',
  'JetBlue',
  'Southwest Airlines',
  'Spirit Airlines',
  'United Airlines',
  'Virgin America'
]

DOMESTIC_DESTINATIONS = [
  "Albuquerque",
  "Atlanta",
  "Austin",
  "Baltimore",
  "Boston",
  "Chicago–Midway",
  "Chicago–O'Hare",
  "Cleveland",
  "Dallas",
  "Dallas/Fort Worth",
  "Dallas–Love",
  "Denver",
  "Detroit",
  "El Paso",
  "Fort Lauderdale",
  "Honolulu",
  "Houston",
  "Houston–Intercontinental",
  "Indianapolis",
  "Kansas City",
  "Las Vegas",
  "Milwaukee",
  "Minneapolis/St. Paul",
  "Nashville",
  "New Orleans",
  "New York City",
  "Newark",
  "Oakland",
  "Omaha",
  "Orlando",
  "Philadelphia",
  "Phoenix",
  "Pittsburgh",
  "Portland, Oregon",
  "Reno/Tahoe",
  "Sacramento",
  "Salt Lake City",
  "San Antonio",
  "San Diego",
  "San Francisco",
  "San Jose, California",
  "Seattle",
  "Seattle/Tacoma",
  "St. Louis",
  "Tucson",
  "Washington DC",
  "Washington–Dulles"
]

class Passenger
  attr_accessor :name,
    :originating_from_lax,
    :gender,
    :connecting,
    :gender,
    :mood,
    :trip_purpose,
    :leaving,
    :arriving,
    :complex_flight,
    :layover_minutes,
    :layover_hours,
    :long_layover,
    :has_layover

  def initialize
    @name = Faker::Name.name
    @connecting = rand < CHANCE_ORIGINATING_FROM_LAX
    if !@connecting
      @leaving = rand < 0.50
      @arriving = !leaving
    else
      @arriving = true
    end

    if @connecting || @leaving
      @complex_flight = rand < 0.15 # 15% chance of flying on separate airlines
    else
      @complex_flight = false
    end

    @gender = generate_gender
    @trip_purpose = generate_trip_purpose
    @mood = generate_mood

    if @connecting
      @has_layover = true

      layover_hours = rand * 10
      layover_hours *= rand * 5 if rand > 0.2 # 20% of the time, double or more hour layover

      if layover_hours < 1.0
        @layover_hours = 0
        @layover_minutes = (layover_hours * 60).floor
      else
        @layover_hours = layover_hours.floor
        @layover_minutes = 0
      end
      @long_layover = (@layover_hours > 2.0)
    else
      @has_layover = false
      @layover_hours = 0
      @layover_minutes = 0
      @long_layover = false
    end
  end

  def connecting?
    connecting
  end

  # https://data.worldbank.org/indicator/SP.POP.TOTL.FE.ZS
  def generate_gender
    case rand
    when 0..0.49
      ["she", "her", "hers"]
    when 0.50..0.99
      ["he", "him", "his"]
    else
      ["they", "them", "theirs"]
    end
  end

  def capitalized_they
    gender[0].capitalize
  end

  def capitalized_they_are
    case gender[0]
    when "they"
      "They are"
    else
      gender[0].capitalize + " is"
    end
  end

  def capitalized_they_have
    case gender[0]
    when "they"
      "They have"
    else
      gender[0].capitalize + " has"
    end
  end

  def generate_mood
    case trip_purpose[0]
    when :vacation
      ['excited', 'nervous', 'tired', 'sunburned'].sample
    when :business
      ['tired', 'overworked', 'nervous'].sample
    when :funeral
      ['sad', 'tired', 'grief-stricken', 'content'].sample
    else
      ['excited', 'nervous', 'tired', 'sad', 'angry', 'anxious', 'ecstatic', 'delirious'].sample
    end
  end

  def generate_trip_purpose
    case rand
    when 0..0.33
      [:vacation, 'on a vacation']
    when 0.34..0.50
      [:business, 'for business']
    when 0.50..0.74
      [:family, 'to visit family']
    when 0.75..0.85
      [:pilgrimage, 'on a pilgrimage']
    when 0.86..0.90
      [:funeral, 'to attend a funeral']
    when 0.91..0.5
      [:wedding, 'to attend a wedding']
    else
      [:secret, 'on top-secret business']
    end
  end

  def has_layover?
    has_layover
  end

  def layover_output
    if has_layover?
      "#{capitalized_they_have} a nice long layover of #{layover_hours} hours. "
    else
      if @layover_minutes < 30
        "#{capitalized_they_have} a problem because they missed their flight."
      else
        "#{capitalized_they_are} in a big hurry because they only have a layover of #{layover_minutes} minutes. "
      end
    end
  end
end

class DomesticPassenger < Passenger
  attr_reader :from_state, :destination, :arriving_from

  def initialize
    super
    @from_state = Faker::Address.state

    @arrival_airline = DOMESTIC_AIRLINES.sample
    @arriving_from = DOMESTIC_DESTINATIONS.sample

    if complex_flight
      @going_to_airline = DOMESTIC_AIRLINES.sample
    else
      @going_to_airline = @arrival_airline
    end
    @destination = DOMESTIC_DESTINATIONS.sample
  end

  def run
    output = "#{name} is a domestic passenger. #{gender[0].capitalize} is from #{from_state}. "
    if connecting?
      output += "#{capitalized_they} is connecting through LAX, coming from #{arriving_from} and headed to #{destination}. "
      output += "#{name} is flying on #{@arrival_airline}. " if rand > 0.33
    else
      output += "#{capitalized_they} is leaving from LAX to go to #{destination}. "
    end
    if rand > 0.33
      output += (rand > 0.5) ? "#{name} is" : capitalized_they_are
      output += " traveling #{trip_purpose[1]}. "
    end
    output += "#{capitalized_they_are} #{mood}. " if rand > 0.3
    output += layover_output
    output
  end
end

class InternationalPassenger < Passenger
  attr_reader :country_of_origin, :arrival_airline, :arriving_from

  def initialize
    super
    @country_of_origin = Faker::Address.country

    arrival = DESTINATIONS.sample
    @arrival_airline = arrival[0]
    @arriving_from = arrival[1].sample

    if complex_flight
      departure = DESTINATIONS.sample
      @going_to_airline = departure[0]
      @going_to_city = departure[1].sample
    else
      @going_to_airline = arrival[0]
      @going_to_city = arrival[1].sample
    end
  end

  def run
    output = "#{@name} is an international passenger. "
    output += "#{capitalized_they} is a citizen of #{@country_of_origin}. "

    if connecting?
      output += "Arriving from #{@arriving_from} on #{@arrival_airline}. Going to #{@going_to_city}"
      if @going_to_airline != @arrival_airline
        output += " on #{@going_to_airline}."
        output != "#{capitalized_they} saved money by booking this complex flight across airlines. " if rand > 0.33
      else
        output += ". "
      end
    else
      output += "#{capitalized_they} is leaving from LAX to travel to #{@going_to_city} on #{@going_to_airline}. "
    end

    output += layover_output
    output
  end
end

# Begin generating passengers:
# First of all, is this passenger a domestic or international passenger?

def generate_passenger_stories
  10.times do
    domestic_or_international = rand
    if domestic_or_international < CHANCE_DOMESTIC
      puts DomesticPassenger.new.run + "\n"
    else
      puts InternationalPassenger.new.run + "\n"
    end
  end
end

generate_passenger_stories
