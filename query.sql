
-- to select schema and table name
select s.name schemaname,t.name  tablename from sys.schemas s 
join sys.tables t 
on s.schema_id=t.schema_id
where s.name='sales' or s.name='production'
order by t.name

/******************************************/
--to select schema, table , column name and also number of columns for each table
select s.name sch,t.name tab,c.name col,
ROW_NUMBER() OVER (
      PARTITION BY t.name
      ORDER BY t.name) ranks
from sys.schemas s join sys.tables t
on s.schema_id=t.schema_id
join sys.columns c on c.object_id=t.object_id
where s.name='sales' or s.name='production'


