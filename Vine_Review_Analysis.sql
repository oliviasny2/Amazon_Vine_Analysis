-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- check vine table populates correctly
select * from vine_table

-- Filter to total_votes >=20
select vt.review_id,
		vt.star_rating,
		vt.helpful_votes,
		vt.total_votes,
		vt.vine,
		vt.verified_purchase
into relevant_vines
from vine_table as vt
where total_votes >= 20;

-- check filtered table (relevant_vines) populates correctly
select * from relevant_vines;

-- Filter the relevant_vines table to helpful_votes/total_votes >= 0.5
select rv.review_id,
		rv.star_rating,
		rv.helpful_votes,
		rv.total_votes,
		rv.vine,
		rv.verified_purchase
into relevant_vines_v2
from relevant_vines as rv
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;

-- check that relevant_vines_v2 populates correctly
select * from relevant_vines_v2

-- Filter relevant_vines_v2 to vine == 'Y'
select rvv.review_id,
		rvv.star_rating,
		rvv.helpful_votes,
		rvv.total_votes,
		rvv.vine,
		rvv.verified_purchase
into relevant_vines_yes
from relevant_vines_v2 as rvv
where rvv.vine = 'Y'
;

-- Check that vine = yes table populates correctly
select * from relevant_vines_yes

-- Filter relevant_vines_v2 to vine = 'N'
select rvv.review_id,
		rvv.star_rating,
		rvv.helpful_votes,
		rvv.total_votes,
		rvv.vine,
		rvv.verified_purchase
into relevant_vines_no
from relevant_vines_v2 as rvv
where rvv.vine = 'N'
;

-- Check that vine = no table populates correctly
select * from relevant_vines_no

-- Total number of reviews
select Count(review_id) from vine_table;
select Count(review_id)
into total_count_vines_yes
from relevant_vines_yes;
select * from total_count_vines_yes;

select Count(review_id) 
into total_count_vines_no
from relevant_vines_no;
select * from total_count_vines_no;

-- Number of 5 star reviews
select Count(star_rating)
into five_star_vines_yes
from relevant_vines_yes
Where Cast(star_rating As Float) = 5;
select * from five_star_vines_yes;

select Count(star_rating)
into five_star_vines_no
from relevant_vines_no
Where Cast(star_rating As Float) = 5;
select * from five_star_vines_no;

-- Percentage of 5-star reviews
SELECT Round(((SELECT 1.0*five_star_vines_yes.count FROM five_star_vines_yes) /
        (SELECT total_count_vines_yes.count FROM total_count_vines_yes) * 100),2) 
		as percentage;
		
SELECT Round(((SELECT 1.0*five_star_vines_no.count FROM five_star_vines_no) /
        (SELECT total_count_vines_no.count FROM total_count_vines_no) * 100),2) 
		as percentage;	