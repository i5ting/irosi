require 'curb'
require 'nokogiri'
require 'fileutils'

class Rosi
	
	def self.download(debug=false,&block) 
		server = Rosi.new(debug)
		server.instance_eval(&block) 
		server.download_all
	end
	
	def initialize(debug=false)
		@debug = debug
		@todo_download_numbers = []
	end

	def download_all
		puts 'download_all starting...'
		@todo_download_numbers.each do |num|
			if @debug
				# do nothing
			else
				download_pics_albumID num
			end
		end
	end
	
	def item(i)
		puts "download alburm number = #{i}"
		@todo_download_numbers << i
	end

	private 

	def myretry (tries = 3)
	  begin
	    yield
	  rescue
	    tries -= 1
	    retry if tries > 0
	    puts "can't operate : #{$!}"
	  end
	end

	def download_pics_albumID(albumID)

	  # make the directory to store the image files
	  dir = 'rosi-pics/ROSI-' + albumID.to_s
	  FileUtils.mkdir_p dir

	  url = 'http://rosi.mn/x/album-' + albumID.to_s + '.htm'
	  http = ""
	  myretry { http = Curl.get(url) }
	  doc = Nokogiri::HTML(http.body)
		
	  coverimg = doc.css("div#album-face img")
	  coverurl = coverimg[0]['src']
	  coverfilepath = dir + "/ROSI-#{albumID.to_s}-" + "000.jpg"
	  puts "\nDownloading " + coverurl
	  puts 'Store in ' + coverfilepath
	  myretry do
	    Curl::Easy.download( coverurl, coverfilepath ) do |curl|
	      curl.headers["Referer"] = url
	    end
	  end

	  i = 1
	  anchors = doc.css("div.album-thumbs-free a")
	  anchors.each do |anchor|
	    imgurl = anchor['href']
	    ext = imgurl.split(/\./).last
	    filepath = dir + "/ROSI-#{albumID.to_s}-" + i.to_s.rjust(3,"0") + ".#{ext}"

	    puts "\nDownloading " + imgurl
	    puts 'Store in ' + filepath
	    myretry do
	      Curl::Easy.download( imgurl, filepath ) do |curl|
	        curl.headers["Referer"] = url
	      end
	    end

	    sleep 0.1
	    i += 1
	  end
	end
		
end 


# way 1
# server = Server.new
# server.handle(/hello/i) { "Hello from server at #{Time.now}" } server.handle(/goodbye/i) { "Goodbye from server at #{Time.now}" } server.handle(/name is (\w+)/) { |m| "Nice to meet you #{m[1]}!" }
# server.run

# way 2
