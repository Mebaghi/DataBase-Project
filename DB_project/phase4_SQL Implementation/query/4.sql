Select c.education , p.phone_num
from co_clerk c
join phone_number p
On p.id = c.id AND education  = 'phd'