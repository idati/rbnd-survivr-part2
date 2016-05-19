
class Game 
  @@loosing_tribe=[]
	attr_reader :tribes
	def initialize*tribes
		@tribes = tribes
  	end

    def get_tribes
    @tribes
    end

   def add_tribe(tribe_new)
    @tribes << tribe_new
   end
   def get_tribe_by_name(name)
     @tribes.find_index{|tribe| tribe.name == name}
   end
   def immunity_challenge
    @@loosing_tribe = [] if @@loosing_tribe
    @@loosing_tribe << @tribes[Random.rand(@tribes.length)]
    @@loosing_tribe[0]
   end

   def loosing_tribe
    @@loosing_tribe[0]
   end
  

  def clear_tribes
    @tribes=[]
  end

  def merge(new_name)
    tmp=Tribe.new(name: new_name, members: (@tribes[0].members.clone + @tribes[1].members.clone))
    clear_tribes
    add_tribe(tmp)
    @tribes[0]
  end

  def individual_immunity_challenge
    
    @tribes[0].members[Random.rand(loosing_tribe.members.length)] 
  end

end