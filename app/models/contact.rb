class Contact < ApplicationRecord
  belongs_to :kind, optional: true

  def birthdate_br
    I18n.l(self.birthdate) unless self.birthdate.blank?
  end
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
