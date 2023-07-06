SELECT * FROM billing;
SELECT * FROM leads;
SELECT * FROM sites;
SELECT * FROM clients;

/*Consulta 1*/

SELECT 'March' month, SUM(amount) as revenue FROM billing
WHERE CONVERT(charged_datetime,date) BETWEEN '2012-03-01' AND '2012-03-31';

/*Consulta 2*/

SELECT client_id, SUM(amount) as total_revenue FROM billing
WHERE client_id = 2;

/*Consulta 3*/

SELECT domain_name website, client_id FROM sites
WHERE client_id = 10;

/*Consulta 4*/

SELECT client_id, COUNT(domain_name) number_of_websites, monthname(created_datetime) month_created, year(created_datetime) year_created FROM sites
WHERE client_id = 1
GROUP BY monthname(created_datetime), year(created_datetime);

SELECT client_id, COUNT(domain_name) number_of_websites, monthname(created_datetime) month_created, year(created_datetime) year_created FROM sites
WHERE client_id = 20
GROUP BY monthname(created_datetime), year(created_datetime);

/*Consulta 5*/

SELECT s.domain_name website, COUNT(leads_id) number_of_leads, DATE_FORMAT(l.registered_datetime, "%M %d, %Y") date_generated FROM sites s
JOIN leads l ON l.site_id = s.site_id
WHERE CONVERT(l.registered_datetime,date) BETWEEN '2011-01-01' AND '2011-02-15'
GROUP BY DATE_FORMAT(l.registered_datetime, "%M %d, %Y");

/*Consulta 6*/

SELECT CONCAT(c.first_name, ' ', c.last_name) client_name, COUNT(l.leads_id) number_of_leads FROM clients c
JOIN sites s ON s.client_id  = c.client_id
JOIN leads l ON l.site_id = s.site_id
WHERE l.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY CONCAT(c.first_name, ' ', c.last_name);

/*Consulta 7*/

SELECT CONCAT(c.first_name, ' ', c.last_name) client_name, COUNT(l.leads_id) number_of_leads, monthname(l.registered_datetime) month_cgenerated FROM clients c
JOIN sites s ON s.client_id  = c.client_id
JOIN leads l ON l.site_id = s.site_id
WHERE YEAR(l.registered_datetime) = 2011 AND MONTH(l.registered_datetime) BETWEEN 1 AND 6
GROUP BY CONCAT(c.first_name, ' ', c.last_name), monthname(l.registered_datetime);

/*Consulta 8*/

SELECT CONCAT(c.first_name, ' ', c.last_name) client_name, s.domain_name website, COUNT(l.leads_id) number_of_leads, DATE_FORMAT(l.registered_datetime, "%M %d, %Y") date_generated FROM clients c
JOIN sites s ON s.client_id  = c.client_id
JOIN leads l ON l.site_id = s.site_id
WHERE l.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY s.client_id, CONCAT(c.first_name, ' ', c.last_name), s.domain_name
ORDER BY s.client_id;

SELECT CONCAT(c.first_name, ' ', c.last_name) client_name, s.domain_name website, COUNT(l.leads_id) number_of_leads FROM clients c
JOIN sites s ON s.client_id  = c.client_id
JOIN leads l ON l.site_id = s.site_id
GROUP BY s.client_id, s.domain_name
ORDER BY s.client_id, number_of_leads;

/*Consulta 9*/

SELECT CONCAT(c.first_name, ' ', c.last_name) client_name, SUM(b.amount) as Total_Revenue, monthname(b.charged_datetime) month_charge, year(b.charged_datetime) year_charge FROM billing b
JOIN clients c ON c.client_id = b.client_id
GROUP BY b.client_id, YEAR(charged_datetime), MONTH(charged_datetime)
ORDER BY b.client_id;

/*Consulta 10*/

SELECT CONCAT(c.first_name, ' ', c.last_name) client_name, GROUP_CONCAT(s.domain_name separator ' / ') sites FROM clients c
JOIN sites s ON s.client_id  = c.client_id
GROUP BY c.client_id;