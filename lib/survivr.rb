require "colorizr"
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
 @contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
 @contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
 @coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
 @hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
 @borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
	puts "----------------phase 1-----------------------".blue
	8.times do |variable|
		loosing_tribe=@borneo.immunity_challenge
		puts "round: #{variable+1}".green
		puts "loosing tribe: #{loosing_tribe}".red
		puts "loosing member: #{@borneo.loosing_tribe.tribal_council}"
    loosing_tribe.members.each{|member| print "#{member.name}, "}
		puts ""
	end
end

def phase_two
	puts "----------------phase 2-----------------------".blue
	3.times do |variable|
		puts "round: #{variable+1}".green
		puts "immune member: #{immune_member=@borneo.individual_immunity_challenge}"
		puts "loosing member: #{@borneo.get_tribes[0].tribal_council(immune: immune_member)}"
		@borneo.get_tribes[0].members.each{|member| print "#{member.name}, "}
		puts ""
	end

end

def phase_three
	puts "----------------phase 3-----------------------".blue
	7.times do |variable|
		puts "round: #{variable+1}".green
		puts "immune member: #{immune_member=@borneo.individual_immunity_challenge}"
		puts "loosing member: #{looser=@borneo.get_tribes[0].tribal_council(immune: immune_member)}"
		@jury.add_member(looser)
		@borneo.get_tribes[0].members.each{|member| print "#{member.name}, "}
		puts ""
	end

end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
 phase_one #8 eliminations
 @merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
 phase_two #3 more eliminations
 @jury = Jury.new
 phase_three #7 elminiations become jury members
 finalists = @merge_tribe.members #set finalists
 puts "Jury members are :"
 vote_results = @jury.cast_votes(finalists) #Jury members report votes
 @jury.report_votes(vote_results) #Jury announces their votes
 puts "And the final winner is ... : #{@jury.announce_winner(vote_results)}".yellow #Jury announces final winner
