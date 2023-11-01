with 

source as (

    select * from {{ source('raw', 'bing') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        campgn_name as campaign_name,
        ads_cost, cast(ads_cost as float64)
        impression,
        click

    from source

)

select * from renamed
