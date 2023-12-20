"""
write a SQL query to find the 10 locations with the highest normal ocean surface temperature, sorted warmest to coldest. 
If two locations have the same normal ocean surface temperature, sort by latitude, smallest to largest. 
Include latitude, longitude, and surface temperature columns
"""

SELECT "0m", "longitude", "latitude" FROM "normals" ORDER BY "0m" DESC, "latitude" DESC LIMIT 10;
