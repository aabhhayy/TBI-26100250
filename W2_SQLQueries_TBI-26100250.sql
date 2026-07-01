CREATE DATABASE sakila;
USE sakila;

#Verify data loaded successfully
select count(*) from customer;

#***************************************************************************#
              # DOCUMENT-START #
# QUESTION-1 
#(2 basic SELECT + WHERE queries (filtering rows))
#query-1 List Active Customers
SELECT first_name,last_name,email
FROM customer
WHERE active = 1; 
#Insight
#eske use se actie users ko promotions messages share kr sakte hai

#Query-2 Display PG Rated Films
#Previewing film table structure
select * from film;
SELECT title,rating
FROM film
WHERE rating='PG'; 
#Insight
#yha se family content find krke recommend kr sakte hai
            # QUESTION -1 FINISH #
            
            
#Question-2 (1 ORDER BY query (sorting))
#Query 3: Sort Films by Length (Descending)
select title, length from film order by length DESC;
#Insight
#yha pr customer ko uski viewing preference ke hissab se movies recommend kr sakte hai
           # QUESTION -2 FINISH #

# QUESTION - 3 
#2 GROUP BY + aggregate function queries (COUNT, SUM, AVG)
#query-1 Count Films by Rating Category
SELECT rating,
       COUNT(*) AS total_films
FROM film
GROUP BY rating;
#Insight
#jha pe jayeda rating hai uss type ko choose krke campaign chala sakte hai 

#query-2 Calculate Total and Average Runtime by Rating
SELECT rating,
       SUM(length) AS total_runtime,
       round(AVG(length)) AS avg_length
FROM film
GROUP BY rating;
#Insight
#yha pr content library ko analysis kr sakte hai
           # Question-3 FINISH #
           


#Quetion-4 Ratings Having More Than 200 Films
#1 HAVING query (filter after grouping)
SELECT rating,
       COUNT(*)  AS total_films
FROM film
GROUP BY rating
HAVING COUNT(*) > 200;
#Insight
#yha pr clearly dekh sakte hai kiski rating jayeda hai or fir company uss hissab se new content create kr sakti hai
          # Question-4 FINISH #



#QUESTION-5
#2 INNER JOIN queries (combining tables)
#query-1  Customer Payment Details Using INNER JOIN
SELECT c.first_name,
c.last_name,
round(p.amount)
FROM customer c
INNER JOIN payment p
ON c.customer_id=p.customer_id;

#query-2  Film Categories with Total Movies
SELECT c.name,
       COUNT(*) AS category_count
FROM category c
INNER JOIN film_category fc
ON c.category_id = fc.category_id
GROUP BY c.name
Order by category_count DESC;
#Insight
#genre ke behalf pr jayeda se jayeda invest kr sakte hai
              #Question-5 FINISH #
              
              
#Question - 6
# (1 LEFT JOIN query (preserving records from one side))
# Customer Rental Activity Using LEFT JOIN
SELECT c.first_name,
       COUNT(r.rental_id) AS total_rentals
FROM customer c
LEFT JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY total_rentals DESC;
#Insight
#yha se jo jayeda loyal customers hai unko discounts or rewards de sakte hai taki or customers business ke engage kr sake

               # Question -6 FINISH #
               

#Question -7   Films with Above Average Rental Rate (Subquery)
# (1 subquery (a query inside another))
SELECT title,
rental_rate
FROM film
WHERE rental_rate >
(
SELECT AVG(rental_rate)
FROM film
)
order by rental_rate DESC;
#Insight
#Business identity kr sakta hai ki konsi movies ko premium-series me rakh sakte hai


#----------------------------------------------------#
# SQL MURDER MYSTERY FINAL SOLUTION
# Mastermind Identified: Miranda Priestly
#----------------------------------------------------#


INSERT INTO solution VALUES (1, 'Miranda Priestly');

SELECT value FROM solution;


                 # Document FINISHED #