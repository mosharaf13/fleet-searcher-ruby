# frozen_string_literal: true

# lib/tasks/hard_job.rake

task :run_hard_job => :environment do
  HardJob.perform('Dummy Argument')
  puts 'Hard job enqueued successfully.'
end
