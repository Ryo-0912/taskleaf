class Task < ApplicationRecord 
    before_validation :set_nameless_name
    validates :name, presence: true
    validate :validate_name_not_including_comma

    belongs_to :user

    scope :recent, -> { order(created_at: :desc) }

    private

    def validate_name_not_including_comma
        errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
    end

    def set_nameless_name
      self.name = '名前なし' if name.blank? #nilや空白であるときに'名前なし'という文字列を代入する
    end

end
