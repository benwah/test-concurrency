require_relative './expensive_job.rb'
require_relative './io_bound_job.rb'
require_relative './runners.rb'

NUMBER_OF_TIMES = ENV['TIMES'].to_i

SingleThreaded.new(ExpensiveJob, NUMBER_OF_TIMES).run
MultiThreaded.new(ExpensiveJob, NUMBER_OF_TIMES).run
MultiProcessed.new(ExpensiveJob, NUMBER_OF_TIMES).run

SingleThreaded.new(IoBoundJob, NUMBER_OF_TIMES).run
MultiThreaded.new(IoBoundJob, NUMBER_OF_TIMES).run
MultiProcessed.new(IoBoundJob, NUMBER_OF_TIMES).run
