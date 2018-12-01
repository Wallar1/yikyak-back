class VotesController < ApplicationController
  def create
    vote = Vote.new(vote_params)
    if(vote.save)
      BroadcastPostJob.perform_later(vote.post_id)
      head :ok
    end
  end

  def update
    vote = Vote.find(vote_params[:id])
    if(vote.update(vote_params))
      BroadcastPostJob.perform_later(vote.post_id)
      head :ok
    end
  end


  private

  def vote_params
    params.require(:vote).permit!
  end
end
