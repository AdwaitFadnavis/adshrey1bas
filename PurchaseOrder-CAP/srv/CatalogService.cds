using {
    anubhav.db.master,
    anubhav.db.transaction
} from '../db/DataModel.cds';


service CatalogService @(path : 'CatalogService') {

    //MasterData
    entity EmployeeSet        as projection on master.employees;
    entity AddressSet         as projection on master.address;
    entity ProductSet         as projection on master.product;
    entity BusinessPartnerSet as projection on master.businesspartner;

    //TransactionalData
    entity POs @(
        title               : 'Purchase Orders',
        odata.draft.enabled : false
    )                         as projection on transaction.purchaseorder {
        *,
        Items : redirected to PurchaseOrderItems
    } actions {
        action   Boost();
        function largestPO() returns array of POs;
    };

    entity PurchaseOrderItems as projection on transaction.poitems;

}
