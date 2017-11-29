require 'rubygems'
require 'faker'

require './data'
include LaxData

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
    :has_layover,
    :ground_transportation

  def initialize
    @name = Faker::Name.name
    @connecting = rand < CHANCE_ORIGINATING_FROM_LAX
    @leaving = rand < 0.50
    @arriving = !leaving

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

    @ground_transportation = generate_ground_transportation
  end

  def connecting?
    connecting
  end

  # https://data.worldbank.org/indicator/SP.POP.TOTL.FE.ZS
  def generate_gender
    case rand
    when 0..0.49
      ["she", "her", "her"]
    when 0.50..0.99
      ["he", "him", "his"]
    else
      ["they", "them", "their"]
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

  def long_layover?
    long_layover
  end

  def layover_output
    return '' unless has_layover?

    output = ''
    if long_layover?
      if layover_hours > 6
        output += "#{capitalized_they_have} an incredibly long layover of #{layover_hours} hours. "
        case rand
        when 0..0.4
          output += "Time to get some sleep? "
        when 0.4..0.9
          output += "Perhaps there is an open restaurant to eat at? "
        else
          output += "#{capitalized_they} begins #{['crying', 'laughing', 'sobbing', 'sneezing'].sample} at the thought of being here that long. "
        end
      else
        output += "#{capitalized_they_have} a #{['nice', 'convenient', 'boring', 'comfortable'].sample} layover of #{layover_hours} hours. "
      end
    else
      if layover_minutes < 30
        output += "#{capitalized_they_have} a problem because #{gender[0]} missed #{gender[2]} flight. "
      else
        output += "#{capitalized_they_are} in a big hurry because #{gender[0]} only have a layover of #{layover_minutes} minutes. "
      end
    end

    output
  end

  def generate_ground_transportation
    if arriving && !connecting
      LOCAL_TRANSPORTATION.sample
    end
  end

  def ground_transportation_output
    output = ''
    if ground_transportation
      output += "#{capitalized_they_are} is going to take #{ground_transportation} from the airport. "
      output += "Their ride is late. " if rand > 0.8
    end
    output
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
    elsif arriving
      output += "#{capitalized_they} is arriving from #{arriving_from}. "
    else
      output += "#{capitalized_they} is leaving from LAX to go to #{destination}. "
    end
    if rand > 0.33
      output += (rand > 0.5) ? "#{name} is" : capitalized_they_are
      output += " traveling #{trip_purpose[1]}. "
    end
    output += "#{capitalized_they_are} #{mood}. " if rand > 0.3
    output += layover_output
    output += ground_transportation_output
    output
  end
end

class InternationalPassenger < Passenger
  attr_reader :country_of_origin, :arrival_airline, :arriving_from

  def initialize
    super
    @country_of_origin = Faker::Address.country

    arrival = INTERNATIONAL_DESTINATIONS.sample
    @arrival_airline = arrival[0]
    @arriving_from = arrival[1].sample

    if complex_flight
      departure = INTERNATIONAL_DESTINATIONS.sample
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
        output += " on #{@going_to_airline}. "
        output != "#{capitalized_they} saved money by booking this complex flight across airlines. " if rand > 0.33
      else
        output += ". "
      end

      if rand > 0.2 # chance to take the bus between terminals
        output += "#{capitalized_they_have} to wait for a bus between terminals. "

        if rand > 0.2
          output += ["#{capitalized_they_are} not amused. ",
                     'The novelty is wearing off. ',
                     'How long does this take? ',
                     'Why won\'t anyone help them find where to go? '].sample
        end
      end
    else
      output += "#{capitalized_they} is leaving from LAX to travel to #{@going_to_city} on #{@going_to_airline}. "
    end

    output += layover_output
    output += ground_transportation_output
    output
  end
end

# Begin generating passengers:
# First of all, is this passenger a domestic or international passenger?

def generate_passenger
  domestic_or_international = rand
  if domestic_or_international < CHANCE_DOMESTIC
    puts DomesticPassenger.new.run + "\n"
  else
    puts InternationalPassenger.new.run + "\n"
  end
end

def generate_passenger_stories
  10.times do
    generate_passenger
  end
end

generate_passenger_stories
