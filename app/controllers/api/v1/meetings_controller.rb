class Api::V1::MeetingsController < ApplicationController
  def index
    meetings = Meeting.all
    render json: meetings
  end

  def create
    meeting = Meeting.new(
      date: params[:date],
      time: params[:time]
    )

    if meeting.save
      render json: meeting, status: :created
    else 
      render json: { errors: meeting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    meeting = Meeting.find(params[:id])
    render json: meeting
  end

  def update
    meeting = Meeting.find(params[:id])

    if meeting.update(
      date: params[:date] || meeting.date,
      time: params[:time] || meeting.time
    )
      render json: meeting
    else
      render json: {errors: meeting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    meeting = Meeting.find(params[:id])
    meeting.destroy
    render json: { message: 'Meeting removed from Schedule' }, status: :ok
  end
end
