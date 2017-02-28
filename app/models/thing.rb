class Thing < ActiveRecord::Base
  validates_presence_of :name

  has_many :thing_images, inverse_of: :thing, dependent: :destroy

  scope :not_linked, ->(image) { where.not(:id=>ThingImage.select(:thing_id)
                                                .where(:image=>image)) }
end
