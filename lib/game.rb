
class Game 
  @@loosing_tribe=[]
	attr_accessor :tribes
	def initialize(tribeA, tribeB)
    @tribes=[]
		@tribes << tribeA
    @tribes << tribeB
  	end

    def get_tribes
    @tribes
    end

   def add_tribe(tribe_new)
    @tribes << tribe_new
   end
   def get_tribe_by_name(name)
    i=false
    i=0 if @tribes[0] == name
    i=1 if @tribes[1] == name
    i
   end
   def immunity_challenge
    @@loosing_tribe = [] if @@loosing_tribe
    @@loosing_tribe << @tribes[Random.rand(@tribes.length)]
    @@loosing_tribe[0]
   end

   def loosing_tribe
    @@loosing_tribe[0]
  end
  
  def merge_loosing_tribe
     @@loosing_tribe=[]
     @@loosing_tribe<<@tribes[2].clone
  end

  def clear_tribes
    @tribes=[]
  end

  def merge(new_name)
    Tribe.new(name: new_name, members: (@tribes[0].members.clone + @tribes[1].members.clone))
  end

  def individual_immunity_challenge
    immunity_challenge if !loosing_tribe
    loosing_tribe.members[Random.rand(loosing_tribe.members.length)] 
  end

end