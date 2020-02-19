class TasksController < ApplicationController
    # 1 Read
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  # 2 Create
  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to(tasks_path)
  end

  # 3 Update
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path
  end

  # 4 Destroy
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
