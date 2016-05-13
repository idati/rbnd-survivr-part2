class Tribe
	attr_reader :name, :members, :immunity_challenge
	def initialize(option={})
		puts @name
	#	@members
	#	@name=option[:name] if option[:name]
		@members = option[:members] if option[:members]
	#	puts @name
  	end
  	def tribal_council(option={})
  		#puts "iam imune #{option[:immune]}"
  		#puts @members
  		#tmp=@members.detect{|member| (member!=option[:immune])}
  		#@members.delete_if{|member| (member!=option[:immune])}
  		members_without_immune=@members.delete_if{|member| (member==option[:immune])}
  		tmp=members_without_immune[Random.rand((members_without_immune.length))]
  		#puts tmp.name
  	#	while tmp.name != option[:immune]
  	#		tmp=@members[Random.rand((@members.length))]
  	#	end
  		@members.delete(tmp)
  		tmp
  		#puts "i am imune: #{option[:immune]}"
  	end


  end