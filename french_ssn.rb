#define the method
#creat regexp to valid the strings
#find the remainder
#build the strings
require 'yaml'
DEPTS_HASH = YAML.load_file('data/french_departments.yml')

def ssn_check(ssn)
  match_data = /^(?<gender>[12]) (?<year>\d{2}) (?<month>\d{2}) (?<dept>\d{2}) (?<rand>\d{3} \d{3}) (?<mod>\d{2})$/
  result = ""
  data = ssn.match(match_data)
  if ssn =~ match_data
    var = ssn.slice(0,ssn.length-3).gsub(/\s/,"" ).to_i
    #(46, equal to the remainder of the division of (97 - ssn_without_key) by 97.
    unless ssn.split.pop.to_i == (97 - var)% 97
      return "The number is invalid"
    end
    gender = data[:gender]==1 ? "woman" : "man"
    depart = data[:dept]
    yr = data[:year]
    p result = "a #{gender}, born in #{Date::MONTHNAMES[data[:month].to_i]}, 19#{yr} in #{DEPTS_HASH[depart]}."
  else
    return "The number is invalid"
  end
  result
end


