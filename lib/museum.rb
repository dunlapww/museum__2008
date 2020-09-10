class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommended_exhibits = []
    @exhibits.each do |exhibit|
      if patron.interests.include? (exhibit.name)
        recommended_exhibits << exhibit
      end
    end
    recommended_exhibits
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibits_by_interest = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if recommend_exhibits(patron).include?(exhibit)
          if exhibits_by_interest[exhibit]
            exhibits_by_interest[exhibit] << patron
          else
            exhibits_by_interest[exhibit] = [patron]
          end
        end
      end
    end
    @exhibits.each do |exhibit|
      if !exhibits_by_interest[exhibit]
        exhibits_by_interest[exhibit] = []
      end
    end
    exhibits_by_interest
  end

  def ticket_lottery_contestants(exhibit)
    contestants = []
    @patrons.each do |patron|
      if recommend_exhibits(patron).include?(exhibit) && patron.spending_money < exhibit.cost
        contestants << patron
      end
    end
    contestants
  end


end
