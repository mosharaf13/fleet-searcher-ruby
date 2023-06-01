# frozen_string_literal: true

module Google
  class SearchKeywordJob < ApplicationJob
    queue_as :default

    def perform(keyword)
      html_result = Google::ClientService.new(keyword: keyword).call

      raise ClientServiceError unless html_result

      # Logging the html_result
      Rails.logger.info("SearchKeywordJob: Performing the job with html_result: #{html_result}")

      # Perform additional job logic...
    end
  end
end
