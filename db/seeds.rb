Rails.logger.info "Seeding db ..."
Answer.destroy_all
Answer.create(label: "Not at all", disabled: false)
Answer.create(label: "Several days", disabled: false)
Answer.create(label: "More than half the days", disabled: false)
Answer.create(label: "Nearly everyday", disabled: false)
Rails.logger.info "Answer.count: #{Answer.count}"
Rails.logger.info "Seeding process complete!!!"
