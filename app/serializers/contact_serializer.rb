class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate#, :author

  belongs_to :kind do
    link(:kind) {
      kind_url(object.kind.id)
    }
  end

  has_many :phones
  has_one :address
  # def attributes(*args)
  #   h = super(*args)
  #   h[:birthdate] = I18n.l(object.birthdate) unless object.birthdate.blank?
  #   h
  # end

  # def author
  #   "Agnaldo Burgo Junior"
  # end

  link(:self) {
    contact_url(object.id)
  }

  link(:kind) {
    kind_url(object.kind.id)
  }

  meta do
    { author: "Agnaldo"}
  end

  def birthdate
    #ptBR
    #I18n.l(object.birthdate) unless object.birthdate.blank?
    object.birthdate.to_time.iso8601 unless object.birthdate.blank?
  end
end
