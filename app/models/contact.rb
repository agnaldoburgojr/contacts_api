class Contact < ApplicationRecord
  belongs_to :kind

  def author
    "Agnaldo Burgo Junior"
  end

  def as_json(options={})
    super(methods: :author)
  end
end
