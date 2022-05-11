class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.where(item_name: item_name).any?
    end

    def give_away(other_dev, freebie)
        if freebie.dev_id == self.id
            freebie.update(dev_id = other_dev.id)
    end
end
