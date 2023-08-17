class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path
  end

  def edit; end

  def update
    @task = Task.update(task_params)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
