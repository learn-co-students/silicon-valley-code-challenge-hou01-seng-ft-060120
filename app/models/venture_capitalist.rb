class VentureCapitalist

    @@all = []
    
    attr_reader :name, :total_worth  

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|venture_capitalist| venture_capitalist.total_worth > 1000000000}
    end

    def offer_contract(startup_object, investment_type, investment_amount)
        FundingRound.new(startup_object, self, investment_type, investment_amount)
    end

    def funding_round
        all_funding_round = []
        FundingRound.all.each do |funding_round|
            if funding_round.venture_capitalist == self
                all_funding_round << funding_round
            end
        end
        all_funding_round
    end

    def portfolio
        portfolio = []
        FundingRound.all.each do |funding_round|
            if funding_round.venture_capitalist == self
                portfolio << funding_round.startup.name
            end
        end
        portfolio.uniq
    end

    def biggest_investment
        biggest_investment = []
        FundingRound.all.each do |funding_round|
            if funding_round.venture_capitalist == self
                biggest_investment << funding_round.investment
            end
        end
        biggest_investment.max
    end

    def invested(domain_string)
        total_investment = 0
        FundingRound.all.each do |funding_round|
            if funding_round.startup.domain == domain_string && funding_round.venture_capitalist == self
                total_investment += funding_round.investment 
            end
        end
        return total_investment
    end

    # def invested(invested_one_firm)
    #     @@all.each do |venture_firm| 
    #         venture_firm.invested_one_firm
    #     end
    # end

end

chase_capital = VentureCapitalist.new("chase", 10)
bain_capital = VentureCapitalist.new("bain", 1000000001)