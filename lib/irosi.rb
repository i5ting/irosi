require "irosi/version"
require "irosi/download"

module Irosi
  # Your code goes here...
	
	def self.parse(opts)
		puts '2222'
		puts opts.inspect
		n = opts[:num]
		b = opts[:begin]
		e = opts[:end]
		
		file = opts[:file] 
		debug_able = false;
		
		if File.directory?(file)
			puts 'exist path'
		else
			puts 'not exitst path'
		end
		
		if(b)
			# 下载从begin开始到end结束中间的所有专辑
			Rosi.download debug_able do
				 for num in "#{b}".."#{e}"
					 	item(num)
				 end
			end
			
		elsif(n)
			# 指定具体专辑id
			Rosi.download debug_able do
			 	item(n)
			end
		
		else
			puts '没有合法参数'
		end
	 
	end
end
