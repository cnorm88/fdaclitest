class Api

  def self.get_report
    url = "https://api.fda.gov/food/enforcement.json?search=report_date:[20200101+TO+20200520]&limit=15"
    url = URI(url)
    response = Net::HTTP.get(url)
    hash = JSON.parse(response)

    reports_array = hash["results"]

    reports_array.each do |reports_hash|
        report = Reports.new
        # binding.pry
        report.name = reports_hash["recalling_firm"]
        report.date = reports_hash["recall_initiation_date"]
        report.state = reports_hash["state"]
        report.city = reports_hash["city"]
        report.recall_reason = reports_hash["reason_for_recall"]
        report.description = reports_hash["product_description"]
        report.quantity = reports_hash["product_quantity"]
    end
  end

  def self.get_states

    self.get_report.uniq do |states|
      states_array = Reports.new
      states_array.state = states["state"]
    end
  end
  #   url = "https://api.fda.gov/food/enforcement.json?search=report_date:[20200101+TO+20200520]&limit=15"
  #   url = URI(url)
  #   response = Net::HTTP.get(url)
  #   hash = JSON.parse(response)

  #   reports_array = hash["results"]

  #    reports_array.each.uniq do |reports_hash|
  #       report = Reports.new
  #       # binding.pry
  #       report.name = reports_hash["recalling_firm"]
  #       report.date = reports_hash["recall_initiation_date"]
  #       report.state = reports_hash["state"]
  #       report.city = reports_hash["city"]
  #       report.recall_reason = reports_hash["reason_for_recall"]
  #       report.description = reports_hash["product_description"]
  #       report.quantity = reports_hash["product_quantity"]
  #   end
  # end

end