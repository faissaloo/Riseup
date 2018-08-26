require 'set'
class TokenData
  def initialize(start, finish = nil)
    if finish.nil?
      @substitute = start
      @isSub = true
    else
      @start = start
      @finish = finish
      @isSub = false
    end
  end

  attr_reader :substitute

  attr_reader :start

  attr_reader :finish

  def substitute?
    @isSub
  end

  def all
    if substitute?
      [@substitute]
    else
      [@start, @finish]
    end
  end
end
