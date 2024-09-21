class Contact < ApplicationRecord
    belongs_to :kind #, optional: true
    #def author
    #    "Test"
    #end

    #def kind_description
    #    self.kind.description
    #end

    #def as_json(options={})
    #    super(root: true, methods: [:kind_description, :author])
    #end

    def i18n_default
        I18n.default_locale
    end
end
