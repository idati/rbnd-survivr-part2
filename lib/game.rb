
class Game 
	attr_accessor :tribes
	def initialize(tribeA, tribeB)
    @tribes=[]
		@tribes << tribeA
    @tribes << tribeB
  	end


   def add_tribe(tribe_new)
    @tribes << tribe_new
   end

   def immunity_challenge
    test=Tribe.new
   end
  
  def clear_tribes
    @tribes.clear
  end

  def merge(new_name)
    add_tribe(new_name)
  end

end