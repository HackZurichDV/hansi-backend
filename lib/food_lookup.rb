# frozen_string_literal: true

class FoodLookup
  include HTTParty

  debug_output $stdout # <= will spit out all request details to the console

  base_uri "https://api.edamam.com/api"

  def initialize
    @options = {
      app_id:  "7fada9d2",
      app_key: "c47170f479901ee157057f0342860410"
    }
  end

  def autocomplete(name)
    self.class.get(
      path("/food-database/parser?ingr=#{name}")
    )
  end

  private

    def path(url)
      "#{url}&app_id=#{@options[:app_id]}&app_key=#{@options[:app_key]}"
    end
end
