require_relative './thread_pool.rb'
require 'ruby-prof'

class BaseRunner
  def initialize(job, number_of_times)
    @job = job
    @number_of_times = number_of_times
  end

  def run
    puts "[#{self.class}] Doing job #{@number_of_times} times."
    start_time = Time.now.utc
    perform
    puts "Total time: #{Time.now.utc - start_time}s"
  end

  def profile
    RubyProf.measure_mode = RubyProf::PROCESS_TIME
    profiler = RubyProf::Profile.new
    profiler.exclude_methods!(BaseRunner, :profile)
    profiler.exclude_common_methods!
    profiler.start
    yield
    print_result(profiler.stop)
  end

  def print_result(result)
    # printer = RubyProf::GraphPrinter.new(result)
    # printer.print(STDOUT, {})
    printer = RubyProf::GraphHtmlPrinter.new(result)
    # printer = RubyProf::FlatPrinter.new(result)
    f = File.open("#{self.class}.html", 'w')
    printer.print(f, {})
    `open #{f.path}`
    # printer = RubyProf::MultiPrinter.new(result)
    # printer.print(:path => ".", :profile => "profile")
  end
end

class SingleThreaded < BaseRunner
  def perform
    profile do
      @number_of_times.times.map do |job_number|
        @job.new(job_number).do_work
      end
    end
  end
end

class MultiThreaded < BaseRunner
  def perform
    profile do
      threads = @number_of_times.times.map do |job_number|
        Thread.new do
          @job.new(job_number).do_work
        end
      end
      threads.each(&:join)
    end
  end
end

class MultiProcessed < BaseRunner
  def perform
    @number_of_times.times.map do |job_number|
      fork do
        profile do
          @job.new(job_number).do_work
        end
      end
    end
    Process.wait
  end
end
