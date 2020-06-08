class Startup

    @@all = []
  
    attr_reader :name, :founder, :domain
  
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
  
    def pivot(name, domain)
        @name = name
        @domain = domain
    end
  
    def self.all
        @@all 
    end
  
    def self.find_by_founder(founder_name)
        @@all.each do |startup|
            if startup.founder == founder_name
                return startup
            end
        end
    end     
  
    def self.domains
        domain_list = @@all.map {|startup| startup.domain}
        domain_list.uniq
    end

    def sign_contract(venture_capitalist, type_of_investment, amount_invested)
        FundingRound.new(self, venture_capitalist, type_of_investment, amount_invested)
    end

    def num_funding_rounds
        funding_count = 0
        FundingRound.all.each do |funding_round| 
            if funding_round.startup == self
                funding_count += 1
            end
        end
        return funding_count
    end

    def total_funds
        total_sum = 0
        FundingRound.all.each do |funding_round|
            if funding_round.startup == self
                total_sum += funding_round.investment 
            end
        end
        total_sum
    end

    def investors
        investors = []
        FundingRound.all.each do |funding_round|
            if funding_round.startup == self
                investors << funding_round.venture_capitalist
            end
        end
        return investors.uniq
    end

    def big_investors
        big_investors = []
        FundingRound.all.each do |funding_round|
            if funding_round.startup == self && funding_round.venture_capitalist.total_worth > 1000000000
                big_investors << funding_round.venture_capitalist.name
            end
        end
        big_investors.uniq
    end
  end
  
  amazon = Startup.new("amazon", "jeff", "ecommerce")
  netflix = Startup.new("netflix", "reed", "video streaming")
  hulu = Startup.new("hulu", "bob", "video streaming")
  microsoft = Startup.new("microsoft", "bill", "computers")