# frozen_string_literal: true

module Google
  class SearchKeywordJob < ApplicationJob
    queue_as :default

    def perform(search_stat_id)
      search_stat = SearchStat.find search_stat_id

      html_result = Google::ClientService.new(keyword: search_stat.keyword).call

      raise ClientServiceError unless html_result
      
      update_search_stat search_stat, ParserService.new(html_response: html_result).call

      # Logging the html_result
      # Rails.logger.info("SearchKeywordJob: Performing the job with html_result: #{html_result}")

      # Perform additional job logic...
    end

    def update_search_stat(search_stat, attributes)
      # Rails.logger.info("Update search stat got called with attributes: #{attributes.inspect}")

      SearchStat.transaction do
        # rubocop:disable Rails/SkipsModelValidations
        search_stat.result_links.insert_all attributes[:result_links]
        # rubocop:enable Rails/SkipsModelValidations

        search_stat.update! attributes.except(:result_links)
      end
    end
  end
end
