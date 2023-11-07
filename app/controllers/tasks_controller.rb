class TasksController < ApplicationController
def index
# display all tasks
# for each task, put a checkbox and display in a list?? maybe iterate in html
  @tasks = Task.all
end
def show
  @task = Task.find(params[:id])
end
def new
  @task = Task.new
end
def create
  @task = Task.new(task_params)
  @task.save
  redirect_to task_path(@task)
end
def edit
  @task = Task.find(params[:id])
end
def update
  @task = Task.find(params[:id])
  @task.update(task_params)
  redirect_to task_path(@task)
end
def destroy
  @task = Task.find(params[:id])
  @task.destroy
  redirect_to task_path(@task), status: :see_other
end

private

def task_params
  params.require(:task).permit(:name, :details, :completed)
end
end
