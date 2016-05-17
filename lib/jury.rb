class Jury
	attr_accessor :members
	def initialize
		@members=[]
  	end
  	def add_member(new_name)
  		@members << new_name
  	end
  	def cast_votes(finalists)
  		tmp=[]
  		finalists.each{|x| tmp<<x.to_s}
		  final=Hash[tmp.zip (0...tmp.length)]
      final.keys.each{|k| final[k]=0}
		  @members.each{|member|  final[tmp[Random.rand((tmp.length))]]+=1
                              puts member}
  		final
  	end

    def report_votes(final_votes)
      final_votes.keys.each{|k| puts final_votes[k]}
    end

    def announce_winner(final_votes)
      final_votes.max_by{|k,v| v}[0]
    end
end