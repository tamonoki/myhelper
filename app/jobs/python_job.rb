class PythonJob < ActiveJob::Base
  queue_as :python

  def perform(order_id)
    # Do something later
	sleep 5
	logger = Logger.new(File.join(Rails.root, 'log', 'resque.log'))
	logger.info "Hello #{order_id}"

	# Do python
	#%x["python #{File.join(Rails.root, 'app', 'assets', 'pythons', 'logger.py')}"]
	system("python #{File.join(Rails.root, 'app', 'assets', 'pythons', 'modified.py')} #{order_id}")
  end
end
