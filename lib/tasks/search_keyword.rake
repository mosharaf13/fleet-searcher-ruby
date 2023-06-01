# frozen_string_literal: true

# lib/tasks/search_keyword.rake

namespace :google do
  desc 'Schedule the SearchKeywordJob'
  task schedule_search_keyword_job: :environment do
    # Fetch the keyword ID or keyword name that you want to process
    keyword = 'spotify' # Replace with the actual keyword ID or name

    # Schedule the SearchKeywordJob for background processing
    Google::SearchKeywordJob.perform_later(keyword)

    puts 'SearchKeywordJob scheduled successfully.'
  end
end
