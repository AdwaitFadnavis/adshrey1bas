using {anubhav.db} from '../db/datamodel';


service CatalogService @(path : 'CatalogService', requires: 'authenticated-user') {

    entity AddressSet         as projection on db.master.address;
    entity BusinessPartnerSet as projection on db.master.businesspartner;
    entity EmployeesSet       as projection on db.master.employees;
    entity productSet         as projection on db.master.product;


    entity POs @(
        odata.draft.enabled: true
    )   as projection on db.transaction.purchaseorder {
        *,
        Items : redirected to PurchaseOrderItems,
        case OVERALL_STATUS
        when 'P' then 'Planned'
        when 'B' then 'Booked'
        when 'D' then 'Delivered'
        when 'N' then 'New'
        end as OVERALL_STATUS1: String @title : '{i18n>OVERALL_STATUS1}',

        case OVERALL_STATUS
        when 'P' then '3'
        when 'B' then '1'
        when 'D' then '3'
        when 'N' then '2'
        end as Criticality: Integer 
    } actions {
        action boost();
        function largestOrder() returns array of POs;
    };

    entity PurchaseOrderItems as projection on db.transaction.poitems;
}
