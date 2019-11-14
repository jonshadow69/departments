class TopicsController < ApplicationController
  before_action :set_department
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = @department.topics
  end

  def show
  end

  def new
    @topic = @department.topics.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @topic = @department.topics.new(topic_params)

    if @topic.save
      redirect_to [@department, @topic]
    else
      render :new
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to [@department, @topic]
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to department_topics_path(@department)
  end

  private
    def set_department
      @department = Department.find(params[:department_id])
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name, :body)
    end
end
