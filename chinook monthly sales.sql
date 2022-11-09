/* Tim sales ingin mengetahui bagaimana performa harian dan bulanan penjualan track kita pada seluruh gerai */

WITH DF AS (
	SELECT INVI.InvoiceLineId, INV.InvoiceDate, TR.name as TrackName, TR.Composer, GR.name as Genre, INVI.UnitPrice, INVI.Quantity, INVI.UnitPrice*INVI.Quantity as Sales
	FROM invoice_items INVI
	JOIN invoices INV on INVI.InvoiceId = INV.InvoiceId
	JOIN tracks TR on INVI.TrackId = TR.TrackId 
	JOIN genres GR on TR.GenreId = GR.GenreId
	)

SELECT strftime('%Y', InvoiceDate) as Year,
	strftime('%m', InvoiceDate) as Month,
	sum(Sales) as SubTotalSales
FROM DF
GROUP BY Month, Year
ORDER BY Year, Month ASC
