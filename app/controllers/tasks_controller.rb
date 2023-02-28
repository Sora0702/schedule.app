class TasksController < ApplicationController
  def index #予定一覧の表示画面
    @tasks = Task.all
  end

  def new #予定の新規作成画面
    @task = Task.new
  end

  def create #予定の新規作成処理
    @task = Task.new(params.require(:task).permit(:title, :start_day, :finish_day, :all_day, :memo))
    if @task.save
      flash[:notice] = "新規のスケジュールを登録しました。"
      redirect_to :tasks
    else
      render "new"
    end
  end

  def show #予定の詳細表示画面
    @task = Task.find(params[:id])
  end

  def edit #予定の編集画面
    @task = Task.find(params[:id])
  end

  def update #予定の編集処理
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :start_day, :finish_day, :all_day, :memo))
      flash[:notice] = "スケジュールメモを更新しました。"
      redirect_to :tasks
    else
      render "edit"
    end
  end

  def destroy #予定の削除処理
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました。"
    redirect_to :tasks
  end
end
