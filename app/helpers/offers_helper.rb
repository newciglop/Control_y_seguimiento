module OffersHelper

  def submission_obs(offer)
  @public_date = Offer.where(id:offer).map{|x| x.publication_date}[0]
  @date_submission_obs = Offer.where(id:offer).map{|x| x.date_submission_obs}[0]
  o = Offer.where(id:offer).map{|x| x.date_submission_obs}.to_a[0].to_s
  @year =  o[0..3]
  @month =  o[5..6]
  @day = o[8..9]

  @remaining_days_obs = (@date_submission_obs - @public_date)/86400
  @remaining_hours_obs = (@date_submission_obs - @public_date)/3600

  end

  def observations_report(offer)
    @public_date = Offer.where(id:offer).map{|x| x.publication_date}[0]
    @date_publication_obs_report = Offer.where(id:offer).map{|x| x.date_publication_observations_report}[0]
    o = Offer.where(id:offer).map{|x| x.date_publication_observations_report}.to_a[0].to_s

    @year_obs_report =  o[0..3]
    @month_obs_report =  o[5..6]
    @day_obs_report = o[8..9]

    n1 = @date_publication_obs_report
    n2 = @public_date

    @remaining_days_obs_report = (n1 - n2)/86400
    @remaining_hours_obs_report = (n1 - n2)/3600

  end

  def deadline_submission_offers(offer)
    @public_date = Offer.where(id:offer).map{|x| x.publication_date}[0]
    @date_deadline_sub_offers = Offer.where(id:offer).map{|x| x.date_deadline_submission_offers}[0]
    o = Offer.where(id:offer).map{|x| x.date_deadline_submission_offers}.to_a[0].to_s

    @year_deadline_sub_offers =  o[0..3]
    @month_deadline_sub_offers =  o[5..6]
    @day_deadline_sub_offers = o[8..9]

    n1 = @date_deadline_sub_offers
    n2 = @public_date

    @remaining_days_dead_sub_offers = (n1 - n2)/86400
    @remaining_hours_dead_sub_offers = (n1 - n2)/3600

  end



end
