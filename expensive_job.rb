class ExpensiveJob
  def initialize(job_number)
    @job_number = job_number
  end

  def do_work
    start = Time.now
    500000.times do
      420**420
    end
    end_time = Time.now
    puts "Finished job #{@job_number} in #{end_time - start}s"
  end
end
