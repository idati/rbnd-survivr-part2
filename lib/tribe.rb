class Tribe
  attr_accessor :name, :members

  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]
    puts "#{@name}".red
  end
  def to_s
    @name
  end
  def tribal_council(option={})
      @tmp_members = @members.clone
  		members_without_immune=@tmp_members.delete_if{|member| (member==option[:immune])}
      tmp=members_without_immune[Random.rand((members_without_immune.length))]
  		@members.delete(tmp)
  		tmp
  	end


  end