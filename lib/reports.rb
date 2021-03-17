class Reports

  attr_accessor :name, :date, :state, :city, :recall_reason, :description, :quantity

  @@all = []
  # @@state = []

  def initialize
    @@all << self
    # @@state << state.all
  end

  def self.all
    @@all
  end

  # def self.state
  #   @@state << state.all
  # end

end