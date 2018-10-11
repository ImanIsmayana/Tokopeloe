class Product < ApplicationRecord

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  belongs_to :store
  has_many :pictures
  has_many :reviews

  belongs_to :user
  scope :not_exp, -> { where('expire > :date', date: DateTime.now) }

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :recent, -> { where('expire > :date', date: DateTime.now) }

def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

  private
# ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
