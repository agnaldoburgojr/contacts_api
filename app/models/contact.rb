class Contact < ApplicationRecord
  belongs_to :kind, optional: true

  # def author
  #   "Agnaldo Burgo Junior"
  # end

  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options={})
  #   super(
  #     methods: [:author, :kind_description],
  #     include: { kind: { only: :description} }
  #   )
  # end
end
