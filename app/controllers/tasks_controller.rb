class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update, :edit, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(tasks_params)
    redirect_to tasks_path
  end

  def show
  end

  def edit
  end

  def update
    @task.update(tasks_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def to_index
    redirect_to tasks_path
  end

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
