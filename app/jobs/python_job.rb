class PythonJob < ActiveJob::Base
  queue_as :python

  def perform(message)
    # Do something later
	sleep 5
	logger = Logger.new(File.join(Rails.root, 'log', 'resque.log'))
	logger.info "Hello #{message}"
  end
end
