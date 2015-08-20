class PromotionDate < ActiveRecord::Base
  RANKS = ["Cfn/Pte", "LCpl", "Cpl", "Sgt", "SSgt", "WO2", "WO1", "2Lt", "Lt", "Capt", "Maj"]

  acts_as_paranoid
  belongs_to :employee

  validates :substantive_rank, presence: true, inclusion: { in: PromotionDate::RANKS }

  before_validation :set_rank_point

  private

  def set_rank_point
  	self.rank_point = PromotionDate::RANKS.index(self.substantive_rank)
  end
end
