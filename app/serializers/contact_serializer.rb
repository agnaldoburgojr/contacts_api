class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  # def attributes(*args)
  #   h = super(*args)
  #   h[:birthdate] = I18n.l(object.birthdate) unless object.birthdate.blank?
  #   h
  # end

  def birthdate
    #ptBR
    #I18n.l(object.birthdate) unless object.birthdate.blank?
    object.birthdate.to_time.iso8601 unless object.birthdate.blank?
  end
end
