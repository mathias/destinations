require 'rubygems'
require 'faker'

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
  ['American Airlines ( Gates 50A/50B/53A/53B )', 'AA', 'Terminal 5'],
  ['American Eagle', 'AA', 'Terminal 4'],
  ['Asiana Airlines', 'OZ', 'TBIT'],
  ['Austrian Airlines ( Departures -TB, Arrivals - T-7 )', 'OS', 'TBIT', '(800) 843-0002
  ['Avianca Airlines', 'AV', 'Terminal 3', '(800) 284-2622
  ['Boutique Airlines', '4B', 'Terminal 6', '(855) 268-8478
  ['British Airways', 'BA', 'TBIT', '(800) 247-9297
  ['Cathay Pacific Airways', 'CX', 'TBIT', '(800) 233-2742
  ['China Airlines', 'CI', 'TBIT', '(800) 227-5118
  ['China Eastern', 'MU', 'TBIT', '(626) 583-1500
  ['China Southern', 'CZ', 'TBIT', '(888) 338-8988
  ['Copa Airlines', 'CM', 'TBIT', '(800) 359-2672
  ['Copa Airlines', 'CM', 'Terminal 3', '(800) 359-2672
  ['Delta Airlines', 'DL', 'Terminal 2', '(800) 221-1212
  ['Delta Airlines', 'DL', 'Terminal 3', '(800) 221-1212
  ['El Al Israel Airlines', 'LY', 'TBIT', '(800) 223-6700
  ['Emirates', 'EK', 'TBIT', '(800) 777-3999
  ['Ethiopian Airlines ( Arrivals TB. Departures T-6 )', 'ET', 'Terminal 6', '(800) 445-2733
  ['Etihad Airways', 'EY', 'TBIT', '(888) 838-4423
  ['EVA Air', 'BR', 'TBIT', '(800) 695-1188
  ['Fiji Airways', 'FJ', 'TBIT', '(800) 227-4446
  ['Frontier Airlines', 'F9', 'Terminal 5', '(801) 401-9000
  ['Great Lakes Airlines', 'ZK', 'Terminal 6', '(800) 554-5111
  ['Hainan Airlines', 'HU', 'TBIT', '(888) 688-8813
  ['Hawaiian Airlines', 'HA', 'Terminal 5', '(800) 367-5320
  ['Iberia Airlines', 'IB', 'TBIT', '(800) 772-4642
  ['InterJet', '4O', 'Terminal 3', '(866) 285-8307
  ['Japan Airlines', 'JL', 'TBIT', '(800) 525-3663
  ['Jet Blue', 'B6', 'Terminal 5', '(800) 538-2583
  ['KLM Royal Dutch Airlines', 'KL', 'TBIT', '(800) 225-2525
  ['Korean Airlines', 'KE', 'TBIT', '(800) 438-5000
  ['LATAM', 'LA', 'TBIT', '(866) 435-9526
  ['Level Airlines', 'IB', 'TBIT', '(800) 994-0704
  ['LOT Polish', 'LO', 'TBIT', '(212) 789-0970
  ['Lufthansa', 'LH', 'TBIT', '(800) 645-3880
  ['Mokulele Airlines', 'MW', 'Terminal 6', '(800) 260-7070
  ['Norwegian Air Shuttle', 'DY', 'TBIT', '(800) 357-4159
  ['Philippine Airlines', 'PR', 'TBIT', '(800) 435-9725
  ['Qantas', 'QF', 'TBIT', '(800) 227-4500
  ['Qantas QF16 (Departure)', 'QF', 'TBIT', '(800) 227-4500
  ['Qatar Airways', 'QR', 'TBIT', '(877) 777-2827
  ['SAS (Scandanavian Airlines)', 'SK', 'TBIT', '(800) 221-2350
  ['Saudi Arabian Airlines', 'SV', 'TBIT', '(800) 472-8342
  ['Sichuan Airlines', '3U', 'TBIT', ' 
  ['Singapore Airlines', 'SQ', 'TBIT', '(800) 742-3333
  ['Southwest Airlines', 'WN', 'Terminal 1', '(800) 435-9792
  ['Southwest Int'l ( Check In T-1. Bus to TBIT for Departure/Arrival )', 'WN', 'TBIT', '(800) 435-9792
  ['Spirit Airlines', 'NK', 'Terminal 5', '(801) 401-2222
  ['Sun Country', 'SY', 'Terminal 5', '(800) 359-6786
  ['Swiss International Air Lines Ltd.', 'LX', 'TBIT', '(877) 359-7947
  ['Thomas Cook Airlines ( Arriving Pax Exit at T-6 )', 'MT', 'Terminal 6', '(855) 759-3665
  ['Transaero', 'UN', 'TBIT', '(877) 747-1191
  ['Turkish Airlines', 'TK', 'TBIT', '(800) 874-8875
  ['United Airlines ( E-Ticket Passengers )', 'UA', 'Terminal 7', '(800) 241-6522
  ['United Airlines ( Paper Tickets and Non Ticketed )', 'UA', 'Terminal 8', '(800)241-6522
  ['United Airlines ( Premier, First Class, Business Class Only )', 'UA', 'Terminal 6', '(800) 241-6522
  ['United Express ( E-Ticket Passengers )', 'UA', 'Terminal 7', ' 
  ['United Express Airlines ( Paper Tickets and Non Ticketed )', 'UA', 'Terminal 8', '(800) 241-6522
  ['Virgin America', 'VX', 'Terminal 6', '(877) 359-8474
  ['Virgin Atlantic', 'VS', 'Terminal 2', '(800) 862-8621
  ['Virgin Australia ( Checkin T-2. Bus to TB for Departures. Arrivals-TB )', 'VA', 'Terminal 2', '(855) 253-8021
  ['Volaris', 'Y4', 'Terminal 2', '(866) 988-3527
  ['West Jet', 'WS', 'Terminal 2', '(888) 937-8538
  ['WOW Air', 'WW', 'TBIT', '(866) 512-8364
  ['Xiamen Airlines ( Departures TB. Arrivals T-2 )', 'MF', 'TBIT', '(800) 629-5557
  ['XL Airways France', 'SE', 'Terminal 6', '(877) 496-9889
]
