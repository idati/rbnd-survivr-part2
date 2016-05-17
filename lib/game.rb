
class Game 
  @@loosing_tribe=[]
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
    @@loosing_tribe = [] if @@loosing_tribe != []
    @@loosing_tribe << @tribes[Random.rand(@tribes.length)]
    @@loosing_tribe[0]
   end

   def loosing_tribe
    @@loosing_tribe[0]
  end
  
  def clear_tribes
    @tribes.clear
  end

  def merge(new_name)
    Tribe.new({name: new_name, members: @tribes[0].members+@tribes[1].members})
  end

  def individual_immunity_challenge
    #loosing_tribe=immunity_challenge
    #puts "iam the looser #{loosing_tribe.members[Random.rand(loosing_tribe.members.length)]}"
    @@loosing_tribe[0].members[Random.rand(@@loosing_tribe[0].members.length)]
    #Contestant.new("TestS")
  end

end