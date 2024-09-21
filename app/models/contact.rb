class Contact < ApplicationRecord
    belongs_to :kind
    def author
        "Test"
    end

    def as_json(options={})
        super(root: true, methods: :author)
    end
end
