  SELECT 
  p.Sector,
  p.[Year], 
  p.Jurisdiction, 
  p.UseOfFunds,
  p.CurrentDollars,
  p.CurrentDollarsPerCapita-(
		select 
			r.CurrentDollarsPerCapita 
			from HealthDataOLD r 
			where 
			r.Year=p.Year and 
			r.Jurisdiction=p.Jurisdiction  and
			r.UseOfFunds=p.UseOfFunds and
			r.Sector='Provincial/territorial government' 
				)
  from HealthDataOLD p where Sector='Public'

  