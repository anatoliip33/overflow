class VotesController < ApplicationController
  layout false
  before_action :set_parent
  before_action :set_vote

  def vote
    @vote.kind = params[:kind]
    @vote.save
  end

  private

  def set_parent
   params.each do |name, parent_id|
     if name =~ /(.+)_id$/
       @parent = Regexp.last_match[1].classify.constantize.find(parent_id)
     end
   end
  end

  def set_vote
    @vote = Vote.find_or_initialize_by(votable: @parent, user: current_user)
  end
end
