require_relative './expensive_job.rb'
require_relative './io_bound_job.rb'

job_number = ENV['JOB_NUMBER']
job_to_run = Object.const_get(ENV['JOB_NAME'])
job_to_run.new(job_number).do_work
