# frozen_string_literal: true

module Api
  class ListsController < ApplicationController
    before_action :set_list, only: [:show, :update, :destroy]

    # GET /api/lists
    def index
      @api_lists = List.all

      render json: @api_lists
    end

    # GET /api/lists/1
    def show
      render json: @api_list
    end

    # POST /api/lists
    def create
      @api_list = List.new(api_list_params)

      if @api_list.save
        render json: @api_list, status: :created, location: @api_list
      else
        render json: @api_list.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/lists/1
    def update
      if @api_list.update(api_list_params)
        render json: @api_list
      else
        render json: @api_list.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/lists/1
    def destroy
      @api_list.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_list
        @api_list = List.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def api_list_params
        params.fetch(:api_list, {})
      end
  end
end
