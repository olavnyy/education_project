# Define Student class
class Student < ApplicationRecord
  belongs_to :school
  belongs_to :group
  has_and_belongs_to_many :parents, class_name: 'Parent'
  has_one :health_info
  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "70x70>" }, default_url: "http://grdevday.org/wp-content/uploads/2016/02/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  accepts_nested_attributes_for :health_info

  has_many :daily_reports, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :my_days, dependent: :destroy

  validates :first_name, presence: true,
                         length: { maximum: 15 }
  validates :last_name, presence: true,
                        length: { maximum: 20 }
  validates :age, numericality: { greater_than: 2,
                                  less_than: 10 }
end
