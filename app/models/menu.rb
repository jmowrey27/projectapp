class Menu < ApplicationRecord
    validates_presence_of :name
    has_many :menu_items, dependent: :destroy

    accepts_nested_attributes_for :menu_items, reject_if: :all_blank
end
