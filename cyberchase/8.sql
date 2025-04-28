select count("episode_in_season")
from "episodes"
where air_date BETWEEN '2018-01-01' AND '2023-12-31'
