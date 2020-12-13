require 'rails_helper'

RSpec.describe ExportWeatherDataJob, type: :job do
  it 'enqueue job to default queue' do
    ActiveJob::Base.queue_adapter = :test
    expect {
      ExportWeatherDataJob.perform_later
    }.to have_enqueued_job.on_queue("default")
  end
end
