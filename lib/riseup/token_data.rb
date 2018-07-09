require 'set'
class TokenData
	def initialize(start,finish=nil)
		if (finish.nil?)
			@substitute = start
			@isSub=true
		else
			@start=start
			@finish=finish
			@isSub=false
		end
	end

	def substitute()
		@substitute
	end
	
	def start()
		@start
	end

	def finish()
		@finish
	end

	def substitute?()
		@isSub
	end
	
	def all()
		if (substitute?())
			[@substitute]
		else
			[@start,@finish]
		end
	end
end
