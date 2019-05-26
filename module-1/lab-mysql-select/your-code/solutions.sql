###### CHALLENGE 1: WHO HAS PUBLISHED WHAT AND WHEN #######
###########################################################

# The information comes from three tables, author info from the authour table, the titles from the table titles and finally the publishers from table publishers.
# However, we need a join between authours and title_authours to reach the info from titles and publishers since they are n:m relations

select
    a.au_id "AUTHOR ID"
,   a.au_lname "LAST NAME"
,   a.au_fname "FIRST NAME"
,   t.title "TITLE"
,   p.pub_name "PUBLISHER"
from publications.authors a
inner join publications.titleauthor ta on ta.au_id = a.au_id 
inner join publications.titles t on t.title_id = ta.title_id
inner join publications.publishers p on p.pub_id = t.pub_id
order by a.au_id;

# Checking that the number of lines in the first query is the same as in the title_author table
select count(*) from publications.titleauthor

###### CHALLENGE 2: WHO HAVE PUBLISHED HOW MANY AT WHERE #######
################################################################

# In addition to challenge 1 table, an aggregation function needs to be used, this time the count of titles to understand how many books has each author written.

select
    a.au_id "AUTHOR ID"
,   a.au_lname "LAST NAME"
,   a.au_fname "FIRST NAME"
,   p.pub_name "PUBLISHER"
,   count(t.title_id) "TITLE COUNT"
from publications.authors a
inner join publications.titleauthor ta on ta.au_id = a.au_id
inner join publications.titles t on t.title_id = ta.title_id
inner join publications.publishers p on p.pub_id = t.pub_id
group by a.au_id,a.au_lname,a.au_fname,p.pub_name
order by count(t.title_id) DESC;

# To check if your output is correct, sum up the TITLE COUNT column. The sum number should be the same as the total number of records in Table titleauthor.
# I use the above table as an auxiliar table and sum all the lines from title count -- the result is 25 which is the same as the lines in title_authors table.
select sum(title_count)
from (select
    a.au_id "AUTHOR ID"
,   a.au_lname "LAST NAME"
,   a.au_fname "FIRST NAME"
,   p.pub_name "PUBLISHER"
,   count(t.title_id) title_count
from publications.authors a
inner join publications.titleauthor ta on ta.au_id = a.au_id
inner join publications.titles t on t.title_id = ta.title_id
inner join publications.publishers p on p.pub_id = t.pub_id
group by a.au_id,a.au_lname,a.au_fname,p.pub_name
order by count(t.title_id) DESC) auxiliar;


###### CHALLENGE 3: BEST SELLING AUTHORS #######
################################################

# This time we need to add they table sales which contains the units sold from eeach title
# A limit is included since the only info needed is from the best three authours

select
    a.au_id AUTHOR_ID
,   a.au_lname LAST_NAME
,   a.au_fname FIRST_NAME
,   sum(s.qty) TOTAL
from publications.authors a
inner join publications.titleauthor ta on ta.au_id = a.au_id
inner join publications.titles t on t.title_id = ta.title_id
inner join publications.sales s on s.title_id = ta.title_id
group by AUTHOR_ID,LAST_NAME,FIRST_NAME
order by TOTAL DESC
limit 3


###### CHALLENGE 4: BEST SELLING AUTHORS RANKING #######
########################################################

# Now, we are ask to display all of the authors even those who havent sold anny unit.
# In order to do that the join with the sales table needs to be left, 
# because if the author hasnt sold any unit if they are not in the sales table, the query of challenge 3 would discard these cases
# Also, coalesce function is used because we want to display a 0 instead of a null.

select
    a.au_id AUTHOR_ID
,   a.au_lname LAST_NAME
,   a.au_fname FIRST_NAME
,   coalesce(sum(s.qty),0) TOTAL
from publications.authors a
left join publications.titleauthor ta on ta.au_id = a.au_id
left join publications.titles t on t.title_id = ta.title_id
left join publications.sales s on s.title_id = ta.title_id
group by AUTHOR_ID,LAST_NAME,FIRST_NAME
order by TOTAL DESC;


###### BONUS: MOST PROFITING AUTHORS #######
############################################

# Now, the profits of each book in terms of advance and royaly is included in the table titles -- no need to use sales table
# A combination of two sums is needed

select
    a.au_id AUTHOR_ID
,   a.au_lname LAST_NAME
,   a.au_fname FIRST_NAME
,   (sum(t.royalty)+sum(t.advance)) PROFIT
from publications.authors a
INNER join publications.titleauthor ta on ta.au_id = a.au_id
INNER join publications.titles t on t.title_id = ta.title_id
group by AUTHOR_ID,LAST_NAME,FIRST_NAME
order by PROFIT DESC
limit 3;
















