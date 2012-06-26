class Article < ActiveRecord::Base
  belongs_to :author
  
  has_and_belongs_to_many :tags
  
  accepts_nested_attributes_for :tags,
                                :allow_destroy => true,
                                :reject_if => proc {|attributes| attributes[:name].blank?}
  
  validates_presence_of :author_id, :title
  
  def self.search(str)
    str.blank? ? scoped :
      joins(:tags).
        where(
          "
            articles.title like :str or
            articles.content like :str or
            tags.name like :str
          ",
          {
            :str => "%#{str}%"
          }
        )
  end
  
  def get_truncated_content
    content.truncate(100)
  end
  
  def get_comma_separated_tags
    tags.map(&:name).join(", ")
  end
end
