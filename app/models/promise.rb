class Promise < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :category

  validates_presence_of :title, :description, :candidate_id, :category_id, :status, :date
  validates :status, inclusion: {in: :status_enum, allow_nil: true}

  def status_enum
    ['accomplished', 'in_progress', 'not_accomplished']
  end

  def status_enum_i18n
    status_enum.collect{|s| 
      [I18n.t("promises.status.#{s}"), s]
    }
  end
end
