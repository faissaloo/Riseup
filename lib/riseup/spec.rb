require 'set'

module Riseup
  class Spec
    def initialize(spec)
      unless spec.is_a?(Array)
        raise ArgumentError, 'Specification must be an array'
      end
      spec.each_with_index do |i, j|
        unless i.is_a?(Array)
          raise ArgumentError, "Specification item #{j} must be an array"
        end
        if i.size < 2
          raise ArgumentError, "Specification item #{j} is too small, must contain at least 2 items"
        end
        if i.size > 3
          raise ArgumentError, "Specification item #{j} is too largw, must contain no more than 3 items"
        end
      end
      @spec = spec
      @spec_map = Hash[@spec.collect { |t| [t[0], TokenData.new(t[1], t[2])] }]
      @tokens = @spec.map { |t| t[0] }
      # (?x)
      @regex = Regexp.new('(' + (@tokens.map { |t| Regexp.escape(t) }).join('|') + '|[.])')
    end

    def [](key)
      @spec_map[key]
    end

    def include?(x)
      @spec_map.include?(x)
    end

    attr_reader :regex

    attr_reader :tokens
  end
end
