require 'pry'

  # given that holiday_hash looks like this:
  holiday_hash = {
    :winter => {
      :christmas => ["Lights", "Wreath"],
      :new_years => ["Party Hats"]
    },
    :summer => {
      :fourth_of_july => ["Fireworks", "BBQ"]
    },
    :fall => {
      :thanksgiving => ["Turkey"]
    },
    :spring => {
      :memorial_day => ["BBQ"]
    }
  }


def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |key, value|
    if key == :winter
      value.each do |attribute, data|
        data << supply
      end
    end
  end 
end
 

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |key, value|
    if key == :spring
      value.each do |attribute, data|
        data << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |key, value|
    puts "#{key.capitalize}:"
    value.each do |attribute, data|
      holiday = ''
        if attribute.to_s.include? '_'
          holiday = attribute.to_s.gsub!('_', ' ')
        else
          holiday = attribute.to_s
        end
      puts "  #{holiday.split.map(&:capitalize).join(' ')}: #{data.flatten.join(', ')}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  holidays_with_bbq = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, supplies|
      if supplies.include?("BBQ")
        holidays_with_bbq << holiday
      end
    end
  end
  holidays_with_bbq
end
