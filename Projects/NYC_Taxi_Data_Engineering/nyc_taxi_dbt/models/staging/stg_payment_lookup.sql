with payment_lookup as(
    select * from (values
        (0, 'Flex Fare Trip'),
        (1, 'Credit Card'),
        (2, 'Cash'),
        (3, 'No Charge'),
        (4, 'Dispute'),
        (5, 'Unknown'),
        (6, 'Voided Trip')
    ) t(payment_type_id, payment_type_description)
)

select payment_type_id, payment_type_description from payment_lookup

