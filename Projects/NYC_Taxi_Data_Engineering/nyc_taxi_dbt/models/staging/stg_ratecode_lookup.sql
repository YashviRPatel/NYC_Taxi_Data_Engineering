with ratecode_mapping as(
    select * from (values
        (1, 'Standard Fare'),
        (2, 'Pickup Borough Manhattan, Dropoff Borough JFK Airport'),
        (3, 'Pickup Borough within city, Dropoff Borough EWR'),
        (4, 'Nassau or Westchester'),
        (5, 'Negotiated Fare'),
        (6, 'Group Ride'),
        (99, 'Null/unknown')
    ) as t(ratecode_id, ratecode_description)
)

select ratecode_id, ratecode_description from ratecode_mapping