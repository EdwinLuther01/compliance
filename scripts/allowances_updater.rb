module AllowancesUpdater
  def self.perform!
    tag = Tag.where(name: 'active-in-AR').first
    Person.joins(:person_taggings).where(person_taggings: { tag: tag })
      .find_each do |person|

      Rails.logger.info "Processing person #{person.id}"

      next unless person.allowances.empty? ||
        person.allowances.all? { |a| a.amount.zero? }

      issue = person.issues.create
      issue.allowances_seed.create(amount: 25_000.0, kind: Currency.ars)
      issue.save!
      issue.approve!
    end
    Rails.logger.info 'End of job'
  end
end
