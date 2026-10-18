select * 
from layoffs_staging2
;

select company, country, total_laid_off
from layoffs_staging2
where country = 'India' 
and total_laid_off is not null
;

select * 
from layoffs_staging2
where percentage_laid_off = 1 
and country ='India'
and total_laid_off is not null
;

select * 
from layoffs_staging2
;	

SELECT *
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off = 1
ORDER BY funds_raised_millions DESC
;

-- Companies with the biggest single Layoff

select company, total_laid_off
from layoffs_staging2
where total_laid_off is not null
order by company 
limit 5
;

select company, sum(total_laid_off) as  total_off
from layoffs_staging2

group by company
order by 2 desc
;

select company, total_laid_off
from layoffs_staging2
where total_laid_off is not null
order by 2 desc
;

select * 
from layoffs_staging2
where company='Amazon'
;

select * 
from layoffs_staging2
;

select substring(`date`,1, 7) as `month`, sum(total_laid_off) 
from layoffs_staging2
where `month` is not null
group by `month`
order by 1 asc
;

select * 
from layoffs_staging2
;

select substring(`date`, 1, 7) as `month`, sum(total_laid_off) as total_offs
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `month`
order by `month`
;

with rolling_total_cte as
(
select substring(`date`, 1, 7) as `month`, sum(total_laid_off) as total_offs
from layoffs_staging2

group by `month`
order by `month`
)
select `month`, sum(total_offs) over (order by `month` ) as rolling_total
from rolling_total_cte
;

select sum(total_laid_off) 
from layoffs_staging2
;

















































































































































































