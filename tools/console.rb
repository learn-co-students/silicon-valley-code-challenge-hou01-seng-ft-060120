require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


## Startup Objects

amazon = Startup.new("amazon", "jeff", "ecommerce")
netflix = Startup.new("netflix", "reed", "video streaming")
hulu = Startup.new("hulu", "bob", "video streaming")
microsoft = Startup.new("microsoft", "bill", "computers")
stripe = Startup.new("strip", "pat", "payments")
blockchain = Startup.new("cypto", "john", "payments2")


## VC Objects

chase_capital = VentureCapitalist.new("chase", 1088888888888888888)
f = VentureCapitalist.new("f", 1234587289317489237)
z = VentureCapitalist.new("z", 1888888888888888)
intel_capital = VentureCapitalist.new("intel", 10)
bain_capital = VentureCapitalist.new("bain", 1000000001)
x_capital = VentureCapitalist.new("x", 2394872904809)
y_capital = VentureCapitalist.new("y", 555555555555)

## Funding Rounds


round1 = FundingRound.new(stripe, bain_capital, "Series A", 542233434543)
round2 = FundingRound.new(hulu, chase_capital, "Angel", 100)
round3 = FundingRound.new(hulu, intel_capital, "Series A", 10000000000023)
round4 = FundingRound.new(microsoft, x_capital, "Series D", 2)
round5 = FundingRound.new(hulu, z, "Series B", 23494039344882)
round6 = FundingRound.new(microsoft, y_capital, "Series D", 29824332983298)
round7 = FundingRound.new(netflix, f, "Angel", 2000000000000000)
round8 = FundingRound.new(microsoft, chase_capital, "Angel", 2000000000000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line