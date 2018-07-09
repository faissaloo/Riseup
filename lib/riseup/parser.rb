require 'set'
module Riseup
class Parser
#This is a super basic markup language, none of the characters here are unsafe for HTML
	@@default_spec=Spec.new([
		#Escapes
		["\\*","*"],
		["\\=","="],
		["\\`","`"],
		["\\\\","\\"],
		#Bold
		["**","<b>","</b>"],
		#Italic
		["*","<i>","</i>"],
		#Header
		["=","<h1>","</h2>"],
		#Code
		["`","<code>","</code>"],
		#Newline
		["\n","<br/>"]
		])

	def initialize(unformated,spec=@@default_spec)
		if (!unformated.is_a?(String))
			raise ArgumentError.new("Unformated text (first argument) must be a String")
		end

		if (!spec.is_a?(Spec))
			raise ArgumentError.new("Markup specification (second argument) must be a Riseup::Spec")
		end
		@unformated=unformated
		@spec=spec
		tokens()
	end

	def tokens()
		@tokens = @unformated.split(@spec.regex).reject(&:empty?)
	end

	def parse()
		if (@tokens.nil?)
			tokens()
		end
		token_toggle=Set.new
		new_html=Array.new
		@tokens.each { |t|
			if (@spec.include?(t))
				if (token_toggle.include?(t))
					token_toggle.delete(t)
					if (!@spec[t].substitute?())
						new_html.append(@spec[t].finish)
					end
				else
					if (!@spec[t].substitute?())
						token_toggle.add(t)
						new_html.append(@spec[t].start)
					else
						new_html.append(@spec[t].substitute)
					end
				end
			else
				new_html.append(t)
			end
		}
		new_html.join()
	end

	def to_s()
		@tokens.to_s()
	end
end
end
