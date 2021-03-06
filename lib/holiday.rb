require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above 
  # add the second argument, which is a supply, to BOTH the 
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holidays|
    if season == :winter
      holidays.each do |holiday, items|
        items << supply
      end
    end
  end
  
end
 

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holidays|
    if season == :spring
      holidays.each do |holiday, items|
        if holiday == :memorial_day
          items << supply
        end
      end
    end
  end
  
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday = holiday_hash[season]
  holiday[holiday_name] = supply_array
  holiday_hash[season] = holiday
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  supplies = []
  holiday_hash.collect do |season, holidays|
    if season == :winter
      holidays.collect do |holiday, supps|
          supplies << supps
      end
    end
  end
  supplies.flatten!
  
  
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.collect do |season, holidays|
    puts "#{season.capitalize}:"
    holidays.collect do |holiday, items|
      holi = holiday.id2name
      if items.length == 1 
        puts "  #{holi.capitalize.gsub(/_/, " ").split.map(&:capitalize).join(' ')
}: #{items[0]}"
      elsif items.length > 1
        puts "  #{holi.capitalize.gsub(/_/, " ").split.map(&:capitalize).join(' ')
}: #{items[0]}, #{items[1]}"
      end

    end
  end
  
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  i = []
  holiday_hash.collect do |season, holidays|
    holidays.collect do |holiday, supplies|
      if supplies.include?("BBQ")
        i << holidays.key(supplies)
      end
    end
  end
  i
end







