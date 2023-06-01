# app/jobs/hard_job.rb

class HardJob
  include Sidekiq::Worker

  def perform(*args)
    # Do something

    # Logging an example message
    Rails.logger.info('HardJob: Performing the job...')
    
    # Logging additional information
    Rails.logger.debug("HardJob: Arguments: #{args.inspect}")

    # More job logic...
  end
end
