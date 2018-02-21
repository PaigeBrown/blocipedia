class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :wikis
  has_many :collaborators
  has_many :wiki_collabs, source: 'wiki', through: :collaborators
         
  enum role: [:standard, :admin, :premium]
  
  def downgrade!
     ActiveRecord::Base.transaction do
       self.update_attribute(:role, :standard)
       self.wikis.where(private: true).all.each do |wiki|
         wiki.update_attribute(:private, false)
       end
    end
  end
  
end
