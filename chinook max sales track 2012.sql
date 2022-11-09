/*Setelah mengetahui bagaimana performa bulanannya, tim sales juga ingin mengetahui track mana yang menyumbang transaksi terbesar di tahun 2012*/

WITH DF AS (
	SELECT INVI.InvoiceLineId, INV.InvoiceDate, TR.name as TrackName, TR.Composer, GR.name as Genre, INVI.UnitPrice, INVI.Quantity, INVI.UnitPrice*INVI.Quantity as Sales
	FROM invoice_items INVI
	JOIN invoices INV on INVI.InvoiceId = INV.InvoiceId
	JOIN tracks TR on INVI.TrackId = TR.TrackId 
	JOIN genres GR on TR.GenreId = GR.GenreId 
	)

SELECT strftime('%Y', InvoiceDate) as Year, TrackName, sum(Sales) as SubTotalSales
FROM DF
GROUP BY Year, TrackName
HAVING Year = '2012'
ORDER BY SubTotalSales DESC