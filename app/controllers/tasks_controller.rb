class TasksController < ApplicationController
  def index #予定一覧の表示画面
    @tasks = Task.all
  end

  def new #予定の新規作成画面
  end

  def create #予定の新規作成処理
  end

  def show #予定の詳細表示画面
  end

  def edit #予定の編集画面
  end

  def update #予定の編集処理
  end

  def destroy #予定の削除処理
  end
end
