class Welcome
	include ActiveModel::Model
	attr_accessor :name, :content
	validates :name, :content, presence: true
end
