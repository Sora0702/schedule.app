class Task < ApplicationRecord
  #タイトル、開始日、終了日は必須項目
  #タイトルは最大20文字
  #終了日は、開始日以降の日付
  #スケジュールメモは、最大５００文字
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_day, presence: true
  validates :finish_day, presence: true
  validates :memo, length: { maximum: 500 }
  validate :finish_day_not_be_before_start_day

  def finish_day_not_be_before_start_day
    unless start_day.nil? == true || finish_day.nil? == true
      if start_day > finish_day
        errors.add(:finish_day, "が開始日より前日となっています。")
      end
    end
  end
end
