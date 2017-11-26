SELECT
	p.[Year], 
	p.Jurisdiction, 
	p.Sector,
	p.UseOfFunds,
	p.CurrentDollars,
	p.CurrentDollarsPerCapita
	FROM OriginalData p WHERE Sector='Private'
UNION
SELECT 
	p.[Year], 
	p.Jurisdiction, 
	p.Sector,
	p.UseOfFunds,
	p.CurrentDollars,
	p.CurrentDollarsPerCapita
	FROM OriginalData p WHERE Sector='Provincial/territorial government'
UNION
SELECT 
	p.[Year], 
	p.Jurisdiction, 
	'Other Public' Sector,
	p.UseOfFunds,
	p.CurrentDollars-(SELECT r.CurrentDollars FROM OriginalData r WHERE r.Year=p.Year and r.UseOfFunds=p.UseOfFunds and r.Sector='Provincial/territorial government' and r.Jurisdiction=p.Jurisdiction ) CurrentDollars,
	p.CurrentDollarsPerCapita-(SELECT r.CurrentDollarsPerCapita FROM OriginalData r WHERE r.Year=p.Year and r.UseOfFunds=p.UseOfFunds and r.Sector='Provincial/territorial government' and r.Jurisdiction=p.Jurisdiction ) CurrentDollarsPerCapita
	FROM OriginalData p WHERE Sector='Public'
ORDER BY p.[Year], p.Jurisdiction, p.sector, p.useoffunds