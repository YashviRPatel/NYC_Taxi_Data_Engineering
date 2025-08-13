with vendor_mapping as(
    select * from (values
        (1, 'Creative Mobile Technologies LLC'),
        (2, 'Curb Mobility LLC'),
        (6, 'Myle Technologies Inc'),
        (7, 'Helix')
    ) as t(vendor_id, vendor_name)
)

select vendor_id, vendor_name from vendor_mapping