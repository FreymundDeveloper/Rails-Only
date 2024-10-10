class Contact < ApplicationRecord
    belongs_to :kind #, optional: true
    has_many :phones
    has_one :address

    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :address, update_only: true

    #def author
    #    "Test"
    #end

    #def kind_description
    #    self.kind.description
    #end

    #def as_json(options={})
    #    super(root: true, methods: [:kind_description, :author])
    #end

    def local_setting(birthdate)
        I18n.l(birthdate) unless birthdate.blank?
    end

    def to_locale
        { 
            name: self.name, 
            email: self.email,
            birthdate: local_setting(self.birthdate)
        }
    end

    def as_json(options={})
        h = super(options)
        h[:birthdate] = local_setting(self.birthdate)
        h
    end

    def i18n_default
        I18n.default_locale
    end
end
