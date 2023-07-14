# frozen_string_literal: true

class SearchStatsController < ApplicationController
  # GET /search_stats
  def index
    @pagy, @search_stats = pagy(current_user.search_stats)
  end

  # GET /search_stat/1
  def show
    @search_stat = current_user.search_stats.includes(:result_links).find(params[:id])
  end
end
