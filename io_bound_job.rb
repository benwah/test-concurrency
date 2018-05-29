require 'tempfile'
require 'net/http'
require 'pry'

class IoBoundJob
  URL = URI('http://localhost:4567')

  def initialize(job_number)
    @job_number = job_number
  end

  def do_work
    start = Time.now

    Net::HTTP.start(URL.host, URL.port) do |http|
      request = Net::HTTP::Get.new URL

      http.request(request) do |response|
        response.body
      end
    end

    end_time = Time.now

    puts "Finished job #{@job_number} in #{end_time - start}s"
  end
end
