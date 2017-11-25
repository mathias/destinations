
module LaxData
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

  INTERNATIONAL_DESTINATIONS = [
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
end
