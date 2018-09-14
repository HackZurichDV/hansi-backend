# frozen_string_literal: true

module Api
  class AutocompleteController < ApplicationController
    def index
      data = FoodLookup.new.autocomplete(query)

      render json: data
    end

    private

      def query
        params.require("q")
      end
  end
end
